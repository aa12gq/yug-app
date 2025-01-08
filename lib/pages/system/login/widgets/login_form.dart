import 'dart:ui';

import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yug_app/common/style/space.dart';
import 'package:yug_app/pages/system/login/controller.dart';
import 'package:yug_app/pages/system/login/widgets/agreement_checkbox.dart';
import 'package:yug_app/pages/system/login/widgets/login_button.dart';
import 'package:yug_app/pages/system/login/widgets/login_form_fields.dart';
import 'package:yug_app/pages/system/login/widgets/login_type_switcher.dart';
import 'package:yug_app/pages/system/login/widgets/or_divider.dart';
import 'package:yug_app/pages/system/login/widgets/register_link.dart';
import 'package:yug_app/pages/system/login/widgets/social_login_buttons.dart';

class LoginForm extends GetView<LoginController> {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            context.theme.colorScheme.surface,
            Color.lerp(
              context.theme.colorScheme.surface,
              context.theme.primaryColor,
              0.03,
            )!,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: context.theme.primaryColor.withOpacity(0.02),
            blurRadius: 30,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      child: Stack(
        children: [
          // 装饰背景
          Positioned(
            right: -60.w,
            bottom: -60.w,
            child: Container(
              width: 240.w,
              height: 240.w,
              decoration: BoxDecoration(
                gradient: SweepGradient(
                  center: Alignment.center,
                  startAngle: 0,
                  endAngle: 3.14 * 2,
                  colors: [
                    context.theme.primaryColor.withOpacity(0.1),
                    context.theme.primaryColor.withOpacity(0.05),
                    context.theme.primaryColor.withOpacity(0.02),
                    context.theme.primaryColor.withOpacity(0.05),
                    context.theme.primaryColor.withOpacity(0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(120.w),
              ),
            ),
          ),
          Positioned(
            left: -40.w,
            top: -40.w,
            child: Container(
              width: 160.w,
              height: 160.w,
              decoration: BoxDecoration(
                gradient: SweepGradient(
                  center: Alignment.center,
                  startAngle: 3.14,
                  endAngle: 3.14 * 3,
                  colors: [
                    context.theme.colorScheme.secondary.withOpacity(0.1),
                    context.theme.colorScheme.secondary.withOpacity(0.05),
                    context.theme.colorScheme.secondary.withOpacity(0.02),
                    context.theme.colorScheme.secondary.withOpacity(0.05),
                    context.theme.colorScheme.secondary.withOpacity(0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(80.w),
              ),
            ),
          ),
          Positioned(
            right: 20.w,
            top: 0,
            child: Container(
              width: 100.w,
              height: 100.w,
              decoration: BoxDecoration(
                gradient: SweepGradient(
                  center: Alignment.center,
                  startAngle: -3.14 / 2,
                  endAngle: 3.14 * 1.5,
                  colors: [
                    context.theme.colorScheme.tertiary.withOpacity(0.1),
                    context.theme.colorScheme.tertiary.withOpacity(0.05),
                    context.theme.colorScheme.tertiary.withOpacity(0.02),
                    context.theme.colorScheme.tertiary.withOpacity(0.05),
                    context.theme.colorScheme.tertiary.withOpacity(0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(50.w),
              ),
            ),
          ),

          // 表单内容
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surface.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.08),
                    width: 0.5,
                  ),
                ),
                child: Form(
                  key: controller.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: <Widget>[
                      // 登录类型选择
                      const LoginTypeSwitcher(),
                      SizedBox(height: 6.h),

                      // 登录表单
                      const LoginFormFields(),
                      SizedBox(height: 6.h),

                      // 用户协议勾选框
                      const AgreementCheckbox(),
                      SizedBox(height: 6.h),

                      // 登录按钮
                      const LoginButton(),
                      SizedBox(height: 8.h),

                      // OR
                      const OrDivider(),
                      SizedBox(height: 8.h),

                      // 社交登录按钮
                      const SocialLoginButtons(),
                      SizedBox(height: 8.h),

                      // 注册入口
                      const RegisterLink(),

                      // end
                    ].toColumn().paddingSymmetric(
                          horizontal: AppSpace.card * 0.5,
                          vertical: AppSpace.card * 0.4,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ).paddingAll(AppSpace.card * 0.4);
  }
}
