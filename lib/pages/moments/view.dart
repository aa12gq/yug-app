import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class MomentsPage extends GetView<MomentsController> {
  const MomentsPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("Moments"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MomentsController>(
      init: MomentsController(),
      id: "moments",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("动态")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
