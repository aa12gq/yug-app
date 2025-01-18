import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yug_app/common/services/config.dart';
import 'package:yug_app/common/style/theme.dart';

class ThemeController extends GetxController {
  ThemeController();

  // 当前主题模式
  String get currentThemeMode =>
      ConfigService.to.themeMode.toString().split('.').last;

  // 当前主题色
  String get currentThemeColor => ConfigService.to.themeColor;

  // 主题颜色列表
  Map<String, Color> get themeColors => AppTheme.themeColors;

  _initData() {
    update(["theme"]);
  }

  // 切换主题模式
  void onThemeModeSelected(String mode) async {
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
