import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yug_app/common/i18n/index.dart';
import 'package:yug_app/common/routers/name.dart';
import 'package:yug_app/common/services/index.dart';

import 'index.dart';

class StylesIndexPage extends GetView<StylesIndexController> {
  const StylesIndexPage({super.key});

  // main view
  Widget _buildView() {
    return Column(
      children: [
        ListTile(
          onTap: controller.onLanguageSelected,
          title: Text(
            "语言 : ${ConfigService.to.locale.toLanguageTag()}",
          ),
        ),

        // 主题
        ListTile(
          onTap: () => controller.onThemeSelected("light"),
          title: Text("亮色 : ${ConfigService.to.themeMode}"),
        ),
        ListTile(
          onTap: () => controller.onThemeSelected("dark"),
          title: Text("暗色 : ${ConfigService.to.themeMode}"),
        ),
        ListTile(
          onTap: () => controller.onThemeSelected("system"),
          title: Text("系统 : ${ConfigService.to.themeMode}"),
        ),
        // 文本
        ListTile(
          onTap: () => Get.toNamed(RouteNames.stylesText),
          title: const Text("Text 文本"),
        ),
        // Input 输入框
        ListTile(
          onTap: () => Get.toNamed(RouteNames.stylesInputs),
          title: const Text("Input 输入框"),
        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed:
                    controller.isLoading.value ? null : controller.getUserInfo,
                child: Obx(() => controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : const Text("测试 gRPC 通信")),
              ),
              Obx(() => controller.errorMessage.value.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        controller.errorMessage.value,
                        style: const TextStyle(color: Colors.red),
                      ),
                    )
                  : const SizedBox.shrink()),
              Obx(() => controller.userInfo.value.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        '用户信息: ${controller.userInfo.value}',
                        style: const TextStyle(color: Colors.green),
                      ),
                    )
                  : const SizedBox.shrink()),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StylesIndexController>(
      init: StylesIndexController(),
      id: "styles_index",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text(LocaleKeys.stylesTitle.tr)),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
