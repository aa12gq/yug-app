import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                  0.4,
                )!,
                Color.lerp(
                  context.theme.primaryColor,
                  context.theme.colorScheme.tertiary,
                  0.8,
                )!,
              ],
              stops: const [0.0, 0.6, 1.0],
            ),
            borderRadius: BorderRadius.circular(25.w),
            boxShadow: [
              BoxShadow(
                color: context.theme.primaryColor.withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
              BoxShadow(
                color: context.theme.colorScheme.secondary.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(5, 0),
              ),
            ],
          ),
          child: Container(
            width: double.infinity,
            height: 50.w,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.login_rounded,
                  size: 20.w,
                  color: Colors.white.withOpacity(0.9),
                ),
                SizedBox(width: 8.w),
                Text(
                  "登录",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.95),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: const Offset(1, 1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
