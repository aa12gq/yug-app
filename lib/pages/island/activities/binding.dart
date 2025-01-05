import 'package:get/get.dart';

import 'controller.dart';

class IslandActivitiesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IslandActivitiesController>(() => IslandActivitiesController());
  }
}
