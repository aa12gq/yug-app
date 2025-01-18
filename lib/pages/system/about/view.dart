import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:yug_app/common/i18n/locale_keys.dart';
import 'package:yug_app/common/style/theme.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.aboutTitle.tr),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // 背景渐变
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppTheme.primary.withOpacity(0.15),
                  Colors.white,
                ],
              ),
            ),
          ),

          // 右上大圆
          Positioned(
            right: -100,
            top: -100,
            child: Container(
              width: 300,
              height: 300,
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
              ),
            ),
          ),

          // 左下大圆
          Positioned(
            left: -50,
            bottom: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppTheme.secondary.withOpacity(0.2),
                    AppTheme.secondary.withOpacity(0.05),
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
                      AppTheme.primary.withOpacity(0.5),
                      AppTheme.primary.withOpacity(0.1),
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
              final version = snapshot.hasData ? snapshot.data!.version : '';
              final buildNumber =
                  snapshot.hasData ? snapshot.data!.buildNumber : '';

              return SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(height: 16.h),

                    // Logo
                    Container(
                      width: 100.w,
                      height: 100.w,
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        color: AppTheme.primary.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(25.w),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.primary.withOpacity(0.1),
                            blurRadius: 20,
                            spreadRadius: 1,
                          ),
                        ],
                        border: Border.all(
                          color: AppTheme.primary.withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                      child: Image.asset(
                        'assets/icons/launcher_ios.png',
                        width: 60.w,
                        height: 60.w,
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // 应用名称
                    Text(
                      LocaleKeys.appName.tr,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.primary.withOpacity(0.8),
                      ),
                    ),
                    SizedBox(height: 8.h),

                    // 版本号
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: AppTheme.primary.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(20.w),
                      ),
                      child: Text(
                        'v$version ($buildNumber)',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppTheme.primary.withOpacity(0.6),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // 应用简介
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 24.w),
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        color: AppTheme.primary.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(20.w),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.primary.withOpacity(0.1),
                            blurRadius: 20,
                            spreadRadius: 1,
                          ),
                        ],
                        border: Border.all(
                          color: AppTheme.primary.withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        LocaleKeys.appDescription.tr,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppTheme.primary.withOpacity(0.8),
                          height: 1.6,
                          letterSpacing: 0.3,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 32.h),

                    // 功能特点列表
                    ...LocaleKeys.appFeatures.tr
                        .split('\\n')
                        .map(
                          (feature) => Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 8.h),
                            padding: EdgeInsets.all(20.w),
                            decoration: BoxDecoration(
                              color: AppTheme.primary.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(20.w),
                              boxShadow: [
                                BoxShadow(
                                  color: AppTheme.primary.withOpacity(0.1),
                                  blurRadius: 20,
                                  spreadRadius: 1,
                                ),
                              ],
                              border: Border.all(
                                color: AppTheme.primary.withOpacity(0.1),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 44.w,
                                  height: 44.w,
                                  decoration: BoxDecoration(
                                    color: AppTheme.primary.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(14.w),
                                    border: Border.all(
                                      color: AppTheme.primary.withOpacity(0.2),
                                      width: 1,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.check_circle_outline,
                                    color: AppTheme.primary.withOpacity(0.8),
                                    size: 24.w,
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Expanded(
                                  child: Text(
                                    feature,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppTheme.primary.withOpacity(0.8),
                                      height: 1.5,
                                      letterSpacing: 0.3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),

                    SizedBox(height: 32.h),

                    // 版权信息
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: AppTheme.primary.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(20.w),
                      ),
                      child: Text(
                        '© ${DateTime.now().year} ${LocaleKeys.appName.tr}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppTheme.primary.withOpacity(0.6),
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
