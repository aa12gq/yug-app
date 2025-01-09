import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yug_app/common/i18n/locale_keys.dart';
import 'package:yug_app/common/routers/name.dart';
import 'package:yug_app/common/style/space.dart';

class RegisterLink extends StatelessWidget {
  const RegisterLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: AppSpace.listRow),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => Get.toNamed(RouteNames.systemRegister),
            borderRadius: BorderRadius.circular(20),
            splashColor: context.theme.primaryColor.withOpacity(0.1),
            highlightColor: context.theme.primaryColor.withOpacity(0.05),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpace.listItem * 1.5,
                vertical: AppSpace.listRow * 0.8,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: context.theme.primaryColor.withOpacity(0.2),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    LocaleKeys.loginNoAccount.tr,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: context.theme.hintColor,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  ShaderMask(
                    shaderCallback: (bounds) {
                      return LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          context.theme.primaryColor,
                          context.theme.colorScheme.secondary,
                        ],
                      ).createShader(bounds);
                    },
                    child: Text(
                      LocaleKeys.loginRegisterNow.tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 12.w,
                    color: context.theme.primaryColor.withOpacity(0.8),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
