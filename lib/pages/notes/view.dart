import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class NotesPage extends GetView<NotesController> {
  const NotesPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("随心记"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotesController>(
      init: NotesController(),
      id: "notes",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("随心记")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
