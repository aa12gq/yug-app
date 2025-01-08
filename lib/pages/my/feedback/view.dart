import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_app/common/index.dart';

import 'index.dart';

class FeedbackPage extends GetView<FeedbackController> {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeedbackController>(
      init: FeedbackController(),
      id: "feedback",
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
                expandedHeight: 120.h,
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
                    child: Stack(
                      children: [
                        // 装饰图案
                        Positioned(
                          right: -20.w,
                          top: -20.h,
                          child: Container(
                            width: 120.w,
                            height: 120.w,
                            decoration: BoxDecoration(
                              gradient: RadialGradient(
                                colors: [
                                  Colors.white.withOpacity(0.1),
                                  Colors.white.withOpacity(0.05),
                                  Colors.white.withOpacity(0),
                                ],
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Positioned(
                          left: -15.w,
                          bottom: -15.h,
                          child: Container(
                            width: 100.w,
                            height: 100.w,
                            decoration: BoxDecoration(
                              gradient: RadialGradient(
                                colors: [
                                  Colors.white.withOpacity(0.1),
                                  Colors.white.withOpacity(0.05),
                                  Colors.white.withOpacity(0),
                                ],
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        // 内容
                        SafeArea(
                          child: Padding(
                            padding: EdgeInsets.all(16.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () => Get.back(),
                                          child: Container(
                                            padding: EdgeInsets.all(6.w),
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.2),
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
                                        Text(
                                          "问题反馈",
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            letterSpacing: 0.2,
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () =>
                                          Get.offNamed(RouteNames.myHelp),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12.w,
                                          vertical: 6.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.help_outline_rounded,
                                              color: Colors.white,
                                              size: 14.w,
                                            ),
                                            SizedBox(width: 4.w),
                                            Text(
                                              "帮助中心",
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
                                SizedBox(height: 8.h),
                                Text(
                                  "我们随时倾听您的建议，为您解答疑惑",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.white.withOpacity(0.8),
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
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                  ),
                  child: Column(
                    children: [
                      _buildFeedbackForm(),
                      SizedBox(height: 16.h),
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

  // 构建反馈表单
  Widget _buildFeedbackForm() {
    return Container(
      margin: EdgeInsets.fromLTRB(12.w, 0, 12.w, 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            offset: const Offset(0, 8),
            blurRadius: 24,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 问题类型
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Text(
                    "问题类型",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Wrap(
                  spacing: 10.w,
                  runSpacing: 10.h,
                  children: controller.problemTypes.map((type) {
                    return Obx(() {
                      final isSelected = controller.selectedType.value == type;
                      return GestureDetector(
                        onTap: () => controller.selectType(type),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppTheme.secondary
                                : const Color(0xFFF7F7F9),
                            borderRadius: BorderRadius.circular(32.r),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color:
                                          AppTheme.secondary.withOpacity(0.25),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                      spreadRadius: -2,
                                    )
                                  ]
                                : null,
                          ),
                          child: Text(
                            type,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: isSelected
                                  ? Colors.white
                                  : AppColors.primaryText.withOpacity(0.8),
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ),
                      );
                    });
                  }).toList(),
                ),

                SizedBox(height: 24.h),

                // 问题描述
                Text(
                  "问题描述",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.2,
                  ),
                ),
                SizedBox(height: 12.h),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F7F9),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: TextField(
                    controller: controller.descriptionController,
                    maxLines: 4,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.primaryText,
                      height: 1.5,
                      letterSpacing: 0.2,
                    ),
                    decoration: InputDecoration(
                      hintText: "请详细描述您遇到的问题",
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.secondaryText.withOpacity(0.4),
                        letterSpacing: 0.2,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),

                SizedBox(height: 24.h),

                // 图片上传
                Row(
                  children: [
                    Text(
                      "图片上传",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.2,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      "选填",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.secondaryText,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Obx(() => Wrap(
                      spacing: 10.w,
                      runSpacing: 10.h,
                      children: [
                        if (controller.imageList.length < 3)
                          GestureDetector(
                            onTap: () => controller.addImage(),
                            child: Container(
                              width: 80.w,
                              height: 80.w,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF7F7F9),
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10.w),
                                    decoration: BoxDecoration(
                                      color:
                                          AppTheme.secondary.withOpacity(0.08),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.add_photo_alternate_outlined,
                                      size: 20.w,
                                      color: AppTheme.secondary,
                                    ),
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    "添加图片",
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      color: AppColors.secondaryText,
                                      letterSpacing: 0.2,
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
                                width: 80.w,
                                height: 80.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r),
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
                                    padding: EdgeInsets.all(6.w),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.4),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.close,
                                      size: 12.w,
                                      color: Colors.white.withOpacity(0.9),
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

                // 联系方式
                Row(
                  children: [
                    Text(
                      "联系方式",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.2,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      "选填",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.secondaryText,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F7F9),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: TextField(
                    controller: controller.contactController,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.primaryText,
                      height: 1.5,
                      letterSpacing: 0.2,
                    ),
                    decoration: InputDecoration(
                      hintText: "请留下您的联系方式，方便我们及时回复",
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.secondaryText.withOpacity(0.4),
                        letterSpacing: 0.2,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),

                SizedBox(height: 24.h),

                // 提交按钮
                Container(
                  width: double.infinity,
                  height: 48.h,
                  margin: EdgeInsets.only(bottom: 20.h),
                  child: ElevatedButton(
                    onPressed: () => controller.submitFeedback(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.secondary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.r),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
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
                        borderRadius: BorderRadius.circular(32.r),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.secondary.withOpacity(0.25),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                            spreadRadius: -2,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "提交反馈",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
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
