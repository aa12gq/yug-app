import 'package:get/get.dart';

import 'index.dart';

class AIChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AIChatController>(() => AIChatController());
  }
}
