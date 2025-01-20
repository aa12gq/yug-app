import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_app/common/index.dart';

import 'index.dart';

class HelpFeedbackPage extends GetView<HelpFeedbackController> {
  const HelpFeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HelpFeedbackController>(
      init: HelpFeedbackController(),
      id: "help_feedback",
      builder: (_) {
        return Scaffold(
          backgroundColor: const Color(0xFFF8F9FA),
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // 自定义 AppBar
              SliverAppBar(
                expandedHeight: 180.h,
                floating: false,
                pinned: true,
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
                          AppTheme.secondary.withValues(alpha: 0.8),
                        ],
                      ),
                    ),
                    child: Stack(
                      children: [
                        // 装饰图案
                        Positioned(
                          right: -30.w,
                          top: -30.h,
                          child: Container(
                            width: 200.w,
                            height: 200.w,
                            decoration: BoxDecoration(
                              gradient: RadialGradient(
                                colors: [
                                  Colors.white.withValues(alpha: 0.1),
                                  Colors.white.withValues(alpha: 0.05),
                                  Colors.white.withValues(alpha: 0),
                                ],
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Positioned(
                          left: -20.w,
                          bottom: -20.h,
                          child: Container(
                            width: 150.w,
                            height: 150.w,
                            decoration: BoxDecoration(
                              gradient: RadialGradient(
                                colors: [
                                  Colors.white.withValues(alpha: 0.1),
                                  Colors.white.withValues(alpha: 0.05),
                                  Colors.white.withValues(alpha: 0),
                                ],
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        // 内容
                        SafeArea(
                          child: Padding(
                            padding: EdgeInsets.all(20.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () => Get.back(),
                                      child: Container(
                                        padding: EdgeInsets.all(8.w),
                                        decoration: BoxDecoration(
                                          color: Colors.white
                                              .withValues(alpha: 0.2),
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                        ),
                                        child: Icon(
                                          Icons.arrow_back_ios_new,
                                          color: Colors.white,
                                          size: 20.w,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                Text(
                                  "帮助与反馈",
                                  style: TextStyle(
                                    fontSize: 28.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    height: 1.2,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  "我们随时倾听您的建议，为您解答疑惑",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.white.withValues(alpha: 0.8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // 内容区域
              SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FA),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.r),
                      topRight: Radius.circular(24.r),
                    ),
                  ),
                  child: Column(
                    children: [
                      // 常见问题
                      _buildCommonQuestions(),
                      // 问题反馈
                      _buildFeedbackForm(),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // 构建常见问题部分
  Widget _buildCommonQuestions() {
    return Container(
      margin: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            offset: const Offset(0, 2),
            blurRadius: 12,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: AppTheme.secondary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    Icons.help_outline_rounded,
                    color: AppTheme.secondary,
                    size: 24.w,
                  ),
                ),
                SizedBox(width: 12.w),
                Text(
                  "常见问题",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText,
                  ),
                ),
              ],
            ),
          ),
          _buildQuestionItem(
            "如何修改个人资料？",
            "点击头像或个人资料卡片即可进入编辑页面。",
            Icons.person_outline_rounded,
          ),
          _buildQuestionItem(
            "如何更改语言设置？",
            "在'我的'页面中点击'语言设置'即可更改。",
            Icons.language_rounded,
          ),
          _buildQuestionItem(
            "如何管理消息通知？",
            "在'我的'页面中点击'消息通知'即可设置。",
            Icons.notifications_none_rounded,
          ),
        ],
      ),
    );
  }

  // 构建问题项
  Widget _buildQuestionItem(String question, String answer, IconData icon) {
    return Theme(
      data: ThemeData(
        dividerColor: Colors.transparent,
        colorScheme: ColorScheme.light(
          primary: AppTheme.secondary,
        ),
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
        leading: Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: AppTheme.secondary.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(
            icon,
            color: AppTheme.secondary,
            size: 20.w,
          ),
        ),
        title: Text(
          question,
          style: TextStyle(
            fontSize: 15.sp,
            color: AppColors.primaryText,
            fontWeight: FontWeight.w500,
          ),
        ),
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 16.h),
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppTheme.secondary.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: AppTheme.secondary.withValues(alpha: 0.1),
              ),
            ),
            child: Text(
              answer,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.secondaryText,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 构建反馈表单
  Widget _buildFeedbackForm() {
    return Container(
      margin: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            offset: const Offset(0, 2),
            blurRadius: 12,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: AppTheme.secondary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    Icons.feedback_outlined,
                    color: AppTheme.secondary,
                    size: 24.w,
                  ),
                ),
                SizedBox(width: 12.w),
                Text(
                  "问题反馈",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "问题类型",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 12.h),
                Wrap(
                  spacing: 12.w,
                  runSpacing: 12.h,
                  children: controller.problemTypes.map((type) {
                    return Obx(() => GestureDetector(
                          onTap: () => controller.selectType(type),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 10.h,
                            ),
                            decoration: BoxDecoration(
                              color: controller.selectedType.value == type
                                  ? AppTheme.secondary
                                  : AppTheme.secondary.withValues(alpha: 0.05),
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(
                                color: controller.selectedType.value == type
                                    ? Colors.transparent
                                    : AppTheme.secondary.withValues(alpha: 0.1),
                              ),
                            ),
                            child: Text(
                              type,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: controller.selectedType.value == type
                                    ? Colors.white
                                    : AppTheme.secondary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ));
                  }).toList(),
                ),
                SizedBox(height: 24.h),
                Text(
                  "问题描述",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 12.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FA),
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: Colors.grey.withValues(alpha: 0.2),
                    ),
                  ),
                  child: TextField(
                    controller: controller.descriptionController,
                    maxLines: 5,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.primaryText,
                    ),
                    decoration: InputDecoration(
                      hintText: "请详细描述您遇到的问题",
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.secondaryText,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  "图片上传（选填）",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 12.h),
                Obx(() => Wrap(
                      spacing: 12.w,
                      runSpacing: 12.h,
                      children: [
                        if (controller.imageList.length < 3)
                          GestureDetector(
                            onTap: () => controller.addImage(),
                            child: Container(
                              width: 90.w,
                              height: 90.w,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF8F9FA),
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(
                                  color: Colors.grey.withValues(alpha: 0.2),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_photo_alternate_outlined,
                                    size: 28.w,
                                    color: AppColors.secondaryText,
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    "添加图片",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: AppColors.secondaryText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ...controller.imageList.asMap().entries.map((entry) {
                          return Stack(
                            children: [
                              Container(
                                width: 90.w,
                                height: 90.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  image: DecorationImage(
                                    image: NetworkImage(entry.value),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 6.w,
                                top: 6.h,
                                child: GestureDetector(
                                  onTap: () =>
                                      controller.removeImage(entry.key),
                                  child: Container(
                                    padding: EdgeInsets.all(4.w),
                                    decoration: BoxDecoration(
                                      color:
                                          Colors.black.withValues(alpha: 0.5),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.close,
                                      size: 14.w,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ],
                    )),
                SizedBox(height: 24.h),
                Text(
                  "联系方式（选填）",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 12.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FA),
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: Colors.grey.withValues(alpha: 0.2),
                    ),
                  ),
                  child: TextField(
                    controller: controller.contactController,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.primaryText,
                    ),
                    decoration: InputDecoration(
                      hintText: "请留下您的联系方式，方便我们及时回复",
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.secondaryText,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
                Container(
                  width: double.infinity,
                  height: 50.h,
                  margin: EdgeInsets.only(bottom: 20.h),
                  child: ElevatedButton(
                    onPressed: () => controller.submitFeedback(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.secondary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                    child: Text(
                      "提交反馈",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
