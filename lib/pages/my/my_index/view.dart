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
          backgroundColor: AppTheme.secondary,
          body: Stack(
            children: [
              // 背景装饰
              Positioned(
                right: -80.w,
                top: -40.h,
                child: Container(
                  width: 250.w,
                  height: 250.w,
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
              SafeArea(
                child: Column(
                  children: [
                    _buildUserInfo(),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24.r),
                            topRight: Radius.circular(24.r),
                          ),
                        ),
                        child: Stack(
                          children: [
                            // 背景装饰
                            Positioned(
                              left: -40.w,
                              bottom: -40.h,
                              child: Container(
                                width: 160.w,
                                height: 160.w,
                                decoration: BoxDecoration(
                                  gradient: RadialGradient(
                                    colors: [
                                      AppTheme.secondary.withOpacity(0.05),
                                      AppTheme.secondary.withOpacity(0.02),
                                      AppTheme.secondary.withOpacity(0),
                                    ],
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            // 内容
                            ListView(
                              physics: const BouncingScrollPhysics(),
                              padding: EdgeInsets.zero,
                              children: [
                                _buildUserStats(),
                                _buildQuickActions(),
                                _buildMenuSection(),
                                _buildAboutSection(),
                              ],
                            ),
                          ],
                        ),
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

  // 构建用户统计
  Widget _buildUserStats() {
    return Container(
      margin: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
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
          _buildStatItem(
              LocaleKeys.myStatsFollowers.tr, "36", const Color(0xFFFF6B6B)),
          _buildStatItem(
              LocaleKeys.myStatsLikes.tr, "258", const Color(0xFF00B894)),
          _buildStatItem(
              LocaleKeys.myStatsFavorites.tr, "46", const Color(0xFFFFBE0B)),
        ],
      ),
    );
  }

  // 构建统计项
  Widget _buildStatItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18.sp,
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

  // 构建菜单部分
  Widget _buildMenuSection() {
    return Container(
      margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
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

  // 构建用户信息
  Widget _buildUserInfo() {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
      child: Column(
        children: [
          // 顶部标题
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
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
                      Icons.auto_awesome,
                      color: Colors.white,
                      size: 18.w,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    LocaleKeys.myTitle.tr,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: GestureDetector(
                  onTap: () => controller.onSettings(),
                  child: Icon(
                    Icons.settings_outlined,
                    color: Colors.white,
                    size: 18.w,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          // 个人资料卡片
          GestureDetector(
            onTap: () => controller.onEditProfile(),
            child: Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    offset: const Offset(0, 8),
                    blurRadius: 16,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // 装饰元素
                  Positioned(
                    right: -16.w,
                    top: -16.h,
                    child: Container(
                      width: 80.w,
                      height: 80.w,
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          colors: [
                            AppTheme.secondary.withOpacity(0.1),
                            AppTheme.secondary.withOpacity(0.05),
                            AppTheme.secondary.withOpacity(0),
                          ],
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          // 头像和等级
                          Stack(
                            children: [
                              // 头像
                              Container(
                                padding: EdgeInsets.all(2.5.w),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      AppTheme.secondary,
                                      AppTheme.secondary.withOpacity(0.7),
                                    ],
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Container(
                                  width: 50.w,
                                  height: 50.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.person_outline,
                                    color: AppTheme.secondary,
                                    size: 26.w,
                                  ),
                                ),
                              ),
                              // 等级标签
                              Positioned(
                                right: -2.w,
                                bottom: -2.h,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 6.w,
                                    vertical: 2.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFBE0B),
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Text(
                                    "Lv.5",
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      LocaleKeys.myDefaultUsername.tr,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.primaryText,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    SizedBox(width: 8.w),
                                    // 认证标签
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 6.w,
                                        vertical: 2.h,
                                      ),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            const Color(0xFF6C5CE7),
                                            const Color(0xFF6C5CE7)
                                                .withOpacity(0.8),
                                          ],
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.verified_user,
                                            color: Colors.white,
                                            size: 12.w,
                                          ),
                                          SizedBox(width: 2.w),
                                          Text(
                                            LocaleKeys.myCreatorTag.tr,
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  LocaleKeys.myDefaultSignature.tr,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.secondaryText,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Row(
                                  children: [
                                    _buildAchievementTag(
                                      icon: Icons.military_tech,
                                      label: LocaleKeys.myAchievementCreator.tr,
                                      color: const Color(0xFFFF6B6B),
                                    ),
                                    SizedBox(width: 8.w),
                                    _buildAchievementTag(
                                      icon: Icons.workspace_premium,
                                      label:
                                          LocaleKeys.myAchievementFeatured.tr,
                                      color: const Color(0xFF00B894),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      // 创作数据
                      Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: AppTheme.secondary.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildCreatorStat(LocaleKeys.myStatsWorks.tr, "12"),
                            _buildCreatorStat(
                                LocaleKeys.myStatsPlays.tr, "1.2w"),
                            _buildCreatorStat(
                                LocaleKeys.myStatsSaves.tr, "368"),
                            _buildCreatorStat(
                                LocaleKeys.myStatsComments.tr, "128"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
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
