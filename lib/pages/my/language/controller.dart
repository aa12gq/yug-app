import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:yug_app/common/index.dart';

class LanguageController extends GetxController {
  static LanguageController get to => Get.find();

  // 当前语言
  String currentLanguage = Get.locale?.languageCode ?? 'zh';

  // 更改语言
  Future<void> changeLanguage(String code) async {
    if (currentLanguage == code) return;

    // 更新语言
    var locale = Locale(code);
    Get.updateLocale(locale);
    currentLanguage = code;

    // 保存语言设置
    await Storage().setString(Constants.storageLanguageCode, code);

    // 更新状态
    update(["language"]);
  }

  @override
  void onInit() {
    super.onInit();
    // 初始化时获取当前语言
    currentLanguage = Get.locale?.languageCode ?? 'zh';
  }
}
