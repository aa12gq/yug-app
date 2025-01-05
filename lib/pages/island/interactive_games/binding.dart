import 'package:get/get.dart';

import 'controller.dart';

class IslandInteractiveGamesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IslandInteractiveGamesController>(
        () => IslandInteractiveGamesController());
  }
}
