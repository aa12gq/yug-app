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
              // 背景渐变
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
              ),
              // 大圆装饰
              Positioned(
                top: -120,
                right: -80,
                child: Stack(
                  children: [
                    // 主球体
                    Container(
                      width: 280,
                      height: 280,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white.withOpacity(0.2),
                            Colors.white.withOpacity(0.05),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.1),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                    ),
                    // 球体光晕
                    Positioned(
                      top: 40,
                      left: 40,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              Colors.white.withOpacity(0.2),
                              Colors.white.withOpacity(0),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // 中圆装饰
              Positioned(
                top: 60,
                left: -60,
                child: Stack(
                  children: [
                    Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppTheme.primary.withOpacity(0.2),
                            AppTheme.primary.withOpacity(0.05),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.primary.withOpacity(0.1),
                            blurRadius: 15,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                    ),
                    // 添加内部光晕
                    Positioned(
                      top: 30,
                      left: 30,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              AppTheme.primary.withOpacity(0.2),
                              AppTheme.primary.withOpacity(0),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // 小圆装饰1
              Positioned(
                top: 40,
                right: 40,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppTheme.secondary.withOpacity(0.3),
                        AppTheme.secondary.withOpacity(0.1),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.secondary.withOpacity(0.1),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
              ),
              // 小圆装饰2
              Positioned(
                top: 80,
                right: 100,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        Colors.white.withOpacity(0.3),
                        Colors.white.withOpacity(0.1),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.1),
                        blurRadius: 6,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
              ),
              // 主要内容
              SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      _buildUserInfo(),
                      SizedBox(height: 8.h),
                      _buildMemberCard(),
                      _buildUserStats(),
                      _buildMenuSection(),
                      SizedBox(height: 16.h),
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

  // 会员卡片组件
  Widget _buildMemberCard() {
    return Builder(builder: (context) {
      final isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
      return Container(
        height: 80.h,
        margin: EdgeInsets.symmetric(vertical: 8.h),
        child: PageView.builder(
          controller: controller.pageController,
          itemCount: null,
          onPageChanged: controller.onPageChanged,
          itemBuilder: (context, index) {
            final card = controller.getCard(index);
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: card.colors,
                  stops: const [0.2, 0.8],
                ),
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: card.colors[0].withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // 背景装饰
                  Positioned(
                    right: -15.w,
                    top: -15.h,
                    child: Container(
                      width: 70.w,
                      height: 70.w,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white.withOpacity(0.2),
                            Colors.white.withOpacity(0.1),
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
                      width: 80.w,
                      height: 80.w,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white.withOpacity(0.2),
                            Colors.white.withOpacity(0.05),
                          ],
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  // 主要内容
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              card.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withOpacity(0.2),
                                    offset: const Offset(0, 2),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              card.subtitle,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 12.sp,
                                letterSpacing: 0.3,
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withOpacity(0.2),
                                    offset: const Offset(0, 1),
                                    blurRadius: 2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.r),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.5),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          card.buttonText,
                          style: TextStyle(
                            color: card.buttonColor,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      );
    });
  }

  // 用户统计区域
  Widget _buildUserStats() {
    return Builder(builder: (context) {
      final isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
      return Container(
        margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 12.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? [
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.2),
                  ]
                : [
                    Colors.white.withOpacity(0.8),
                    Colors.white.withOpacity(0.6),
                  ],
          ),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isDark ? Colors.white.withOpacity(0.1) : Colors.white,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatItem(
              "作品",
              "12",
              const Color(0xFF6C5CE7),
              Icons.auto_awesome,
            ),
            _buildStatItem(
              "获赞",
              "1.2k",
              const Color(0xFFFF6B6B),
              Icons.favorite_border,
            ),
            _buildStatItem(
              "关注",
              "86",
              const Color(0xFF00B894),
              Icons.people_outline,
            ),
            _buildStatItem(
              "粉丝",
              "168",
              const Color(0xFF74B9FF),
              Icons.group_outlined,
            ),
          ],
        ),
      );
    });
  }

  // 统计项样式
  Widget _buildStatItem(
      String label, String value, Color color, IconData icon) {
    return Builder(builder: (context) {
      final isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
      return Container(
        width: 68.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 46.w,
              height: 46.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    color.withOpacity(isDark ? 0.2 : 0.1),
                    color.withOpacity(isDark ? 0.1 : 0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(14.r),
                border: Border.all(
                  color: color.withOpacity(isDark ? 0.3 : 0.2),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    color: isDark ? color.withOpacity(0.9) : color,
                    size: 18.w,
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: isDark ? color.withOpacity(0.9) : color,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
                color: isDark
                    ? Colors.white.withOpacity(0.7)
                    : AppColors.secondaryText,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    });
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
              color: const Color(0xFF74B9FF),
              onTap: () => controller.onTheme(),
            ),
            // _buildMenuItem(
            //   icon: Icons.notifications_outlined,
            //   label: LocaleKeys.myMenuNotifications.tr,
            //   color: const Color(0xFFFF6B6B),
            //   onTap: () => controller.onNotifications(),
            // ),
            _buildMenuItem(
              icon: Icons.help_outline,
              label: LocaleKeys.myMenuHelpFeedback.tr,
              color: const Color(0xFF00B894),
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
            // 简化箭头样式
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 14.w,
              color: isDark
                  ? Colors.white.withOpacity(0.5)
                  : Colors.black.withOpacity(0.3),
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

  // 构建图标按钮
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
