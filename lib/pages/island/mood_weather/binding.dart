import 'package:get/get.dart';

import 'controller.dart';

class IslandMoodWeatherBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IslandMoodWeatherController>(
        () => IslandMoodWeatherController());
  }
}
