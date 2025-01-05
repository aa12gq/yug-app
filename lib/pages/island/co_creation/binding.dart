import 'package:get/get.dart';

import 'controller.dart';

class IslandCoCreationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IslandCoCreationController>(() => IslandCoCreationController());
  }
}
