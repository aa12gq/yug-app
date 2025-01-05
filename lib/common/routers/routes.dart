import 'package:get/get.dart';
import 'package:yug_app/pages/island/index.dart';

class AppRoutes {
  // 语乐岛路由
  static const String islandMain = '/island';
  static const String islandSearch = '/island/search';
  static const String islandNotifications = '/island/notifications';
  static const String islandEmotionMap = '/island/emotion-map';
  static const String islandMoodWeather = '/island/mood-weather';
  static const String islandCreativeIsland = '/island/creative-island';
  static const String islandThemeSpace = '/island/theme-space';
  static const String islandInteractiveGames = '/island/interactive-games';
  static const String islandCreativeShowcase = '/island/creative-showcase';
  static const String islandActivities = '/island/activities';
  static const String islandCoCreation = '/island/co-creation';

  // 路由页面
  static final List<GetPage> getPages = [
    // 语乐岛
    GetPage(
      name: islandMain,
      page: () => const IslandPage(),
      binding: IslandBinding(),
      transition: Transition.fadeIn,
    ),
    // TODO: 添加其他页面路由
  ];
}
