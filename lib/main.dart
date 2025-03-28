import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:yug_app/global.dart';
import 'package:app_links/app_links.dart';
import 'package:yug_app/common/index.dart';
import 'package:yug_app/common/style/theme.dart';
import 'plugins/app_link.dart';
import 'plugins/aliyun_push.dart';

// 全局导航键引用
final GlobalKey<NavigatorState> globalNavigatorKey =
    GlobalKey<NavigatorState>();

Future<void> main() async {
  // 确保Flutter框架初始化
  WidgetsFlutterBinding.ensureInitialized();

  // 初始化全局配置
  await Global.init();

  // 初始化阿里云推送
  await initAliyunPush();

  // 监听通知跳转
  try {
    final appLinks = AppLinks();
    appLinks.uriLinkStream.listen((uri) {
      if (globalNavigatorKey.currentContext != null) {
        schemeJump(uri.toString());
      }
    });
  } catch (e) {
    print('AppLinks初始化失败: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896), // 设计稿中设备的尺寸(单位随意,建议dp,但在使用过程中必须保持一致)
      splitScreenMode: false, // 支持分屏尺寸
      minTextAdapt: false, // 是否根据宽度/高度中的最小值适配文字

      // 构建
      builder: (context, child) => AdaptiveTheme(
        // 样式
        light: AppTheme.light, // 亮色主题
        dark: AppTheme.dark, // 暗色主题
        initial: AdaptiveThemeMode.light, // 初始主题
        debugShowFloatingThemeButton: false, // 显示主题按钮

        // 构建
        builder: (light, dark) => GetMaterialApp(
          title: '语光',

          // 主题
          theme: light,
          darkTheme: dark,

          // 路由
          initialRoute: RouteNames.systemSplash,
          getPages: RoutePages.list,
          navigatorObservers: [RoutePages.observer],

          // 多语言
          translations: Translation(), // 词典
          localizationsDelegates: Translation.localizationsDelegates, // 代理
          supportedLocales: Translation.supportedLocales, // 支持的语言种类
          locale: ConfigService.to.locale, // 当前语言种类
          fallbackLocale: Translation.fallbackLocale, // 默认语言种类

          // builder
          builder: (context, widget) {
            widget = EasyLoading.init()(context, widget); // EasyLoading 初始
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
      ),
    );
  }
}
