import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                    color: context.theme.primaryColor.withOpacity(0.1),
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "还没有账号？",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color:
                          context.theme.colorScheme.onSurface.withOpacity(0.6),
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
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
                      ).createShader(bounds);
                    },
                    child: Text(
                      "立即注册",
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
