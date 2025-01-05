import 'package:get/get.dart';
import 'package:yug_app/common/routers/name.dart';

class IslandController extends GetxController {
  IslandController();

  _initData() {
    update(["island"]);
  }

  void onTap(int index) {}

  // 搜索功能
  void onSearch() {
    Get.toNamed(RouteNames.islandSearch);
  }

  // 通知功能
  void onNotification() {
    Get.toNamed(RouteNames.islandNotifications);
  }

  // 情绪相关功能
  void onEmotionMap() {
    Get.toNamed(RouteNames.islandEmotionMap);
  }

  void onMoodWeather() {
    Get.toNamed(RouteNames.islandMoodWeather);
  }

  // 创意空间功能
  void onCreativeIsland() {
    Get.toNamed(RouteNames.islandCreativeIsland);
  }

  void onThemeSpace() {
    Get.toNamed(RouteNames.islandThemeSpace);
  }

  // 互动功能
  void onInteractiveGames() {
    Get.toNamed(RouteNames.islandInteractiveGames);
  }

  void onCreativeShowcase() {
    Get.toNamed(RouteNames.islandCreativeShowcase);
  }

  // 社区功能
  void onIslandActivities() {
    Get.toNamed(RouteNames.islandActivities);
  }

  void onIslandCoCreation() {
    Get.toNamed(RouteNames.islandCoCreation);
  }

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
