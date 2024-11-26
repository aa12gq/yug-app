import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yug_app/global.dart';

import 'common/index.dart';

Future<void> main() async {
  // initialize global
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // title
      title: '语光 APP',

      // theme
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),

      // route
      initialRoute: RouteNames.stylesStylesIndex,
      getPages: RoutePages.list,
      navigatorObservers: [RoutePages.observer],

      // i18n
      translations: Translation(), // dictionary
      localizationsDelegates: Translation.localizationsDelegates, // delegates
      supportedLocales: Translation.supportedLocales, // supported locales
      locale: ConfigService.to.locale, // current locale
      fallbackLocale: Translation.fallbackLocale, // fallback locale
    );
  }
}
