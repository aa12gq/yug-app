import 'package:get/get.dart';

import 'controller.dart';

class IslandCreativeShowcaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IslandCreativeShowcaseController>(
        () => IslandCreativeShowcaseController());
  }
}
