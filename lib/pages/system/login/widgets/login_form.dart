import 'dart:ui';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yug_app/common/style/space.dart';
import 'package:yug_app/pages/system/login/controller.dart';
import 'package:yug_app/pages/system/login/widgets/about_footer.dart';
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
    final isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
    return Form(
      key: controller.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Container(
        child: GetBuilder<LoginController>(
          builder: (_) => SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
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
              ],
            ).paddingSymmetric(
              horizontal: AppSpace.card * 0.5,
              vertical: AppSpace.card * 0.4,
            ),
          ),
        ),
      ).paddingAll(AppSpace.card * 0.4),
    );
  }
}
