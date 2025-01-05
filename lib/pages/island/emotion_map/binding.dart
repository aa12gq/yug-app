import 'package:get/get.dart';

import 'controller.dart';

class IslandEmotionMapBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IslandEmotionMapController>(() => IslandEmotionMapController());
  }
}
