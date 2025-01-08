import 'package:get/get.dart';

import 'index.dart';

class CircleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CircleController>(() => CircleController());
  }
}
