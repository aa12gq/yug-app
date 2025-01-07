import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';
import 'package:yug_app/common/style/space.dart';
import 'package:yug_app/common/utils/validators.dart';
import 'package:yug_app/common/widgets/form/input.dart';
import 'package:yug_app/pages/system/login/controller.dart';

class LoginFormFields extends GetView<LoginController> {
  const LoginFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          // 用户名输入框 (仅用户名密码登录时显示)
          if (controller.loginType.value == 'username')
            Hero(
              tag: 'username_field',
              child: InputFormFieldWidget(
                controller: controller.userNameController,
                labelText: "用户名",
                prefix: Icon(Icons.person, color: context.theme.primaryColor),
                validator: Validatorless.multiple([
                  Validatorless.required("请输入用户名"),
                  Validatorless.min(3, "用户名至少3个字符"),
                  Validatorless.max(20, "用户名最多20个字符"),
                ]),
              ),
            ).paddingBottom(AppSpace.listRow),

          // 手机号输入框 (仅手机号登录时显示)
          if (controller.loginType.value == 'phone')
            InputFormFieldWidget(
              controller: controller.phoneController,
              labelText: "手机号",
              keyboardType: TextInputType.phone,
              prefix:
                  Icon(Icons.phone_android, color: context.theme.primaryColor),
              validator: Validatorless.multiple([
                Validatorless.required("请输入手机号"),
                Validators.phone("请输入正确的手机号"),
              ]),
            ).paddingBottom(AppSpace.listRow),

          // 邮箱输入框 (仅邮箱登录时显示)
          if (controller.loginType.value == 'email')
            InputFormFieldWidget(
              controller: controller.emailController,
              labelText: "邮箱",
              keyboardType: TextInputType.emailAddress,
              prefix: Icon(Icons.email, color: context.theme.primaryColor),
              validator: Validatorless.multiple([
                Validatorless.required("请输入邮箱"),
                Validatorless.email("请输入正确的邮箱"),
              ]),
            ).paddingBottom(AppSpace.listRow),

          // 密码输入框 (仅用户名密码登录时显示)
          if (controller.loginType.value == 'username')
            Hero(
              tag: 'password_field',
              child: InputFormFieldWidget(
                controller: controller.passwordController,
                labelText: "密码",
                obscureText: true,
                prefix:
                    Icon(Icons.lock_outline, color: context.theme.primaryColor),
                validator: Validatorless.multiple([
                  Validatorless.required("请输入密码"),
                  Validators.password(6, 18, "密码长度为6-18位"),
                ]),
              ),
            ).paddingBottom(AppSpace.listRow),

          // 验证码输入框 (仅手机号和邮箱登录时显示)
          if (controller.loginType.value != 'username')
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
              decoration: BoxDecoration(
                color: context.theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(20.w),
                border: Border.all(
                  color: context.theme.primaryColor.withOpacity(0.1),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InputFormFieldWidget(
                      controller: controller.verifyCodeController,
                      labelText: "验证码",
                      keyboardType: TextInputType.number,
                      prefix: Icon(Icons.verified_user,
                          color: context.theme.primaryColor),
                      validator: Validatorless.multiple([
                        Validatorless.required("请输入验证码"),
                        Validatorless.min(4, "验证码至少4位"),
                        Validatorless.max(6, "验证码最多6位"),
                      ]),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  ElevatedButton(
                    onPressed: controller.getVerifyCode,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.theme.primaryColor,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 12.w),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.w),
                      ),
                    ),
                    child: const Text("获取验证码"),
                  ),
                ],
              ),
            ).paddingBottom(AppSpace.listRow),
        ],
      ),
    );
  }
}
