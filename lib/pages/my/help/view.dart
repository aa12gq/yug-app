import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_app/common/index.dart';

import 'index.dart';

class HelpPage extends GetView<HelpController> {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HelpController>(
      init: HelpController(),
      id: "help",
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
                expandedHeight: 150.h,
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
                          left: -20.w,
                          bottom: -20.h,
                          child: Container(
                            width: 150.w,
                            height: 150.w,
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
                            padding: EdgeInsets.all(20.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () => Get.back(),
                                      child: Container(
                                        padding: EdgeInsets.all(8.w),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2),
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
                                    GestureDetector(
                                      onTap: () =>
                                          Get.offNamed(RouteNames.myFeedback),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 16.w,
                                          vertical: 8.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.feedback_outlined,
                                              color: Colors.white,
                                              size: 16.w,
                                            ),
                                            SizedBox(width: 4.w),
                                            Text(
                                              "问题反馈",
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                Text(
                                  "帮助中心",
                                  style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    height: 1.2,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  "为您提供全面的使用指南和帮助文档",
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
                      topLeft: Radius.circular(24.r),
                      topRight: Radius.circular(24.r),
                    ),
                  ),
                  child: Column(
                    children: [
                      // 搜索框
                      _buildSearchBar(),
                      // 帮助分类
                      _buildHelpCategories(),
                      // 热门问题
                      _buildHotQuestions(),
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

  // 构建搜索框
  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.fromLTRB(12.w, 16.h, 12.w, 12.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      height: 40.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.search_rounded,
            color: AppColors.secondaryText,
            size: 20.w,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "搜索帮助文档",
                hintStyle: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.secondaryText,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 构建帮助分类
  Widget _buildHelpCategories() {
    return Container(
      margin: EdgeInsets.fromLTRB(12.w, 8.h, 12.w, 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Text(
              "帮助分类",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryText,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 12.h,
            crossAxisSpacing: 12.w,
            childAspectRatio: 2.0,
            padding: EdgeInsets.zero,
            children: [
              _buildCategoryItem(
                "新手指南",
                "快速了解基本功能",
                Icons.school_outlined,
                const Color(0xFF6C5CE7),
              ),
              _buildCategoryItem(
                "功能介绍",
                "详细功能使用说明",
                Icons.apps_outlined,
                const Color(0xFF00B894),
              ),
              _buildCategoryItem(
                "账号安全",
                "账号和隐私相关",
                Icons.security_outlined,
                const Color(0xFFFF7675),
              ),
              _buildCategoryItem(
                "常见问题",
                "解答常见疑问",
                Icons.help_outline_rounded,
                const Color(0xFF74B9FF),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 构建分类项
  Widget _buildCategoryItem(
    String title,
    String subtitle,
    IconData icon,
    Color color,
  ) {
    return GestureDetector(
      onTap: () => controller.onHelpDetail(title, title),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              offset: const Offset(0, 2),
              blurRadius: 8,
            ),
          ],
        ),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 16.w,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                title,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryText,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 2.h),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 11.sp,
                  color: AppColors.secondaryText,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 构建热门问题
  Widget _buildHotQuestions() {
    return Container(
      margin: EdgeInsets.fromLTRB(12.w, 8.h, 12.w, 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Text(
              "热门问题",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryText,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  offset: const Offset(0, 2),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Column(
              children: [
                _buildQuestionItem(
                  "如何修改个人资料？",
                  Icons.person_outline_rounded,
                  const Color(0xFF6C5CE7),
                ),
                _buildQuestionItem(
                  "如何设置消息提醒？",
                  Icons.notifications_none_rounded,
                  const Color(0xFFFF7675),
                ),
                _buildQuestionItem(
                  "如何更改语言设置？",
                  Icons.language_rounded,
                  const Color(0xFF00B894),
                ),
                _buildQuestionItem(
                  "如何保护账号安全？",
                  Icons.security_outlined,
                  const Color(0xFF74B9FF),
                  showDivider: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 构建问题项
  Widget _buildQuestionItem(
    String title,
    IconData icon,
    Color color, {
    bool showDivider = true,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.h),
          leading: Container(
            padding: EdgeInsets.all(6.w),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              icon,
              color: color,
              size: 16.w,
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 13.sp,
              color: AppColors.primaryText,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 14.w,
            color: AppColors.secondaryText,
          ),
          onTap: () => controller.onHelpDetail(title, "常见问题"),
        ),
        if (showDivider)
          Divider(
            height: 1,
            indent: 56.w,
            endIndent: 16.w,
            color: Colors.grey.withOpacity(0.1),
          ),
      ],
    );
  }
}
