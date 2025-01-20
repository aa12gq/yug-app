import 'dart:ui';

import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';
import 'package:yug_app/common/i18n/locale_keys.dart';
import 'package:yug_app/common/style/space.dart';
import 'package:yug_app/common/utils/validators.dart';
import 'package:yug_app/common/widgets/form/input.dart';
import 'package:yug_app/pages/system/login/controller.dart';
import 'package:yug_app/pages/system/login/widgets/register_link.dart';
import 'package:yug_app/common/style/theme.dart';

class LoginFormFields extends GetView<LoginController> {
  const LoginFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 用户名输入框 (仅用户名密码登录时显示)
          if (controller.loginType.value ==
              LocaleKeys.loginTypeUsernameValue.tr)
            Hero(
              tag: 'username_field',
              child: InputFormFieldWidget(
                controller: controller.userNameController,
                labelText: LocaleKeys.loginUsername.tr,
                placeholder: LocaleKeys.loginUsernameHint.tr,
                prefix: Icon(Icons.person, color: AppTheme.primary),
                validator: Validatorless.multiple([
                  Validatorless.required(LocaleKeys.loginUsernameRequired.tr),
                  Validatorless.min(3, LocaleKeys.loginUsernameLength.tr),
                  Validatorless.max(20, LocaleKeys.loginUsernameLength.tr),
                ]),
              ),
            ).paddingBottom(AppSpace.listRow * 0.5),

          // 手机号输入框 (仅手机号登录时显示)
          if (controller.loginType.value == LocaleKeys.loginTypePhoneValue.tr)
            InputFormFieldWidget(
              controller: controller.phoneController,
              labelText: LocaleKeys.loginPhone.tr,
              placeholder: LocaleKeys.loginPhoneHint.tr,
              keyboardType: TextInputType.phone,
              prefix: Icon(Icons.phone_android, color: AppTheme.primary),
              validator: Validatorless.multiple([
                Validatorless.required(LocaleKeys.loginPhoneRequired.tr),
                Validators.phone(LocaleKeys.loginPhoneInvalid.tr),
              ]),
            ).paddingBottom(AppSpace.listRow * 0.5),

          // 邮箱输入框 (仅邮箱登录时显示)
          if (controller.loginType.value == LocaleKeys.loginTypeEmailValue.tr)
            InputFormFieldWidget(
              controller: controller.emailController,
              labelText: LocaleKeys.loginEmail.tr,
              placeholder: LocaleKeys.loginEmailHint.tr,
              keyboardType: TextInputType.emailAddress,
              prefix: Icon(Icons.email, color: AppTheme.primary),
              validator: Validatorless.multiple([
                Validatorless.required(LocaleKeys.loginEmailRequired.tr),
                Validatorless.email(LocaleKeys.loginEmailInvalid.tr),
              ]),
            ).paddingBottom(AppSpace.listRow * 0.5),

          // 密码输入框 (仅用户名密码登录时显示)
          if (controller.loginType.value ==
              LocaleKeys.loginTypeUsernameValue.tr)
            Hero(
              tag: 'password_field',
              child: Obx(() => InputFormFieldWidget(
                    controller: controller.passwordController,
                    labelText: LocaleKeys.loginPassword.tr,
                    placeholder: LocaleKeys.loginPasswordHint.tr,
                    obscureText: !controller.isPasswordVisible.value,
                    prefix: Icon(Icons.lock_outline, color: AppTheme.primary),
                    suffix: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppTheme.primary,
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                    validator: Validatorless.multiple([
                      Validatorless.required(
                          LocaleKeys.loginPasswordRequired.tr),
                      Validators.password(
                          6, 18, LocaleKeys.loginPasswordLength.tr),
                    ]),
                  )),
            ).paddingBottom(AppSpace.listRow * 0.5),

          // 验证码输入框 (用户名密码登录时显示)
          if (controller.loginType.value ==
                  LocaleKeys.loginTypeUsernameValue.tr &&
              controller.needCaptcha.value)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: InputFormFieldWidget(
                    controller: controller.captchaController,
                    labelText: LocaleKeys.loginCaptcha.tr,
                    placeholder: LocaleKeys.loginCaptchaHint.tr,
                    prefix: Icon(Icons.verified_user_outlined,
                        color: AppTheme.primary),
                    validator: Validatorless.multiple([
                      Validatorless.required(
                          LocaleKeys.loginCaptchaRequired.tr),
                      Validatorless.min(4, LocaleKeys.loginCaptchaLength.tr),
                      Validatorless.max(6, LocaleKeys.loginCaptchaLength.tr),
                    ]),
                  ),
                ),
                SizedBox(width: 12.w),
                Padding(
                  padding: EdgeInsets.only(top: 28.w),
                  child: GetBuilder<LoginController>(
                    id: 'captcha',
                    builder: (_) {
                      return GestureDetector(
                        onTap: controller.refreshCaptcha,
                        child: Container(
                          width: 100.w,
                          height: 40.w,
                          decoration: BoxDecoration(
                            color: context.theme.cardColor,
                            borderRadius: BorderRadius.circular(12.w),
                            border: Border.all(
                              color: context.theme.dividerColor,
                              width: 0.5,
                            ),
                          ),
                          child: controller.captchaImage.value.isEmpty
                              ? Center(
                                  child: Text(
                                    LocaleKeys.loginGetCaptcha.tr,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: AppTheme.primary,
                                    ),
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(12.w),
                                  child: Image.memory(
                                    Uri.parse(controller.captchaImage.value)
                                        .data!
                                        .contentAsBytes(),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ).paddingBottom(AppSpace.listRow * 0.5),

          // 验证码输入框 (手机号或邮箱登录时显示)
          if (controller.loginType.value !=
              LocaleKeys.loginTypeUsernameValue.tr)
            Row(
              children: [
                Expanded(
                  child: InputFormFieldWidget(
                    controller: controller.verifyCodeController,
                    labelText: LocaleKeys.loginCaptcha.tr,
                    placeholder: LocaleKeys.loginCaptchaHint.tr,
                    prefix: Icon(Icons.verified_user_outlined,
                        color: AppTheme.primary),
                    validator: Validatorless.multiple([
                      Validatorless.required(
                          LocaleKeys.loginCaptchaRequired.tr),
                      Validatorless.min(4, LocaleKeys.loginCaptchaLength.tr),
                      Validatorless.max(6, LocaleKeys.loginCaptchaLength.tr),
                    ]),
                    suffix: SizedBox(
                      width: 100.w,
                      height: 36.w,
                      child: ElevatedButton(
                        onPressed: controller.getVerifyCode,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.w),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          LocaleKeys.loginGetCaptcha.tr,
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ).paddingBottom(AppSpace.listRow * 0.5),

          // 注册入口
          Align(
            alignment: Alignment.centerRight,
            child: const RegisterLink(),
          ).paddingOnly(bottom: AppSpace.card * 1.5),
        ],
      ),
    );
  }
}
