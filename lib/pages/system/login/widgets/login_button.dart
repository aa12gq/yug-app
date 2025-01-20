import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yug_app/common/i18n/locale_keys.dart';
import 'package:yug_app/common/style/space.dart';
import 'package:yug_app/common/style/theme.dart';
import 'package:yug_app/pages/system/login/controller.dart';

class LoginButton extends GetView<LoginController> {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Container(
          width: double.infinity,
          height: 45.w,
          margin: EdgeInsets.only(bottom: AppSpace.listRow * 2),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => controller.handleLogin(),
              borderRadius: BorderRadius.circular(22.w),
              splashColor: isDark
                  ? Colors.white.withValues(alpha: 0.1)
                  : Colors.black.withValues(alpha: 0.1),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: isDark
                        ? [
                            AppTheme.primary.withValues(alpha: 0.8),
                            AppTheme.primary.withValues(alpha: 0.6),
                            AppTheme.primary.withValues(alpha: 0.8),
                          ]
                        : [
                            AppTheme.primary,
                            Color.lerp(AppTheme.primary, Colors.white, 0.3) ??
                                AppTheme.primary,
                            AppTheme.primary,
                          ],
                  ),
                  borderRadius: BorderRadius.circular(22.w),
                  boxShadow: isDark
                      ? []
                      : [
                          BoxShadow(
                            color: AppTheme.primary.withValues(alpha: 0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                            spreadRadius: 1,
                          ),
                        ],
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.login_rounded,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        LocaleKeys.loginButton.tr,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
