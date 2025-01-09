import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:yug_app/common/i18n/locale_keys.dart';
import 'package:yug_app/common/routers/name.dart';

class AboutFooter extends StatelessWidget {
  const AboutFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        final version = snapshot.hasData ? snapshot.data!.version : '';

        return GestureDetector(
          onTap: () => Get.toNamed(RouteNames.systemAbout),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Container(
                  width: 24.w,
                  height: 24.w,
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    color: context.theme.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6.w),
                  ),
                  child: Image.asset(
                    'assets/icons/launcher_ios.png',
                    width: 16.w,
                    height: 16.w,
                  ),
                ),
                SizedBox(width: 8.w),

                // 品牌名和版本号
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      LocaleKeys.appName.tr,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: context.theme.primaryColor,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.w),
                      decoration: BoxDecoration(
                        color: context.theme.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(3.w),
                      ),
                      child: Text(
                        'v$version',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: context.theme.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),

                // 箭头
                Padding(
                  padding: EdgeInsets.only(left: 4.w),
                  child: Icon(
                    Icons.chevron_right_rounded,
                    size: 16.w,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
