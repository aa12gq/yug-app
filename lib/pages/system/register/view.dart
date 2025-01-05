import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';
import 'package:yug_app/common/components/page_title.dart';
import 'package:yug_app/common/index.dart';
import 'package:yug_app/common/utils/validators.dart';
import 'package:yug_app/common/widgets/form/input.dart';

import 'index.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  // 按钮
  Widget _buildBtnSignUp() {
    return ButtonWidget.primary(
      LocaleKeys.loginSignUp.tr,
      onTap: controller.onSignUp,
    ).width(double.infinity).paddingBottom(AppSpace.listRow);
  }

  // 提示
  Widget _buildTips() {
    return <Widget>[
      // 提示
      TextWidget.h4(LocaleKeys.registerHaveAccount.tr),

      // 登录文字按钮
      ButtonWidget.ghost(
        LocaleKeys.loginSignIn.tr,
        onTap: controller.onSignIn,
      )
    ].toRow(
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  // 表单页
  Widget _buildForm(BuildContext context) {
    return Form(
      key: controller.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: <Widget>[
        // 注册类型选择
        <Widget>[
          Obx(() => ButtonWidget.text(
                LocaleKeys.registerTypeUsername.tr,
                onTap: () => controller.switchRegisterType('username'),
                textColor: controller.registerType.value == 'username'
                    ? context.theme.primaryColor
                    : null,
              )),
          Obx(() => ButtonWidget.text(
                LocaleKeys.registerTypePhone.tr,
                onTap: () => controller.switchRegisterType('phone'),
                textColor: controller.registerType.value == 'phone'
                    ? context.theme.primaryColor
                    : null,
              )),
          Obx(() => ButtonWidget.text(
                LocaleKeys.registerTypeEmail.tr,
                onTap: () => controller.switchRegisterType('email'),
                textColor: controller.registerType.value == 'email'
                    ? context.theme.primaryColor
                    : null,
              )),
        ]
            .toRow(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            )
            .paddingBottom(AppSpace.listRow),

        // 用户名输入框 (仅用户名密码注册时显示)
        if (controller.registerType.value == 'username')
          InputFormFieldWidget(
            controller: controller.userNameController,
            labelText: LocaleKeys.registerFormName.tr,
            validator: Validatorless.multiple([
              Validatorless.required(LocaleKeys.validatorRequired.tr),
              Validatorless.min(
                  3, LocaleKeys.validatorMin.trParams({"size": "3"})),
              Validatorless.max(
                  20, LocaleKeys.validatorMax.trParams({"size": "20"})),
            ]),
          ).paddingBottom(AppSpace.listRow),

        // 手机号输入框 (仅手机号注册时显示)
        if (controller.registerType.value == 'phone')
          InputFormFieldWidget(
            controller: controller.phoneController,
            labelText: LocaleKeys.registerFormPhoneNumber.tr,
            keyboardType: TextInputType.phone,
            validator: Validatorless.multiple([
              Validatorless.required(LocaleKeys.validatorRequired.tr),
              // TODO: 添加手机号验证
            ]),
          ).paddingBottom(AppSpace.listRow),

        // 邮箱输入框 (仅邮箱注册时显示)
        if (controller.registerType.value == 'email')
          InputFormFieldWidget(
            controller: controller.emailController,
            labelText: LocaleKeys.registerFormEmail.tr,
            keyboardType: TextInputType.emailAddress,
            validator: Validatorless.multiple([
              Validatorless.required(LocaleKeys.validatorRequired.tr),
              Validatorless.email(LocaleKeys.validatorEmail.tr),
            ]),
          ).paddingBottom(AppSpace.listRow),

        // 密码输入框 (始终显示)
        InputFormFieldWidget(
          controller: controller.passwordController,
          labelText: LocaleKeys.registerFormPassword.tr,
          obscureText: true,
          validator: Validatorless.multiple([
            Validatorless.required(LocaleKeys.validatorRequired.tr),
            Validators.password(
              6,
              18,
              LocaleKeys.validatorPassword.trParams({"min": "6", "max": "18"}),
            ),
          ]),
        ).paddingBottom(AppSpace.listRow),

        // 验证码输入框 (仅手机号和邮箱注册时显示)
        if (controller.registerType.value != 'username')
          <Widget>[
            InputFormFieldWidget(
              controller: controller.verifyCodeController,
              labelText: LocaleKeys.registerFormVerifyCode.tr,
              keyboardType: TextInputType.number,
              validator: Validatorless.multiple([
                Validatorless.required(LocaleKeys.validatorRequired.tr),
                // TODO: 添加验证码验证
              ]),
            ).expanded(),
            ButtonWidget.text(
              LocaleKeys.registerGetVerifyCode.tr,
              onTap: controller.getVerifyCode,
            ).paddingLeft(AppSpace.listItem),
          ].toRow().paddingBottom(AppSpace.listRow),

        // 注册按钮
        ButtonWidget.primary(
          LocaleKeys.loginSignUp.tr,
          onTap: controller.onSignUp,
        ).paddingBottom(AppSpace.listRow),

        // 登录文字
        TextWidget(
          text: LocaleKeys.registerHaveAccount.tr,
          type: TextWidgetType.body,
        ).alignCenter().onTap(controller.onSignIn),

        // end
      ].toColumn(),
    ).paddingAll(AppSpace.card);
  }

  // 内容页
  Widget _buildView(BuildContext context) {
    return SingleChildScrollView(
      child: <Widget>[
        // 头部标题
        PageTitleWidget(
          title: LocaleKeys.registerTitle.tr,
          desc: LocaleKeys.registerDesc.tr,
        ).paddingTop(50.w),

        // 表单
        _buildForm(context).card(
          color: context.colors.scheme.surface,
          margin: EdgeInsets.zero,
        ),
      ]
          .toColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .padding(
            bottom: AppSpace.page * 5,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      id: "register",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: Obx(() => _buildView(context)),
          ),
        );
      },
    );
  }
}
