import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_app/common/index.dart';
import 'package:yug_app/common/i18n/locale_keys.dart';

import 'index.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

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
        borderRadius: showDivider ? null : BorderRadius.circular(12.r),
        border: showDivider
            ? null
            : Border.all(
                color: Colors.grey.withOpacity(0.1),
                width: 1,
              ),
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
            leading: Container(
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                color: (iconColor ?? AppColors.primaryText).withOpacity(0.06),
                borderRadius: BorderRadius.circular(8.r),
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
                      ),
                    ),
                  )
                : null,
            trailing: trailing ??
                (showArrow
                    ? Container(
                        width: 24.w,
                        height: 24.w,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.03),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 12.w,
                          color: AppColors.secondaryText,
                        ),
                      )
                    : null),
            onTap: onTap,
          ),
          if (showDivider)
            Divider(
              height: 1,
              thickness: 0.5,
              indent: 56.w,
              endIndent: 12.w,
              color: Colors.grey.withOpacity(0.1),
            ),
        ],
      ),
    );
  }

  // 构建设置分组
  Widget _buildSettingGroup({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 6.h),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.secondaryText,
              letterSpacing: 0.3,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                offset: const Offset(0, 1),
                blurRadius: 6,
              ),
            ],
          ),
          child: Column(
            children: children,
          ),
        ),
      ],
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
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryText,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: SafeArea(
            child: ListView(
              children: [
                // 账号与安全
                _buildSettingGroup(
                  title: LocaleKeys.settingsAccountSecurity.tr,
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
                // 通知与缓存
                _buildSettingGroup(
                  title: LocaleKeys.settingsNotificationCache.tr,
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
                          horizontal: 12.w,
                          vertical: 4.h,
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
                SizedBox(height: 24.h),
                // 退出登录
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.02),
                        offset: const Offset(0, 1),
                        blurRadius: 6,
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
                SizedBox(height: 32.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
