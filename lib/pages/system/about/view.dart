import 'dart:ui';

import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:yug_app/common/i18n/locale_keys.dart';
import 'package:yug_app/common/style/theme.dart';
import 'package:yug_app/common/utils/loading.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          LocaleKeys.aboutTitle.tr,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppTheme.primary,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: AppTheme.primary,
        ),
      ),
      body: Stack(
        children: [
          // 背景渐变
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  AppTheme.primary.withValues(alpha: 0.03),
                ],
              ),
            ),
          ),

          // 装饰圆形
          Positioned(
            right: -100.w,
            top: -60.h,
            child: Container(
              width: 200.w,
              height: 200.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppTheme.primary.withValues(alpha: 0.1),
                    AppTheme.primary.withValues(alpha: 0.02),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            left: -80.w,
            bottom: -40.h,
            child: Container(
              width: 160.w,
              height: 160.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppTheme.secondary.withValues(alpha: 0.08),
                    AppTheme.secondary.withValues(alpha: 0.02),
                  ],
                ),
              ),
            ),
          ),

          // 右侧装饰线条
          Positioned(
            right: 60,
            top: Get.height * 0.25,
            child: Transform.rotate(
              angle: 0.2,
              child: Container(
                width: 3,
                height: 150,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppTheme.primary.withValues(alpha: 0.5),
                      AppTheme.primary.withValues(alpha: 0.1),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // 主要内容
          FutureBuilder<PackageInfo>(
            future: PackageInfo.fromPlatform(),
            builder: (context, snapshot) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: kToolbarHeight + 48.h),

                    // Logo
                    Container(
                      width: 88.w,
                      height: 88.w,
                      padding: EdgeInsets.all(18.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24.w),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.primary.withValues(alpha: 0.1),
                            blurRadius: 20,
                            spreadRadius: 0,
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/icons/launcher_ios.png',
                        width: 52.w,
                        height: 52.w,
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // 应用名称
                    Text(
                      LocaleKeys.appName.tr,
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.primary,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: 8.h),

                    // 版本号
                    Text(
                      'v${snapshot.hasData ? snapshot.data!.version : ''} (${snapshot.hasData ? snapshot.data!.buildNumber : ''})',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.black45,
                      ),
                    ),
                    SizedBox(height: 40.h),

                    SizedBox(height: 32.h),

                    // 功能列表
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.w),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.primary.withValues(alpha: 0.06),
                            blurRadius: 20,
                            spreadRadius: 0,
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _buildListTile(
                            icon: Icons.system_update_outlined,
                            title: '检查更新',
                            onTap: () async {
                              // 显示检查中的提示
                              Loading.toast('正在检查更新...');

                              // 模拟网络请求延迟
                              await Future.delayed(Duration(seconds: 2));

                              // 显示检查结果
                              Loading.success('已是最新版本');
                            },
                          ),
                          _buildListTile(
                            icon: Icons.share_outlined,
                            title: '分享应用',
                            onTap: () {
                              // TODO: 实现分享功能
                            },
                          ),
                          _buildListTile(
                            icon: Icons.feedback_outlined,
                            title: '问题反馈',
                            onTap: () {
                              // TODO: 实现问题反馈功能
                            },
                          ),
                          _buildListTile(
                            icon: Icons.privacy_tip_outlined,
                            title: '隐私政策',
                            onTap: () {
                              // TODO: 跳转到隐私政策页面
                            },
                          ),
                          _buildListTile(
                            icon: Icons.description_outlined,
                            title: '用户协议',
                            onTap: () {
                              // TODO: 跳转到用户协议页面
                            },
                            showDivider: false,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 32.h),

                    // 版权信息
                    Text(
                      '© ${DateTime.now().year} ${LocaleKeys.appName.tr}',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black38,
                      ),
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool showDivider = true,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
          leading: Container(
            width: 32.w,
            height: 32.w,
            decoration: BoxDecoration(
              color: AppTheme.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(8.w),
            ),
            child: Icon(
              icon,
              size: 20.w,
              color: AppTheme.primary,
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 15.sp,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Icon(
            Icons.chevron_right_rounded,
            size: 20.w,
            color: Colors.black38,
          ),
          onTap: onTap,
        ),
        if (showDivider)
          Divider(
            height: 1,
            indent: 72.w,
            endIndent: 20.w,
            color: Colors.black12,
          ),
      ],
    );
  }
}
