import 'package:get/get.dart';

import 'controller.dart';

class IslandNotificationsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IslandNotificationsController>(
        () => IslandNotificationsController());
  }
}
