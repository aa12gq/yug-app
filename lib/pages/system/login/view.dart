import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';
import 'package:yug_app/common/components/page_title.dart';
import 'package:yug_app/common/index.dart';
import 'package:yug_app/common/widgets/form/input.dart';

import 'index.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  // 表单页
  Widget _buildForm(BuildContext context) {
    return Form(
      key: controller.formKey, //设置globalKey，用于后面获取FormState
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: <Widget>[
        // username
        InputFormFieldWidget(
          controller: controller.userNameController,
          labelText: LocaleKeys.registerFormName.tr,
          // tipText: "输入账号或者登录Email",
          // placeholder: "请输入账号",
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
          obscureText: true,
          // tipText: "密码长度需要大于6位",
          // placeholder: "请输入密码",
          prefix: const Icon(Icons.person),
          // suffix: const Icon(Icons.done),
          validator: Validatorless.multiple([
            Validatorless.required(LocaleKeys.validatorRequired.tr),
            Validators.password(
              6,
              18,
              LocaleKeys.validatorPassword.trParams(
                {"min": "6", "max": "18"},
              ),
            ),
          ]),
        ).paddingBottom(AppSpace.listRow.w * 2),

        // Forgot Password?
        TextWidget.label(LocaleKeys.loginForgotPassword.tr)
            .alignRight()
            .paddingBottom(AppSpace.listRow),

        // register
        TextWidget.label(LocaleKeys.loginSignUp.tr)
            .onTap(() {
              Get.offNamed(RouteNames.systemRegister);
            })
            .alignRight()
            .paddingBottom(50.w),

        // 登录按钮
        ButtonWidget.primary(
          LocaleKeys.loginSignIn.tr,
          onTap: controller.onSignIn,
        ).width(double.infinity).paddingBottom(30.w),

        // OR
        TextWidget.label(LocaleKeys.loginOrText.tr).paddingBottom(30.w),

        // 其它登录按钮
        <Widget>[
          ButtonWidget.outline(
            "Github",
            icon: IconWidget.svg(AssetsSvgs.githubSvg),
            onTap: controller.onGithubSignIn,
          ),
          ButtonWidget.outline(
            "Google",
            icon: IconWidget.svg(AssetsSvgs.googleSvg),
            onTap: () {},
          ),
        ].toRow(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),

        // end
      ].toColumn().paddingVertical(10),
    ).paddingAll(AppSpace.card);
  }

  // 主视图
  Widget _buildView(BuildContext context) {
    return SingleChildScrollView(
      child: <Widget>[
        // 头部标题
        PageTitleWidget(
          title: LocaleKeys.loginBackTitle.tr,
          desc: LocaleKeys.loginBackDesc.tr,
        ).paddingTop(50.w),

        // 表单
        _buildForm(context).card(
          color: context.colors.scheme.surface,
          margin: EdgeInsets.zero,
          // shape: const RoundedRectangleBorder(
          //   borderRadius: BorderRadius.zero,
          // ),
        ),
      ]
          .toColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .paddingHorizontal(AppSpace.page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      id: "login",
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
