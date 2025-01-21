#!/bin/bash

# 远程仓库地址
REPO_URL="https://github.com/vtyug/yug-server.git"

cleanup() {
    if [ -d "$TARGET_DIR" ]; then
        echo -e "\n清理临时目录 $TARGET_DIR..."
        rm -rf "$TARGET_DIR"
    fi
    exit 1
}

# 设置信号处理
trap cleanup SIGINT SIGTERM SIGQUIT

# 检查命令行参数
if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
    echo "用法: $0 [目标目录名称] [proto子目录]"
    echo "示例:"
    echo "  $0 my-proto           # 克隆整个 proto 目录"
    echo "  $0 my-proto user      # 只克隆 proto/user 目录"
    exit 1
fi

# 设置目标目录名称
TARGET_DIR="$1"

# 设置要克隆的子目录（如果指定）
SUB_DIR=""
if [ ! -z "$2" ]; then
    SUB_DIR="$2"
    echo "将只克隆 proto/$SUB_DIR 目录"
fi

# 检查目标目录是否已存在
if [ -d "$TARGET_DIR" ]; then
    echo "目录 $TARGET_DIR 已存在，请指定一个新的目录名或删除现有目录"
    exit 1
fi

# 检查当前目录是否存在 proto 目录
PROTO_DIR="lib/common/net/grpcs/proto"
if [ ! -d "$PROTO_DIR" ]; then
    echo "错误：没有找到 $PROTO_DIR 目录，请在项目根目录下运行此脚本"
    exit 1
fi

echo "开始从 $REPO_URL 克隆到 $TARGET_DIR..."

# 执行克隆和清理操作
mkdir "$TARGET_DIR" && \
cd "$TARGET_DIR" && \
git clone --no-checkout --depth 1 $REPO_URL . && \

git sparse-checkout init --cone && \
if [ -z "$SUB_DIR" ]; then
    git sparse-checkout set proto
else
    git sparse-checkout set proto/$SUB_DIR
fi && \
git checkout && \
mkdir temp && \
if [ -z "$SUB_DIR" ]; then
    mv proto temp/ && \
    rm -rf $(ls -A | grep -v temp) && \
    mv temp/proto . && \
    rm -rf temp
else
    mv proto/$SUB_DIR temp/ && \
    rm -rf $(ls -A | grep -v temp) && \
    mkdir -p proto && \
    mv temp/$SUB_DIR proto/ && \
    rm -rf temp
fi

if [ $? -eq 0 ]; then
    echo "✅ 成功克隆到 $TARGET_DIR"
    
    if [ ! -z "$SUB_DIR" ]; then
        cd ..
        echo "是否要用克隆的 proto 文件替换当前目录中对应的文件? [y/N]"
        read -r response
        if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
            echo "开始替换 proto 文件..."
            
            # 找出所有非backend的proto文件
            echo "正在搜索目录: $PROTO_DIR/$SUB_DIR"
            find "$PROTO_DIR/$SUB_DIR" -name "*.proto" | grep -v "backend" || true
            echo "----------------------------------------"
            
            # 使用兼容的方式读取文件列表
            available_files=()
            while IFS= read -r line; do
                available_files+=("$line")
            done < <(find "$PROTO_DIR/$SUB_DIR" -name "*.proto" | grep -v "backend")
            
            # 如果没有找到文件，显示错误信息
            if [ ${#available_files[@]} -eq 0 ]; then
                echo "错误：在目录 $PROTO_DIR/$SUB_DIR 中没有找到任何 proto 文件"
                echo "当前目录内容："
                ls -la "$PROTO_DIR/$SUB_DIR" || true
                cleanup
            fi
            
            # 创建一个关联数组来跟踪选择状态
            declare -A selected_status
            
            # 当前选中的项目
            current_item=0
            total_items=${#available_files[@]}
            
            # 清除屏幕并移动光标到顶部
            clear_and_show() {
                clear
                echo "可用的proto文件: (使用↑↓键移动，空格键选择，回车确认)"
                echo "----------------------------------------"
                for i in "${!available_files[@]}"; do
                    file=${available_files[$i]#"$PROTO_DIR/"}
                    if [ $i -eq $current_item ]; then
                        echo -n ">"
                    else
                        echo -n " "
                    fi
                    
                    if [ "${selected_status[$i]}" == "1" ]; then
                        echo " [X] $file"
                    else
                        echo " [ ] $file"
                    fi
                done
                echo "----------------------------------------"
                echo "操作说明："
                echo "↑/↓: 移动选择"
                echo "空格: 切换选中状态"
                echo "a: 全选"
                echo "n: 取消全选"
                echo "回车: 完成选择"
            }
            
            # 读取单个字符
            read_char() {
                if [ -t 0 ]; then  # 确保是在终端中运行
                    stty -echo -icanon min 1
                fi
                IFS= read -r -n1 char
                echo "$char"
            }
            
            # 设置终端为非规范模式
            if [ -t 0 ]; then
                old_stty_settings=$(stty -g)
                stty -echo -icanon min 1
            fi
            
            # 标记是否完成选择
            selection_done=false
            
            while [ "$selection_done" = false ]; do
                clear_and_show
                
                char=$(read_char)
                
                case "$char" in
                    $'\e')  # ESC序列开始
                        read -r -n2 arrow
                        case "$arrow" in
                            '[A')  # 上箭头
                                if [ $current_item -gt 0 ]; then
                                    current_item=$((current_item - 1))
                                fi
                                ;;
                            '[B')  # 下箭头
                                if [ $current_item -lt $((total_items - 1)) ]; then
                                    current_item=$((current_item + 1))
                                fi
                                ;;
                        esac
                        ;;
                    ' ')  # 空格键
                        if [ "${selected_status[$current_item]}" == "1" ]; then
                            selected_status[$current_item]="0"
                        else
                            selected_status[$current_item]="1"
                        fi
                        ;;
                    'a')  # a键
                        for i in "${!available_files[@]}"; do
                            selected_status[$i]="1"
                        done
                        ;;
                    'n')  # n键
                        for i in "${!available_files[@]}"; do
                            selected_status[$i]="0"
                        done
                        ;;
                    '')  # 回车键
                        selection_done=true
                        clear
                        break
                        ;;
                esac
            done
            
            # 恢复终端设置
            if [ -t 0 ]; then
                stty "$old_stty_settings"
            fi
            
            # 将选中的文件添加到selected_files数组
            selected_files=()
            for i in "${!available_files[@]}"; do
                if [ "${selected_status[$i]}" == "1" ]; then
                    selected_files+=("${available_files[$i]}")
                fi
            done
            
            # 如果没有选择任何文件，退出
            if [ ${#selected_files[@]} -eq 0 ]; then
                echo "未选择任何文件，操作取消"
                exit 0
            fi
            
            echo "是否需要备份原有文件? [y/N]"
            read -r backup_response
            
            BACKUP_DIR=""
            if [[ "$backup_response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
                BACKUP_DIR="proto_backup_$(date +%Y%m%d_%H%M%S)"
                mkdir -p "$BACKUP_DIR/$PROTO_DIR"
                echo "将备份文件到 $BACKUP_DIR 目录"
            fi
            
            # 使用选中的文件列表进行操作
            for proto_file in "${selected_files[@]}"; do
                # 获取相对路径
                rel_path=${proto_file#"$PROTO_DIR/"}
                # 设置源文件路径（从临时克隆目录）
                source_path="$TARGET_DIR/proto/$rel_path"
                # 设置目标文件路径
                target_path="$PROTO_DIR/$rel_path"
                
                if [ -f "$target_path" ] && [ ! -z "$BACKUP_DIR" ]; then
                    echo "备份: $target_path"
                    cp "$target_path" "$BACKUP_DIR/$PROTO_DIR/"
                fi
                
                # 创建目标目录（如果不存在）
                target_dir=$(dirname "$target_path")
                mkdir -p "$target_dir"
                
                # 复制新文件
                echo "更新: $target_path"
                cp "$source_path" "$target_path"
            done
            
            # 清理临时目录
            rm -rf "$TARGET_DIR"
            
            echo "✅ 替换完成"
            if [ ! -z "$BACKUP_DIR" ]; then
                echo "原文件已备份到 $BACKUP_DIR 目录"
                echo "如果需要恢复某个文件，可以从备份目录中复制回来"
            fi

            # 询问是否要编译proto文件
            echo "是否要立即编译生成dart文件? [y/N]"
            read -r compile_response
            if [[ "$compile_response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
                echo "开始编译proto文件..."
                # 保存当前目录
                current_dir=$(pwd)
                # 回到项目根目录
                cd "$(pwd)" || exit 1
                if [ -f "Makefile" ]; then
                    make proto m="$SUB_DIR"
                    make_result=$?
                    if [ $make_result -eq 0 ]; then
                        echo "✅ proto文件编译完成"
                    else
                        echo "❌ proto文件编译失败"
                    fi
                else
                    echo "❌ 在目录 $(pwd) 下没有找到 Makefile"
                    ls -la
                fi
            fi
        else
            echo "未进行替换，克隆的文件保留在 $TARGET_DIR 目录中"
        fi
    fi
else
    echo "❌ 克隆过程中发生错误"
    exit 1
fi 