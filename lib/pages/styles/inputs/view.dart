import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yug_app/common/style/space.dart';
import 'package:yug_app/common/widgets/input.dart';

import 'index.dart';

class InputsPage extends GetView<InputsController> {
  const InputsPage({super.key});

  // 主视图
  Widget _buildView() {
    return <Widget>[
      // 标准
      InputWidget(
        controller: controller.emailController,
        placeholder: "Email",
      ),

      // 图标
      const InputWidget(
        placeholder: "username",
        prefix: Icon(Icons.person),
        suffix: Icon(Icons.done),
      ),

      // 密码
      const InputWidget(
        placeholder: "password",
        prefix: Icon(Icons.password),
        obscureText: true,
      ),

      // end
    ].toColumnSpace().center().paddingAll(AppSpace.page);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InputsController>(
      init: InputsController(),
      id: "inputs",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("inputs")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
