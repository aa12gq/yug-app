import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:yug_app/common/index.dart';
import 'package:yug_app/common/utils/storage.dart';

/// configuration service
class ConfigService extends GetxController {
  static ConfigService get to => Get.find();

  PackageInfo? _platform;
  String get version => _platform?.version ?? '-';

  Locale locale = PlatformDispatcher.instance.locale;

  // 是否首次打开
  bool get isAlreadyOpen => Storage().getBool(Constants.storageAlreadyOpen);

  // 主题模式
  late AdaptiveThemeMode themeMode;

  // 主题颜色
  String _themeColor = 'mint';
  String get themeColor => _themeColor;

  // 初始化
  Future<ConfigService> init() async {
    await getPlatform();
    await initTheme();
    initLocale();
    initThemeColor();
    return this;
  }

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

  // 初始化主题
  Future<void> initTheme() async {
    final savedThemeMode = await AdaptiveTheme.getThemeMode();
    themeMode = savedThemeMode ?? AdaptiveThemeMode.light;
  }

  // 设置主题模式
  Future<void> setThemeMode(String mode) async {
    switch (mode) {
      case 'light':
        themeMode = AdaptiveThemeMode.light;
        break;
      case 'dark':
        themeMode = AdaptiveThemeMode.dark;
        break;
      case 'system':
        themeMode = AdaptiveThemeMode.system;
        break;
    }
    // 保存到本地存储
    await Storage().setString('theme_mode', mode);
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
    var savedColor = Storage().getString('theme_color');
    _themeColor = savedColor.isEmpty ? 'mint' : savedColor;
    _applyTheme();
  }

  // 设置主题颜色
  Future<void> setThemeColor(String colorKey) async {
    _themeColor = colorKey;
    await Storage().setString('theme_color', colorKey);
    _applyTheme();
    update();
  }

  // 应用主题
  void _applyTheme() {
    if (Get.context == null) return;
    AdaptiveTheme.of(Get.context!).setTheme(
      light: AppTheme.light,
      dark: AppTheme.dark,
    );
  }

  // 标记已打开app
  void setAlreadyOpen() {
    Storage().setBool(Constants.storageAlreadyOpen, true);
  }
}
