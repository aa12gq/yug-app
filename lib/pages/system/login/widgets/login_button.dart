import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yug_app/common/i18n/locale_keys.dart';
import 'package:yug_app/common/style/space.dart';
import 'package:yug_app/pages/system/login/controller.dart';

class LoginButton extends GetView<LoginController> {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.w,
      margin: EdgeInsets.only(bottom: AppSpace.listRow * 2),
      child: ElevatedButton(
        onPressed: controller.handleLogin,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.w),
          ),
          elevation: 8,
          shadowColor: context.theme.primaryColor.withOpacity(0.3),
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                context.theme.primaryColor,
                Color.lerp(
                  context.theme.primaryColor,
                  context.theme.colorScheme.secondary,
                  0.6,
                )!,
              ],
            ),
            borderRadius: BorderRadius.circular(25.w),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              LocaleKeys.loginButton.tr,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
