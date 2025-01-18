import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:yug_app/common/index.dart';
import 'package:yug_app/common/utils/storage.dart';

/// configuration service
class ConfigService extends GetxController {
  // this is a singleton
  static ConfigService get to => Get.find();

  PackageInfo? _platform;
  String get version => _platform?.version ?? '-';

  Locale locale = PlatformDispatcher.instance.locale;

  // 是否首次打开
  bool get isAlreadyOpen => Storage().getBool(Constants.storageAlreadyOpen);

  // 主题
  AdaptiveThemeMode themeMode = AdaptiveThemeMode.light;
  String _themeColor = 'mint'; // 当前主题颜色
  String get themeColor => _themeColor;

  @override
  void onReady() {
    super.onReady();
    getPlatform();
    initLocale();
    initTheme();
    initThemeColor();
  }

  Future<void> getPlatform() async {
    _platform = await PackageInfo.fromPlatform();
  }

  // 初始 theme
  Future<void> initTheme() async {
    final savedThemeMode = await AdaptiveTheme.getThemeMode();
    themeMode = savedThemeMode ?? AdaptiveThemeMode.light;
    _applyTheme();
  }

  // 应用主题
  void _applyTheme() {
    if (Get.context == null) return;

    AdaptiveTheme.of(Get.context!).setTheme(
      light: AppTheme.light,
      dark: AppTheme.dark,
    );
  }

  // init locale
  void initLocale() {
    var langCode = Storage().getString(Constants.storageLanguageCode);
    if (langCode.isEmpty) return;
    var index = Translation.supportedLocales.indexWhere((element) {
      return element.languageCode == langCode;
    });
    if (index < 0) return;
    locale = Translation.supportedLocales[index];
  }

  // update locale
  void onLocaleUpdate(Locale value) {
    locale = value;
    Get.updateLocale(value);
    Storage().setString(Constants.storageLanguageCode, value.languageCode);
  }

  // 初始化主题颜色
  void initThemeColor() {
    var savedColor = Storage().getString(Constants.storageThemeColor);
    _themeColor = savedColor.isEmpty ? 'mint' : savedColor;
    _applyTheme();
  }

  // 设置主题颜色
  Future<void> setThemeColor(String colorKey) async {
    _themeColor = colorKey;
    Storage().setString(Constants.storageThemeColor, colorKey);
    _applyTheme();
    update();
  }

  // 切换 theme
  Future<void> setThemeMode(String themeKey) async {
    if (Get.context == null) return;

    switch (themeKey) {
      case "light":
        AdaptiveTheme.of(Get.context!).setTheme(
          light: AppTheme.light,
          dark: AppTheme.dark,
        );
        themeMode = AdaptiveThemeMode.light;
        break;
      case "dark":
        AdaptiveTheme.of(Get.context!).setTheme(
          light: AppTheme.light,
          dark: AppTheme.dark,
        );
        themeMode = AdaptiveThemeMode.dark;
        break;
      case "system":
        AdaptiveTheme.of(Get.context!).setTheme(
          light: AppTheme.light,
          dark: AppTheme.dark,
        );
        themeMode = AdaptiveThemeMode.system;
        break;
    }
    update();
  }

  // 标记已打开app
  void setAlreadyOpen() {
    Storage().setBool(Constants.storageAlreadyOpen, true);
  }
}
