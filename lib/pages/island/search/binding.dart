import 'package:get/get.dart';

import 'controller.dart';

class IslandSearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IslandSearchController>(() => IslandSearchController());
  }
}
