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
  Widget _buildForm() {
    return Form(
      key: controller.formKey, // 设置globalKey，用于后面获取FormState
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: <Widget>[
        // username
        InputFormFieldWidget(
          autofocus: true,
          controller: controller.userNameController,
          labelText: LocaleKeys.registerFormName.tr,
          prefix: const Icon(Icons.person),
          // suffix: const Icon(Icons.done),
          validator: Validatorless.multiple([
            Validatorless.required(LocaleKeys.validatorRequired.tr),
            Validatorless.min(
                3, LocaleKeys.validatorMin.trParams({"size": "3"})),
            Validatorless.max(
                20, LocaleKeys.validatorMax.trParams({"size": "20"})),
          ]),
        ).paddingBottom(AppSpace.listRow.w),

        // email
        InputFormFieldWidget(
          controller: controller.emailController,
          labelText: LocaleKeys.registerFormEmail.tr,
          keyboardType: TextInputType.emailAddress,
          prefix: const Icon(Icons.email),
          // suffix: const Icon(Icons.done),
          validator: Validatorless.multiple([
            Validatorless.required(LocaleKeys.validatorRequired.tr),
            Validatorless.email(LocaleKeys.validatorEmail.tr),
          ]),
        ).paddingBottom(AppSpace.listRow.w),

        // first name
        InputFormFieldWidget(
          controller: controller.firstNameController,
          labelText: LocaleKeys.registerFormFirstName.tr,
          prefix: const Icon(Icons.person),
          // suffix: const Icon(Icons.done),
          validator: Validatorless.multiple([
            Validatorless.required(LocaleKeys.validatorRequired.tr),
            Validatorless.min(
                3, LocaleKeys.validatorMin.trParams({"size": "3"})),
            Validatorless.max(
                20, LocaleKeys.validatorMax.trParams({"size": "20"})),
          ]),
        ).paddingBottom(AppSpace.listRow.w),

        // last name
        InputFormFieldWidget(
          controller: controller.lastNameController,
          labelText: LocaleKeys.registerFormLastName.tr,
          prefix: const Icon(Icons.person),
          // suffix: const Icon(Icons.done),
          validator: Validatorless.multiple([
            Validatorless.required(LocaleKeys.validatorRequired.tr),
            Validatorless.min(
                3, LocaleKeys.validatorMin.trParams({"size": "3"})),
            Validatorless.max(
                20, LocaleKeys.validatorMax.trParams({"size": "20"})),
          ]),
        ).paddingBottom(AppSpace.listRow.w),

        // password
        InputFormFieldWidget(
          controller: controller.passwordController,
          labelText: LocaleKeys.registerFormPassword.tr,
          prefix: const Icon(Icons.password),
          obscureText: true,
          // suffix: const Icon(Icons.done),
          validator: Validatorless.multiple([
            Validatorless.required(LocaleKeys.validatorRequired.tr),
            Validators.password(
              8,
              18,
              LocaleKeys.validatorPassword.trParams(
                {"min": "8", "max": "18"},
              ),
            ),
          ]),
        ).paddingBottom(AppSpace.listRow.w * 2),

        // 注册按钮
        _buildBtnSignUp(),

        // 提示文字
        _buildTips(),

        //
      ].toColumn().paddingVertical(10),
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
        _buildForm().card(
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
            child: _buildView(context),
          ),
        );
      },
    );
  }
}
