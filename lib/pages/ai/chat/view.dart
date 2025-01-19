import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_app/common/index.dart';

import 'index.dart';

class AIChatPage extends GetView<AIChatController> {
  const AIChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AIChatController>(
      init: AIChatController(),
      id: "ai_chat",
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: GestureDetector(
              onTap: _showModeSelector,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 32.w,
                    height: 32.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF88C9C9),
                          Color(0xFF6BAFAF),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF88C9C9).withOpacity(0.2),
                          offset: const Offset(0, 2),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "语",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "小语",
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            controller.currentMode,
                            style: TextStyle(
                              color: AppTheme.secondary,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: AppTheme.secondary,
                            size: 16.w,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Color(0xFF333333),
                size: 20,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () => controller.onMore(),
                icon: const Icon(
                  Icons.more_horiz_rounded,
                  color: Color(0xFF333333),
                  size: 24,
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              // 聊天内容区域
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.grey[50]!,
                        Colors.white,
                      ],
                      stops: const [0.0, 1.0],
                    ),
                  ),
                  child: GetBuilder<AIChatController>(
                    id: "messages",
                    builder: (_) {
                      return ListView.builder(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 24.h),
                        reverse: true,
                        itemCount: controller.messages.length,
                        itemBuilder: (context, index) {
                          final message = controller.messages[index];
                          return _buildMessageItem(message);
                        },
                      );
                    },
                  ),
                ),
              ),
              // 输入区域
              _buildInputArea(),
              Positioned(
                right: 16.w,
                bottom: 80.h,
                child: VirtualAssistant(
                  size: 60.w,
                  showOptions: false,
                  onTap: () => controller.onAssistantTap(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // 构建模式选择器
  void _showModeSelector() {
    Get.bottomSheet(
      Container(
        height: 0.85.sh,
        padding: EdgeInsets.only(top: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 32.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "选择模式",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF333333),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: 实现自定义模式功能
                      Get.snackbar(
                        "提示",
                        "自定义模式功能即将上线",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.black87,
                        colorText: Colors.white,
                        margin: EdgeInsets.all(20.w),
                        duration: const Duration(seconds: 2),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.add_circle_outline_rounded,
                          size: 16.w,
                          color: AppTheme.secondary,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "自定义",
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: AppTheme.secondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: AppTheme.secondary.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: AppTheme.secondary.withOpacity(0.1),
                  width: 0.5,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    size: 16.w,
                    color: AppTheme.secondary,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      "每种模式都经过专门优化，可以更好地理解你的需求并提供针对性的帮助",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppTheme.secondary,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
                child: Wrap(
                  spacing: 12.w,
                  runSpacing: 12.h,
                  alignment: WrapAlignment.start,
                  children: [
                    _buildModeItem(
                      icon: Icons.chat_bubble_outline_rounded,
                      label: "闲聊模式",
                      description: "日常聊天，答疑解惑",
                      detail: "• 支持多话题自由对话\n• 理解上下文语境\n• 提供趣味性回答\n• 个性化互动体验",
                      color: const Color(0xFF6BB8F5),
                      isSelected: controller.currentMode == "闲聊模式",
                      onTap: () {
                        controller.switchMode("闲聊模式");
                        Get.back();
                      },
                    ),
                    _buildModeItem(
                      icon: Icons.school_outlined,
                      label: "口语练习",
                      description: "情景对话，口语提升",
                      detail: "• 模拟真实对话场景\n• 纠正语法错误\n• 提供表达建议\n• 评估口语水平",
                      color: const Color(0xFFFF9F87),
                      isSelected: controller.currentMode == "口语练习",
                      onTap: () {
                        controller.switchMode("口语练习");
                        Get.back();
                      },
                    ),
                    _buildModeItem(
                      icon: Icons.record_voice_over_outlined,
                      label: "发音纠正",
                      description: "语音评测，发音指导",
                      detail: "• 提供发音评估\n• 纠正发音错误\n• 提供发音建议\n• 评估发音水平",
                      color: const Color(0xFF7EB6FF),
                      isSelected: controller.currentMode == "发音纠正",
                      onTap: () {
                        controller.switchMode("发音纠正");
                        Get.back();
                      },
                    ),
                    _buildModeItem(
                      icon: Icons.translate_rounded,
                      label: "翻译助手",
                      description: "多语种翻译，地道表达",
                      detail: "• 支持多语种翻译\n• 提供地道表达建议\n• 评估翻译质量\n• 个性化翻译体验",
                      color: const Color(0xFFFFB661),
                      isSelected: controller.currentMode == "翻译助手",
                      onTap: () {
                        controller.switchMode("翻译助手");
                        Get.back();
                      },
                    ),
                    _buildModeItem(
                      icon: Icons.psychology_outlined,
                      label: "情感倾诉",
                      description: "倾听分析，情感支持",
                      detail: "• 提供情感倾诉平台\n• 倾听用户情感\n• 提供情感分析\n• 提供情感支持",
                      color: const Color(0xFFFF85C0),
                      isSelected: controller.currentMode == "情感倾诉",
                      onTap: () {
                        controller.switchMode("情感倾诉");
                        Get.back();
                      },
                    ),
                    _buildModeItem(
                      icon: Icons.lightbulb_outline_rounded,
                      label: "创作灵感",
                      description: "创意激发，写作辅助",
                      detail: "• 提供创作灵感\n• 激发创意\n• 提供写作建议\n• 评估创作质量",
                      color: const Color(0xFFFFC554),
                      isSelected: controller.currentMode == "创作灵感",
                      onTap: () {
                        controller.switchMode("创作灵感");
                        Get.back();
                      },
                    ),
                    _buildModeItem(
                      icon: Icons.menu_book_rounded,
                      label: "阅读理解",
                      description: "文本分析，深度解读",
                      detail: "• 提供阅读理解平台\n• 分析文本\n• 提供深度解读\n• 评估阅读理解能力",
                      color: const Color(0xFF7FCFFF),
                      isSelected: controller.currentMode == "阅读理解",
                      onTap: () {
                        controller.switchMode("阅读理解");
                        Get.back();
                      },
                    ),
                    _buildModeItem(
                      icon: Icons.edit_note_rounded,
                      label: "写作助手",
                      description: "文章润色，格式修改",
                      detail: "• 提供写作助手\n• 润色文章\n• 修改格式\n• 评估写作质量",
                      color: const Color(0xFF8BE3D3),
                      isSelected: controller.currentMode == "写作助手",
                      onTap: () {
                        controller.switchMode("写作助手");
                        Get.back();
                      },
                    ),
                    _buildModeItem(
                      icon: Icons.grade_outlined,
                      label: "考试备考",
                      description: "考点讲解，真题练习",
                      detail: "• 提供考试备考平台\n• 讲解考点\n• 提供真题练习\n• 评估考试备考能力",
                      color: const Color(0xFFB69DFF),
                      isSelected: controller.currentMode == "考试备考",
                      onTap: () {
                        controller.switchMode("考试备考");
                        Get.back();
                      },
                    ),
                    _buildModeItem(
                      icon: Icons.theater_comedy_outlined,
                      label: "角色扮演",
                      description: "场景模拟，互动练习",
                      detail: "• 提供角色扮演平台\n• 模拟场景\n• 提供互动练习\n• 评估角色扮演能力",
                      color: const Color(0xFFFF9B9B),
                      isSelected: controller.currentMode == "角色扮演",
                      onTap: () {
                        controller.switchMode("角色扮演");
                        Get.back();
                      },
                    ),
                    _buildModeItem(
                      icon: Icons.music_note_outlined,
                      label: "歌曲学习",
                      description: "歌词解析，发音练习",
                      detail: "• 提供歌曲学习平台\n• 解析歌词\n• 提供发音练习\n• 评估歌曲学习能力",
                      color: const Color(0xFFFF85D0),
                      isSelected: controller.currentMode == "歌曲学习",
                      onTap: () {
                        controller.switchMode("歌曲学习");
                        Get.back();
                      },
                    ),
                    _buildModeItem(
                      icon: Icons.movie_outlined,
                      label: "影视学习",
                      description: "台词练习，文化理解",
                      detail: "• 提供影视学习平台\n• 练习台词\n• 提供文化理解\n• 评估影视学习能力",
                      color: const Color(0xFF85B6FF),
                      isSelected: controller.currentMode == "影视学习",
                      onTap: () {
                        controller.switchMode("影视学习");
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enterBottomSheetDuration: const Duration(milliseconds: 300),
      exitBottomSheetDuration: const Duration(milliseconds: 200),
    );
  }

  // 构建功能项
  Widget _buildModeItem({
    required IconData icon,
    required String label,
    required String description,
    required String detail,
    required Color color,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: Hero(
          tag: "mode_$label",
          child: Container(
            width: 0.425.sw,
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isSelected
                    ? [
                        color,
                        color.withOpacity(0.8),
                      ]
                    : [
                        Colors.white,
                        Colors.white,
                      ],
              ),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: isSelected ? Colors.transparent : Colors.grey[200]!,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: isSelected
                      ? color.withOpacity(0.3)
                      : Colors.black.withOpacity(0.03),
                  offset: const Offset(0, 2),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 36.w,
                  height: 36.w,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Colors.white.withOpacity(0.3)
                        : color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Icon(
                    icon,
                    size: 20.w,
                    color: isSelected ? Colors.white : color,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: isSelected ? Colors.white : const Color(0xFF333333),
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: isSelected
                        ? Colors.white.withOpacity(0.8)
                        : Colors.grey[500],
                  ),
                ),
                if (isSelected) ...[
                  SizedBox(height: 8.h),
                  Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      detail,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.white,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 构建消息项
  Widget _buildMessageItem(ChatMessage message) {
    final bool isUser = message.isUser;
    return Hero(
      tag: "message_${message.time.millisecondsSinceEpoch}",
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.only(bottom: 16.h),
        child: Row(
          mainAxisAlignment:
              isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (!isUser) ...[
              Container(
                width: 32.w,
                height: 32.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF88C9C9),
                      Color(0xFF6BAFAF),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF88C9C9).withOpacity(0.2),
                      offset: const Offset(0, 2),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "语",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
            ],
            Flexible(
              child: Container(
                constraints: BoxConstraints(maxWidth: 0.65.sw),
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: isUser ? AppTheme.secondary : Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(isUser ? 16.r : 4.r),
                    topRight: Radius.circular(isUser ? 4.r : 16.r),
                    bottomLeft: Radius.circular(16.r),
                    bottomRight: Radius.circular(16.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: (isUser ? AppTheme.secondary : Colors.black)
                          .withOpacity(0.08),
                      offset: const Offset(0, 2),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.content,
                      style: TextStyle(
                        color: isUser ? Colors.white : const Color(0xFF333333),
                        fontSize: 14.sp,
                        height: 1.4,
                        letterSpacing: 0.2,
                      ),
                    ),
                    if (!isUser && (message.hasActions ?? false)) ...[
                      SizedBox(height: 10.h),
                      Container(
                        margin: EdgeInsets.only(top: 2.h),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Colors.grey[200]!,
                              width: 0.5,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Wrap(
                        spacing: 8.w,
                        runSpacing: 6.h,
                        children: [
                          _buildActionButton(
                            icon: Icons.play_circle_outline_rounded,
                            label: "朗读",
                            onTap: () => controller.onReadMessage(message),
                          ),
                          _buildActionButton(
                            icon: Icons.repeat_rounded,
                            label: "重新生成",
                            onTap: () =>
                                controller.onRegenerateMessage(message),
                          ),
                          _buildActionButton(
                            icon: Icons.copy_rounded,
                            label: "复制",
                            onTap: () => controller.onCopyMessage(message),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
            if (isUser) ...[
              SizedBox(width: 8.w),
              Container(
                width: 32.w,
                height: 32.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.secondary.withOpacity(0.08),
                  border: Border.all(
                    color: AppTheme.secondary.withOpacity(0.15),
                    width: 1,
                  ),
                ),
                child: Icon(
                  Icons.person_outline_rounded,
                  color: AppTheme.secondary,
                  size: 18.w,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // 构建操作按钮
  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: AppTheme.secondary.withOpacity(0.06),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: AppTheme.secondary.withOpacity(0.08),
              width: 0.5,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 14.w,
                color: AppTheme.secondary,
              ),
              SizedBox(width: 4.w),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppTheme.secondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 构建输入区域
  Widget _buildInputArea() {
    return Container(
      padding: EdgeInsets.fromLTRB(
        12.w,
        8.h,
        12.w,
        8.h + MediaQuery.of(Get.context!).padding.bottom,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            offset: const Offset(0, -2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: Colors.grey[200]!,
                  width: 0.5,
                ),
              ),
              child: TextField(
                controller: controller.textController,
                maxLines: 4,
                minLines: 1,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xFF333333),
                  letterSpacing: 0.2,
                ),
                decoration: InputDecoration(
                  hintText: "说点什么吧...",
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF999999),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppTheme.secondary.withOpacity(0.2),
                  offset: const Offset(0, 2),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => controller.onSend(),
                borderRadius: BorderRadius.circular(16.r),
                child: Container(
                  width: 32.w,
                  height: 32.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF88C9C9),
                        Color(0xFF6BAFAF),
                      ],
                    ),
                  ),
                  child: Icon(
                    Icons.send_rounded,
                    color: Colors.white,
                    size: 16.w,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
