import 'package:get/get.dart';

import 'controller.dart';

class IslandThemeSpaceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IslandThemeSpaceController>(() => IslandThemeSpaceController());
  }
}
