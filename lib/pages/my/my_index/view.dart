import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_app/common/index.dart';
import 'package:yug_app/common/i18n/locale_keys.dart';

import 'index.dart';

class MyIndexPage extends GetView<MyIndexController> {
  const MyIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyIndexController>(
      init: MyIndexController(),
      id: "my_index",
      builder: (_) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 0.3, 0.6, 0.8, 1.0],
                colors: [
                  AppTheme.primary,
                  AppTheme.primary.withOpacity(0.8),
                  AppTheme.secondary.withOpacity(0.5),
                  Colors.white.withOpacity(0.8),
                  Colors.white,
                ],
              ),
            ),
            child: Stack(
              children: [
                // 装饰效果1 - 顶部波浪装饰
                Positioned(
                  top: -100.h,
                  left: -50.w,
                  right: -50.w,
                  child: Container(
                    height: 300.h,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        center: Alignment.topCenter,
                        radius: 1.0,
                        colors: [
                          Colors.white.withOpacity(0.15),
                          Colors.white.withOpacity(0),
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(300.r),
                        bottomRight: Radius.circular(300.r),
                      ),
                    ),
                  ),
                ),

                // 装饰效果2 - 右上角圆形装饰
                Positioned(
                  right: -80.w,
                  top: 100.h,
                  child: Container(
                    width: 200.w,
                    height: 200.w,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [
                          Colors.white.withOpacity(0.2),
                          Colors.white.withOpacity(0),
                        ],
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),

                // 主要内容
                SafeArea(
                  child: Column(
                    children: [
                      _buildUserInfo(),
                      SizedBox(height: 8.h),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32.r),
                              topRight: Radius.circular(32.r),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32.r),
                              topRight: Radius.circular(32.r),
                            ),
                            child: ListView(
                              physics: const BouncingScrollPhysics(),
                              padding: EdgeInsets.zero,
                              children: [
                                SizedBox(height: 16.h),
                                _buildUserStats(),
                                _buildQuickActions(),
                                _buildMenuSection(),
                                _buildAboutSection(),
                                SizedBox(height: 16.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // 构建用户信息
  Widget _buildUserInfo() {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
      child: Column(
        children: [
          // 顶部操作栏
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.auto_awesome,
                      color: Colors.white,
                      size: 16.w,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      LocaleKeys.myTitle.tr,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  _buildIconButton(Icons.notifications_outlined,
                      () => controller.onNotifications()),
                  SizedBox(width: 8.w),
                  _buildIconButton(
                      Icons.settings_outlined, () => controller.onSettings()),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),
          // 个人资料卡片
          GestureDetector(
            onTap: () => controller.onEditProfile(),
            child: Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 60.w,
                    height: 60.w,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      Icons.person_rounded,
                      color: Colors.white,
                      size: 32.w,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "用户名",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "编辑个人资料 >",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 构建图标按钮
  Widget _buildIconButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 18.w,
        ),
      ),
    );
  }

  // 构建用户统计
  Widget _buildUserStats() {
    return Container(
      margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            offset: const Offset(0, 8),
            blurRadius: 16,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem(
              LocaleKeys.myStatsFollowing.tr, "12", const Color(0xFF6C5CE7)),
          _buildDivider(),
          _buildStatItem(
              LocaleKeys.myStatsFollowers.tr, "36", const Color(0xFFFF6B6B)),
          _buildDivider(),
          _buildStatItem(
              LocaleKeys.myStatsLikes.tr, "258", const Color(0xFF00B894)),
          _buildDivider(),
          _buildStatItem(
              LocaleKeys.myStatsFavorites.tr, "46", const Color(0xFFFFBE0B)),
        ],
      ),
    );
  }

  // 构建统计项
  Widget _buildStatItem(String label, String value, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.secondaryText,
          ),
        ),
      ],
    );
  }

  // 构建分隔线
  Widget _buildDivider() {
    return Container(
      height: 24.h,
      width: 1,
      color: Colors.grey.withOpacity(0.2),
    );
  }

  // 构建菜单部分
  Widget _buildMenuSection() {
    return Container(
      margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            offset: const Offset(0, 8),
            blurRadius: 16,
          ),
        ],
      ),
      child: Column(
        children: [
          _buildMenuItem(
            icon: Icons.local_activity_outlined,
            label: LocaleKeys.myMenuRecentActivity.tr,
            color: const Color(0xFF6C5CE7),
            onTap: () => controller.onViewAllActivities(),
          ),
          _buildMenuItem(
            icon: Icons.language_outlined,
            label: LocaleKeys.myMenuLanguage.tr,
            color: const Color(0xFF00B894),
            onTap: () => controller.onLanguage(),
          ),
          _buildMenuItem(
            icon: Icons.notifications_outlined,
            label: LocaleKeys.myMenuNotifications.tr,
            color: const Color(0xFFFF7675),
            onTap: () => controller.onNotifications(),
          ),
          _buildMenuItem(
            icon: Icons.help_outline,
            label: LocaleKeys.myMenuHelpFeedback.tr,
            color: const Color(0xFF74B9FF),
            onTap: () => controller.onHelpAndFeedback(),
          ),
          _buildMenuItem(
            icon: Icons.security_outlined,
            label: LocaleKeys.myMenuPrivacy.tr,
            color: const Color(0xFF74B9FF),
            onTap: () => controller.onPrivacy(),
            showDivider: false,
          ),
        ],
      ),
    );
  }

  // 菜单项
  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
          leading: Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color.withOpacity(0.1),
                  color.withOpacity(0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: color.withOpacity(0.1),
                width: 1,
              ),
            ),
            child: Icon(
              icon,
              color: color,
              size: 20.w,
            ),
          ),
          title: Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryText,
              letterSpacing: 0.3,
            ),
          ),
          trailing: Container(
            width: 28.w,
            height: 28.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color.withOpacity(0.1),
                  color.withOpacity(0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 12.w,
              color: color,
            ),
          ),
          onTap: onTap,
        ),
        if (showDivider)
          Padding(
            padding: EdgeInsets.only(left: 75.w, right: 20.w),
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.grey.withOpacity(0),
                    Colors.grey.withOpacity(0.1),
                    Colors.grey.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }

  // 构建关于部分
  Widget _buildAboutSection() {
    return Container(
      margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            offset: const Offset(0, 8),
            blurRadius: 16,
          ),
        ],
      ),
      child: Column(
        children: [
          _buildAboutItem(
            LocaleKeys.myAboutUs.tr,
            Icons.info_outline,
            const Color(0xFF74B9FF),
            () => controller.onAbout(),
          ),
          SizedBox(height: 12.h),
          _buildAboutItem(
            LocaleKeys.myTerms.tr,
            Icons.description_outlined,
            const Color(0xFF00B894),
            () => controller.onTerms(),
          ),
          SizedBox(height: 12.h),
          _buildAboutItem(
            LocaleKeys.myPrivacyPolicy.tr,
            Icons.privacy_tip_outlined,
            const Color(0xFFFF7675),
            () => controller.onPrivacyPolicy(),
          ),
        ],
      ),
    );
  }

  // 构建关于项
  Widget _buildAboutItem(
    String label,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 32.w,
            height: 32.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color.withOpacity(0.1),
                  color.withOpacity(0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              icon,
              color: color,
              size: 16.w,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.primaryText,
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 12.w,
            color: AppColors.secondaryText,
          ),
        ],
      ),
    );
  }

  // 构建快捷操作
  Widget _buildQuickActions() {
    return Container(
      margin: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            offset: const Offset(0, 8),
            blurRadius: 16,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildQuickActionItem(
            icon: Icons.favorite_border,
            label: LocaleKeys.myQuickFavorites.tr,
            color: const Color(0xFFFF6B6B),
            onTap: () => controller.onFavorites(),
          ),
          Container(
            height: 35.h,
            width: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.grey.withOpacity(0),
                  Colors.grey.withOpacity(0.1),
                  Colors.grey.withOpacity(0),
                ],
              ),
            ),
          ),
          _buildQuickActionItem(
            icon: Icons.history,
            label: LocaleKeys.myQuickHistory.tr,
            color: const Color(0xFF4ECDC4),
            onTap: () => controller.onHistory(),
          ),
          Container(
            height: 35.h,
            width: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.grey.withOpacity(0),
                  Colors.grey.withOpacity(0.1),
                  Colors.grey.withOpacity(0),
                ],
              ),
            ),
          ),
          _buildQuickActionItem(
            icon: Icons.star_border,
            label: LocaleKeys.myQuickWorks.tr,
            color: const Color(0xFFFFBE0B),
            onTap: () => controller.onWorks(),
          ),
        ],
      ),
    );
  }

  // 快捷操作项
  Widget _buildQuickActionItem({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    color.withOpacity(0.1),
                    color.withOpacity(0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(
                  color: color.withOpacity(0.1),
                  width: 1,
                ),
              ),
              child: Icon(
                icon,
                color: color,
                size: 22.w,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryText,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 构建成就标签
  Widget _buildAchievementTag({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 4.h,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
            size: 12.w,
          ),
          SizedBox(width: 4.w),
          Text(
            label,
            style: TextStyle(
              fontSize: 10.sp,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // 构建创作者数据
  Widget _buildCreatorStat(String label, String value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryText,
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 11.sp,
            color: AppColors.secondaryText,
          ),
        ),
      ],
    );
  }
}
