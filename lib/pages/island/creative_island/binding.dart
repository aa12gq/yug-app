import 'package:get/get.dart';

import 'controller.dart';

class IslandCreativeIslandBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IslandCreativeIslandController>(
        () => IslandCreativeIslandController());
  }
}
