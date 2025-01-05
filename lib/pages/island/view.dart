import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class IslandPage extends GetView<IslandController> {
  const IslandPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("Island"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IslandController>(
      init: IslandController(),
      id: "island",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("语乐岛")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
