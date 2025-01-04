import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yug_app/common/components/page_title.dart';
import 'package:yug_app/common/components/pin.dart';
import 'package:yug_app/common/index.dart';

import 'index.dart';

class RegisterPinPage extends GetView<RegisterPinController> {
  const RegisterPinPage({super.key});

  // pin 表单页
  Widget _buildForm() {
    return Form(
      key: controller.formKey, //设置globalKey，用于后面获取FormState
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: <Widget>[
        // 提示文
        TextWidget.label(LocaleKeys.registerPinFormTip.tr)
            .paddingBottom(20.w)
            .alignLeft(),

        // pin
        PinPutWidget(
          controller: controller.pinController,
          validator: controller.pinValidator, // 验证函数
          onSubmit: controller.onPinSubmit,
        ).paddingBottom(50.w),

        // 提交按钮
        ButtonWidget.primary(
          LocaleKeys.registerPinButton.tr,
          onTap: controller.onBtnSubmit,
        ).paddingBottom(AppSpace.listRow),

        // 返回按钮
        ButtonWidget.ghost(
          LocaleKeys.commonBottomCancel.tr,
          onTap: controller.onBtnBackup,
        ),

        // end
      ].toColumn(),
    ).paddingAll(AppSpace.card);
  }

  // 主视图
  Widget _buildView() {
    return SingleChildScrollView(
      child: <Widget>[
        // 头部标题
        PageTitleWidget(
          title: LocaleKeys.registerPinTitle.tr,
          desc: LocaleKeys.registerPinDesc.tr,
        ),

        // 表单
        _buildForm().card(),
      ]
          .toColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .paddingHorizontal(AppSpace.page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterPinController>(
      init: RegisterPinController(),
      id: "register_pin",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text(LocaleKeys.registerPinTitle.tr)),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
