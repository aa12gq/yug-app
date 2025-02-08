import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_app/common/index.dart';
import 'package:yug_app/common/i18n/locale_keys.dart';

import 'index.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  // 构建分组标题
  Widget _buildGroupTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, top: 16.h, bottom: 6.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.secondaryText,
          letterSpacing: 0.3,
        ),
      ),
    );
  }

  // 构建设置项
  Widget _buildSettingItem({
    required String title,
    required IconData icon,
    String? subtitle,
    Color? iconColor,
    VoidCallback? onTap,
    bool showDivider = true,
    bool showArrow = true,
    Widget? trailing,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: !showDivider ? BorderRadius.circular(12.r) : null,
        boxShadow: !showDivider
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 8,
                  offset: const Offset(0, 1),
                ),
              ]
            : null,
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.h),
            minVerticalPadding: 0,
            leading: Container(
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                color: (iconColor ?? AppColors.primaryText).withOpacity(0.08),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                icon,
                color: iconColor ?? AppColors.primaryText,
                size: 18.w,
              ),
            ),
            title: Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryText,
              ),
            ),
            subtitle: subtitle != null
                ? Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: AppColors.secondaryText,
                        height: 1.3,
                      ),
                    ),
                  )
                : null,
            trailing: trailing ??
                (showArrow
                    ? Icon(
                        Icons.arrow_forward_ios,
                        size: 14.w,
                        color: AppColors.secondaryText.withOpacity(0.5),
                      )
                    : null),
            onTap: onTap,
          ),
          if (showDivider)
            Divider(
              height: 1,
              thickness: 0.5,
              indent: 60.w,
              color: Colors.grey.withOpacity(0.08),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      init: SettingsController(),
      id: "settings",
      builder: (_) {
        return Scaffold(
          backgroundColor: const Color(0xFFF8F9FA),
          appBar: AppBar(
            title: Text(
              LocaleKeys.settingsTitle.tr,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryText,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0.3,
            toolbarHeight: 44.h,
            shadowColor: Colors.black.withOpacity(0.05),
          ),
          body: SafeArea(
            child: ListView(
              children: [
                SizedBox(height: 6.h),

                // 账号与安全
                _buildGroupTitle(LocaleKeys.settingsAccountSecurity.tr),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      _buildSettingItem(
                        title: LocaleKeys.settingsAccountSecurity.tr,
                        subtitle: LocaleKeys.settingsAccountSecurityDesc.tr,
                        icon: Icons.security_outlined,
                        iconColor: const Color(0xFF6C5CE7),
                        onTap: () => controller.onAccountSecurity(),
                      ),
                      _buildSettingItem(
                        title: LocaleKeys.myMenuPrivacy.tr,
                        subtitle: LocaleKeys.settingsPrivacyDesc.tr,
                        icon: Icons.lock_outline,
                        iconColor: const Color(0xFF74B9FF),
                        onTap: () => controller.onPrivacy(),
                        showDivider: false,
                      ),
                    ],
                  ),
                ),

                // 通知与缓存
                _buildGroupTitle("通知与存储"),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      _buildSettingItem(
                        title: LocaleKeys.settingsNotification.tr,
                        subtitle: LocaleKeys.settingsNotificationDesc.tr,
                        icon: Icons.notifications_outlined,
                        iconColor: const Color(0xFFFF7675),
                        onTap: () => controller.onNotifications(),
                      ),
                      _buildSettingItem(
                        title: LocaleKeys.settingsClearCache.tr,
                        subtitle: LocaleKeys.settingsClearCacheDesc.tr,
                        icon: Icons.delete_outline,
                        iconColor: const Color(0xFF00B894),
                        trailing: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 3.h,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF00B894).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            controller.cacheSize,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xFF00B894),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        onTap: () => controller.onClearCache(),
                        showDivider: false,
                      ),
                    ],
                  ),
                ),

                // 个性化设置
                _buildGroupTitle("个性化"),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      _buildSettingItem(
                        title: LocaleKeys.myMenuLanguage.tr,
                        subtitle: "Change language / 更改语言",
                        icon: Icons.language_outlined,
                        iconColor: const Color(0xFF00B894),
                        onTap: () => controller.onLanguage(),
                      ),
                      _buildSettingItem(
                        title: LocaleKeys.myMenuTheme.tr,
                        subtitle: "Light/Dark mode and theme colors",
                        icon: Icons.palette_outlined,
                        iconColor: const Color(0xFF74B9FF),
                        onTap: () => controller.onTheme(),
                      ),
                      _buildSettingItem(
                        title: LocaleKeys.myMenuHelpFeedback.tr,
                        icon: Icons.help_outline,
                        iconColor: const Color(0xFF00B894),
                        onTap: () => controller.onHelpAndFeedback(),
                        showDivider: false,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24.h),

                // 退出登录
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: _buildSettingItem(
                      title: LocaleKeys.settingsLogout.tr,
                      icon: Icons.logout,
                      iconColor: Colors.red,
                      showDivider: false,
                      showArrow: false,
                      onTap: () => controller.onLogout(),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
