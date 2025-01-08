import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:yug_app/common/index.dart';

import 'index.dart';

class HelpDetailPage extends GetView<HelpDetailController> {
  const HelpDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HelpDetailController>(
      init: HelpDetailController(),
      id: "help_detail",
      builder: (_) {
        return Scaffold(
          backgroundColor: const Color(0xFFF8F9FA),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
          ),
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // 自定义 AppBar
              SliverAppBar(
                expandedHeight: 90.h,
                floating: false,
                pinned: true,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppTheme.secondary,
                          AppTheme.secondary.withOpacity(0.8),
                        ],
                        stops: const [0.3, 1.0],
                      ),
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 12.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () => Get.back(),
                                      child: Container(
                                        padding: EdgeInsets.all(6.w),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        child: Icon(
                                          Icons.arrow_back_ios_new,
                                          color: Colors.white,
                                          size: 16.w,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12.w),
                                    Obx(() => Text(
                                          controller.type.value,
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            letterSpacing: 0.2,
                                          ),
                                        )),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () =>
                                      Get.toNamed(RouteNames.myFeedback),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                      vertical: 6.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(16.r),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.feedback_outlined,
                                          color: Colors.white,
                                          size: 14.w,
                                        ),
                                        SizedBox(width: 4.w),
                                        Text(
                                          "问题反馈",
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4.h),
                            Obx(() => Text(
                                  controller.title.value,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // 内容区域
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(12.w, 0, 12.w, 12.h),
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            offset: const Offset(0, 4),
                            blurRadius: 16,
                            spreadRadius: -2,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 阅读时间和更新时间
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 4.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppTheme.secondary.withOpacity(0.08),
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.timer_outlined,
                                      size: 12.w,
                                      color: AppTheme.secondary,
                                    ),
                                    SizedBox(width: 4.w),
                                    Text(
                                      "阅读时间 3分钟",
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        color: AppTheme.secondary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 4.h,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF7F7F9),
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.update_outlined,
                                      size: 12.w,
                                      color: AppColors.secondaryText,
                                    ),
                                    SizedBox(width: 4.w),
                                    Text(
                                      "最近更新",
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        color: AppColors.secondaryText,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          // Markdown 内容
                          Obx(() => MarkdownBody(
                                data: controller.content.value,
                                styleSheet: MarkdownStyleSheet(
                                  h1: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryText,
                                    height: 1.4,
                                    letterSpacing: 0.2,
                                  ),
                                  h2: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryText,
                                    height: 1.5,
                                    letterSpacing: 0.2,
                                  ),
                                  p: TextStyle(
                                    fontSize: 14.sp,
                                    color:
                                        AppColors.primaryText.withOpacity(0.9),
                                    height: 1.6,
                                    letterSpacing: 0.2,
                                  ),
                                  listBullet: TextStyle(
                                    fontSize: 14.sp,
                                    color:
                                        AppColors.primaryText.withOpacity(0.9),
                                    height: 1.6,
                                    letterSpacing: 0.2,
                                  ),
                                  blockquote: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.secondaryText,
                                    height: 1.6,
                                    letterSpacing: 0.2,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  blockquoteDecoration: BoxDecoration(
                                    color: const Color(0xFFF7F7F9),
                                    borderRadius: BorderRadius.circular(8.r),
                                    border: Border(
                                      left: BorderSide(
                                        color:
                                            AppTheme.secondary.withOpacity(0.3),
                                        width: 3,
                                      ),
                                    ),
                                  ),
                                  blockquotePadding: EdgeInsets.symmetric(
                                    horizontal: 12.w,
                                    vertical: 8.h,
                                  ),
                                  listBulletPadding: EdgeInsets.only(
                                    right: 12.w,
                                    top: 4.h,
                                  ),
                                  listIndent: 20.w,
                                  h1Padding: EdgeInsets.only(
                                    top: 0,
                                    bottom: 12.h,
                                  ),
                                  h2Padding: EdgeInsets.only(
                                    top: 16.h,
                                    bottom: 8.h,
                                  ),
                                  pPadding: EdgeInsets.only(
                                    bottom: 12.h,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    // 帮助反馈
                    Container(
                      margin: EdgeInsets.fromLTRB(12.w, 0, 12.w, 16.h),
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            offset: const Offset(0, 4),
                            blurRadius: 16,
                            spreadRadius: -2,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 32.w,
                                height: 32.w,
                                decoration: BoxDecoration(
                                  color: AppTheme.secondary.withOpacity(0.08),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.thumb_up_outlined,
                                  color: AppTheme.secondary,
                                  size: 16.w,
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Text(
                                "这篇文档对您有帮助吗？",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryText,
                                  letterSpacing: 0.2,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          Obx(() => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _buildFeedbackButton(
                                    "有帮助",
                                    Icons.thumb_up_outlined,
                                    true,
                                    controller.isHelpful.value &&
                                        controller.hasVoted.value,
                                  ),
                                  SizedBox(width: 16.w),
                                  _buildFeedbackButton(
                                    "没帮助",
                                    Icons.thumb_down_outlined,
                                    false,
                                    !controller.isHelpful.value &&
                                        controller.hasVoted.value,
                                  ),
                                ],
                              )),
                          if (controller.hasVoted.value) ...[
                            SizedBox(height: 16.h),
                            Text(
                              controller.isHelpful.value
                                  ? "感谢您的反馈，我们会继续提供优质内容"
                                  : "感谢您的反馈，我们会继续完善文档内容",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColors.secondaryText,
                                letterSpacing: 0.2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // 构建反馈按钮
  Widget _buildFeedbackButton(
    String text,
    IconData icon,
    bool isHelpful,
    bool isSelected,
  ) {
    return GestureDetector(
      onTap: () => controller.submitHelpfulFeedback(isHelpful),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 8.h,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? AppTheme.secondary.withOpacity(0.08)
              : const Color(0xFFF7F7F9),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? AppTheme.secondary : Colors.transparent,
            width: 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppTheme.secondary.withOpacity(0.15),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                    spreadRadius: -2,
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16.w,
              color: isSelected ? AppTheme.secondary : AppColors.secondaryText,
            ),
            SizedBox(width: 6.w),
            Text(
              text,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                color:
                    isSelected ? AppTheme.secondary : AppColors.secondaryText,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
