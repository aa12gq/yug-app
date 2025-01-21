#!/bin/bash

# 远程仓库地址
REPO_URL="https://github.com/vtyug/yug-server.git"

# 检查命令行参数
if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
    echo "用法: $0 [proto子目录]"
    echo "示例:"
    echo "  $0 user      # 获取 proto/user 目录"
    exit 1
fi

# 设置要获取的子目录
SUB_DIR="$1"
PROTO_DIR="lib/common/net/grpcs/proto"

# 保存当前工作目录
WORK_DIR=$(pwd)

# 检查当前目录是否存在 proto 目录
if [ ! -d "$PROTO_DIR" ]; then
    echo "错误：没有找到 $PROTO_DIR 目录，请在项目根目录下运行此脚本"
    exit 1
fi

echo "开始从 $REPO_URL 获取 proto/$SUB_DIR 目录..."

# 创建临时工作目录
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR" || exit 1

# 使用快速克隆方式获取文件
git clone --depth 1 --filter=blob:none --no-checkout $REPO_URL . && \
git sparse-checkout init --cone && \
git sparse-checkout set "proto/$SUB_DIR" && \
git checkout HEAD

if [ $? -eq 0 ] && [ -d "proto/$SUB_DIR" ]; then
    echo "✅ 成功获取文件"
    
    # 找出所有非backend的proto文件
    echo "正在搜索目录: proto/$SUB_DIR"
    find "proto/$SUB_DIR" -name "*.proto" | grep -v "backend" || true
    echo "----------------------------------------"
    
    # 使用兼容的方式读取文件列表
    available_files=()
    while IFS= read -r line; do
        available_files+=("$line")
    done < <(find "proto/$SUB_DIR" -name "*.proto" | grep -v "backend")
    
    # 如果没有找到文件，显示错误信息
    if [ ${#available_files[@]} -eq 0 ]; then
        echo "错误：在目录 proto/$SUB_DIR 中没有找到任何 proto 文件"
        cd "$WORK_DIR" || exit 1
        rm -rf "$TEMP_DIR"
        exit 1
    fi
    
    echo "是否要用获取的 proto 文件替换当前目录中对应的文件? [y/N]"
    read -r response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        echo "开始替换 proto 文件..."
        
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
                file=${available_files[$i]#"proto/"}
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
            cd "$WORK_DIR" || exit 1
            rm -rf "$TEMP_DIR"
            exit 0
        fi
        
        echo "是否需要备份原有文件? [y/N]"
        read -r backup_response
        
        BACKUP_DIR=""
        if [[ "$backup_response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
            BACKUP_DIR="$WORK_DIR/proto_backup_$(date +%Y%m%d_%H%M%S)"
            mkdir -p "$BACKUP_DIR/$PROTO_DIR"
            echo "将备份文件到 $BACKUP_DIR 目录"
        fi
        
        # 复制文件到目标目录
        for proto_file in "${selected_files[@]}"; do
            # 获取相对路径
            rel_path=${proto_file#"proto/"}
            target_path="$WORK_DIR/$PROTO_DIR/$rel_path"
            source_path="$TEMP_DIR/$proto_file"
            
            echo "检查源文件: $source_path"
            if [ ! -f "$source_path" ]; then
                echo "错误：源文件不存在"
                continue
            fi
            echo "源文件内容预览:"
            head -n 1 "$source_path"
            
            if [ -f "$target_path" ] && [ ! -z "$BACKUP_DIR" ]; then
                echo "备份: $target_path"
                cp -v "$target_path" "$BACKUP_DIR/$PROTO_DIR/"
            fi
            
            # 创建目标目录（如果不存在）
            target_dir=$(dirname "$target_path")
            mkdir -p "$target_dir"
            
            # 复制新文件
            echo "更新: $target_path"
            cp -f "$source_path" "$target_path"
            
            # 验证文件是否成功复制
            if [ $? -eq 0 ] && [ -f "$target_path" ]; then
                echo "✅ 文件成功复制到: $target_path"
                echo "新文件内容预览:"
                head -n 1 "$target_path"
            else
                echo "❌ 文件复制失败"
            fi
            echo "----------------------------------------"
        done
        
        echo "✅ 替换完成"
        if [ ! -z "$BACKUP_DIR" ]; then
            echo "原文件已备份到 $BACKUP_DIR 目录"
        fi
        
        # 询问是否要编译proto文件
        echo "是否要立即编译生成dart文件? [y/N]"
        read -r compile_response
        if [[ "$compile_response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
            echo "开始编译proto文件..."
            cd "$WORK_DIR" || exit 1
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
    fi
else
    echo "❌ 获取文件失败"
fi

# 清理临时目录
cd "$WORK_DIR" || exit 1
rm -rf "$TEMP_DIR" 