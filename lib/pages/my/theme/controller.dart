import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:yug_app/common/services/config.dart';
import 'package:yug_app/common/style/theme.dart';

class ThemeController extends GetxController {
  ThemeController();

  // 当前主题模式
  String get currentThemeMode {
    final mode = AdaptiveTheme.of(Get.context!).mode;
    switch (mode) {
      case AdaptiveThemeMode.light:
        return 'light';
      case AdaptiveThemeMode.dark:
        return 'dark';
      case AdaptiveThemeMode.system:
        return 'system';
      default:
        return 'light';
    }
  }

  // 当前主题色
  String get currentThemeColor => ConfigService.to.themeColor;

  // 主题颜色列表
  Map<String, Color> get themeColors => AppTheme.themeColors;

  _initData() {
    update(["theme"]);
  }

  // 切换主题模式
  void onThemeModeSelected(String mode) async {
    final adaptiveTheme = AdaptiveTheme.of(Get.context!);
    switch (mode) {
      case 'light':
        adaptiveTheme.setLight();
        break;
      case 'dark':
        adaptiveTheme.setDark();
        break;
      case 'system':
        adaptiveTheme.setSystem();
        break;
    }
    await ConfigService.to.setThemeMode(mode);
    update(["theme"]);
  }

  // 选择主题颜色
  Future<void> onThemeColorSelected(String colorKey) async {
    await ConfigService.to.setThemeColor(colorKey);
    update(["theme"]);
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }
}
