import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_app/common/index.dart';
import 'package:yug_app/common/i18n/locale_keys.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

import 'index.dart';

class MyIndexPage extends GetView<MyIndexController> {
  const MyIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
    return GetBuilder<MyIndexController>(
      init: MyIndexController(),
      id: "my_index",
      builder: (_) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.0, 0.3, 0.6, 0.8, 1.0],
                    colors: isDark
                        ? [
                            AppTheme.primary.withOpacity(0.8),
                            AppTheme.primary.withOpacity(0.6),
                            Colors.black.withOpacity(0.5),
                            Colors.black.withOpacity(0.8),
                            Colors.black,
                          ]
                        : [
                            AppTheme.primary,
                            AppTheme.primary.withOpacity(0.8),
                            AppTheme.secondary.withOpacity(0.5),
                            Colors.white.withOpacity(0.8),
                            Colors.white,
                          ],
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      _buildUserInfo(),
                      SizedBox(height: 8.h),
                      Expanded(
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
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 20.w,
                bottom: 100.h,
                child: const VirtualAssistant(),
              ),
            ],
          ),
        );
      },
    );
  }

  // 构建用户信息
  Widget _buildUserInfo() {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 12.h),
      child: Column(
        children: [
          // 顶部操作栏
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.auto_awesome,
                      color: Colors.white,
                      size: 14.w,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      LocaleKeys.myTitle.tr,
                      style: TextStyle(
                        fontSize: 14.sp,
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
                  SizedBox(width: 6.w),
                  _buildIconButton(
                      Icons.settings_outlined, () => controller.onSettings()),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          // 个人资料卡片
          GestureDetector(
            onTap: () => controller.onEditProfile(),
            child: Row(
              children: [
                // 头像部分
                Stack(
                  children: [
                    Container(
                      width: 48.w,
                      height: 48.w,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white.withOpacity(0.3),
                            Colors.white.withOpacity(0.1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: Colors.white,
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          // 头像
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: Image.network(
                              "https://avatars.githubusercontent.com/u/24516654",
                              width: 48.w,
                              height: 48.w,
                              fit: BoxFit.cover,
                              // 加载时显示占位
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: Icon(
                                    Icons.person_rounded,
                                    color: Colors.white,
                                    size: 26.w,
                                  ),
                                );
                              },
                              // 加载失败时显示默认头像
                              errorBuilder: (context, error, stackTrace) {
                                return Center(
                                  child: Icon(
                                    Icons.person_rounded,
                                    color: Colors.white,
                                    size: 26.w,
                                  ),
                                );
                              },
                            ),
                          ),
                          // 右下角的等级标记
                          Positioned(
                            right: -1,
                            bottom: -1,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFBE0B),
                                borderRadius: BorderRadius.circular(6.r),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1.5,
                                ),
                              ),
                              child: Text(
                                "Lv.5",
                                style: TextStyle(
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // 左上角的VIP标记
                    Positioned(
                      left: -2,
                      top: -2,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFFFF6B6B),
                              const Color(0xFFFF6B6B).withOpacity(0.8),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(6.r),
                          border: Border.all(
                            color: Colors.white,
                            width: 1.5,
                          ),
                        ),
                        child: Text(
                          "VIP",
                          style: TextStyle(
                            fontSize: 8.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "用户名",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          // 认证标记
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 2.h),
                            decoration: BoxDecoration(
                              color: const Color(0xFF00B894).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.verified_user,
                                  color: const Color(0xFF00B894),
                                  size: 10.w,
                                ),
                                SizedBox(width: 2.w),
                                Text(
                                  "已认证",
                                  style: TextStyle(
                                    fontSize: 8.sp,
                                    color: const Color(0xFF00B894),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6.w, vertical: 2.h),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: const Color(0xFFFFBE0B),
                                  size: 10.w,
                                ),
                                SizedBox(width: 2.w),
                                Text(
                                  "创作者",
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Colors.white.withOpacity(0.9),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            "编辑资料 >",
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 构建用户统计
  Widget _buildUserStats() {
    return Builder(builder: (context) {
      final isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
      return Container(
        margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 12.h),
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isDark
              ? Colors.black.withOpacity(0.3)
              : Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isDark
                ? Colors.white.withOpacity(0.1)
                : Colors.white.withOpacity(0.2),
            width: 1,
          ),
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
    });
  }

  // 构建统计项
  Widget _buildStatItem(String label, String value, Color color) {
    return Builder(builder: (context) {
      final isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: isDark ? color.withOpacity(0.9) : color,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 11.sp,
              color: isDark
                  ? Colors.white.withOpacity(0.7)
                  : AppColors.primaryText.withOpacity(0.7),
            ),
          ),
        ],
      );
    });
  }

  // 构建分隔线
  Widget _buildDivider() {
    return Container(
      height: 20.h,
      width: 1,
      color: Colors.grey.withOpacity(0.2),
    );
  }

  // 构建菜单部分
  Widget _buildMenuSection() {
    return Builder(builder: (context) {
      final isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
      return Container(
        margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 12.h),
        decoration: BoxDecoration(
          color: isDark
              ? Colors.white.withOpacity(0.1)
              : Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isDark
                ? Colors.white.withOpacity(0.1)
                : Colors.white.withOpacity(0.2),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? 0.3 : 0.02),
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
              icon: Icons.palette_outlined,
              label: LocaleKeys.myMenuTheme.tr,
              color: const Color(0xFFFFBE0B),
              onTap: () => controller.onTheme(),
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
    });
  }

  // 菜单项
  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
    bool showDivider = true,
  }) {
    return Builder(builder: (context) {
      final isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
      return Column(
        children: [
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
            leading: Container(
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    color.withOpacity(isDark ? 0.2 : 0.1),
                    color.withOpacity(isDark ? 0.1 : 0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: color.withOpacity(isDark ? 0.2 : 0.1),
                  width: 1,
                ),
              ),
              child: Icon(
                icon,
                color: isDark ? color.withOpacity(0.9) : color,
                size: 16.w,
              ),
            ),
            title: Text(
              label,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.white : AppColors.primaryText,
                letterSpacing: 0.3,
              ),
            ),
            trailing: Container(
              width: 24.w,
              height: 24.w,
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
                size: 10.w,
                color: color,
              ),
            ),
            onTap: onTap,
          ),
          if (showDivider)
            Padding(
              padding: EdgeInsets.only(left: 64.w, right: 16.w),
              child: Container(
                height: 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey.withOpacity(0),
                      Colors.grey.withOpacity(isDark ? 0.2 : 0.1),
                      Colors.grey.withOpacity(0),
                    ],
                  ),
                ),
              ),
            ),
        ],
      );
    });
  }

  // 构建关于部分
  Widget _buildAboutSection() {
    return Container(
      margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20.r),
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
    return Builder(builder: (context) {
      final isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
      return Container(
        margin: EdgeInsets.fromLTRB(16.w, 6.h, 16.w, 12.h),
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 10.w),
        decoration: BoxDecoration(
          color: isDark
              ? Colors.black.withOpacity(0.3)
              : Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isDark
                ? Colors.white.withOpacity(0.1)
                : Colors.white.withOpacity(0.2),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? 0.2 : 0.02),
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
              height: 30.h,
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
              height: 30.h,
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
    });
  }

  // 快捷操作项
  Widget _buildQuickActionItem({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Builder(builder: (context) {
      final isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: 60.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      color.withOpacity(isDark ? 0.2 : 0.1),
                      color.withOpacity(isDark ? 0.1 : 0.05),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: color.withOpacity(isDark ? 0.2 : 0.1),
                    width: 1,
                  ),
                ),
                child: Icon(
                  icon,
                  color: isDark ? color.withOpacity(0.9) : color,
                  size: 20.w,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  color: isDark
                      ? Colors.white.withOpacity(0.9)
                      : AppColors.primaryText,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
      );
    });
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

  // 添加回 _buildIconButton 方法
  Widget _buildIconButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(6.w),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 16.w,
        ),
      ),
    );
  }
}
