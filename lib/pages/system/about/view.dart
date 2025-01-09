import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:yug_app/common/i18n/locale_keys.dart';

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
      body: FutureBuilder<PackageInfo>(
        future: PackageInfo.fromPlatform(),
        builder: (context, snapshot) {
          final version = snapshot.hasData ? snapshot.data!.version : '';
          final buildNumber =
              snapshot.hasData ? snapshot.data!.buildNumber : '';

          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40.h),

                // Logo
                Container(
                  width: 100.w,
                  height: 100.w,
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: context.theme.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(25.w),
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
                    fontWeight: FontWeight.bold,
                    color: context.theme.primaryColor,
                  ),
                ),
                SizedBox(height: 8.h),

                // 版本号
                Text(
                  'v$version ($buildNumber)',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8.h),

                // 应用简介
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Text(
                    LocaleKeys.appDescription.tr,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey[600],
                      height: 1.6,
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
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: context.theme.cardColor,
                          borderRadius: BorderRadius.circular(16.w),
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.1),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 40.w,
                              height: 40.w,
                              decoration: BoxDecoration(
                                color:
                                    context.theme.primaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12.w),
                              ),
                              child: Icon(
                                Icons.check_circle_outline,
                                color: context.theme.primaryColor,
                                size: 24.w,
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: Text(
                                feature,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.grey[800],
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
                Text(
                  '© ${DateTime.now().year} ${LocaleKeys.appName.tr}',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 32.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
