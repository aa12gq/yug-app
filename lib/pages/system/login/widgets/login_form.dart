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
        borderRadius: BorderRadius.circular(32),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            context.theme.colorScheme.surface,
            Color.lerp(
              context.theme.colorScheme.surface,
              context.theme.primaryColor,
              0.05,
            )!,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
          BoxShadow(
            color: context.theme.primaryColor.withOpacity(0.03),
            blurRadius: 40,
            offset: const Offset(0, -10),
          ),
        ],
      ),
      child: Stack(
        children: [
          // 装饰背景
          Positioned(
            right: -80.w,
            bottom: -80.w,
            child: Container(
              width: 300.w,
              height: 300.w,
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
                borderRadius: BorderRadius.circular(150.w),
              ),
            ),
          ),
          Positioned(
            left: -50.w,
            top: -50.w,
            child: Container(
              width: 200.w,
              height: 200.w,
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
                borderRadius: BorderRadius.circular(100.w),
              ),
            ),
          ),
          Positioned(
            right: 30.w,
            top: 0,
            child: Container(
              width: 120.w,
              height: 120.w,
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
                borderRadius: BorderRadius.circular(60.w),
              ),
            ),
          ),

          // 表单内容
          ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surface.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.1),
                    width: 1,
                  ),
                ),
                child: Form(
                  key: controller.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: <Widget>[
                    // 登录类型选择
                    const LoginTypeSwitcher(),

                    // 登录表单
                    const LoginFormFields(),

                    // 用户协议勾选框
                    const AgreementCheckbox(),
                    SizedBox(height: 16.h),

                    // 登录按钮
                    const LoginButton(),

                    // OR
                    const OrDivider(),

                    // 社交登录按钮
                    const SocialLoginButtons(),

                    // 注册入口
                    const RegisterLink(),

                    // end
                  ].toColumn().paddingAll(AppSpace.card),
                ),
              ),
            ),
          ),
        ],
      ),
    ).paddingAll(AppSpace.card);
  }
}
