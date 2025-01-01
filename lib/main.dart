import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:get/get.dart';
import 'package:yug_app/global.dart';

import 'common/index.dart';
import 'common/style/theme.dart';

Future<void> main() async {
  // 确保Flutter框架初始化
  WidgetsFlutterBinding.ensureInitialized();

  // 初始化全局设置
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      // 样式
      light: AppTheme.light, // 亮色主题
      dark: AppTheme.dark, // 暗色主题
      initial: ConfigService.to.themeMode, // 初始主题
      debugShowFloatingThemeButton: true, // 显示主题按钮
      // 构建
      builder: (theme, darkTheme) => GetMaterialApp(
        // title
        title: '语光 APP',

        // theme
        theme: theme,
        darkTheme: darkTheme,

        // route
        initialRoute: RouteNames.systemSplash,
        getPages: RoutePages.list,
        navigatorObservers: [RoutePages.observer],

        // i18n
        translations: Translation(), // dictionary
        localizationsDelegates: Translation.localizationsDelegates, // delegates
        supportedLocales: Translation.supportedLocales, // supported locales
        locale: ConfigService.to.locale, // current locale
        fallbackLocale: Translation.fallbackLocale, // fallback locale

        // builder
        builder: (context, widget) {
          // 不随系统字体缩放比例
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.0)),
            child: widget!,
          );
        },

        // 隐藏 debug 标志
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
