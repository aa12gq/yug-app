import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class SocialPage extends GetView<SocialController> {
  const SocialPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("Social"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SocialController>(
      init: SocialController(),
      id: "social",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("社交")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
