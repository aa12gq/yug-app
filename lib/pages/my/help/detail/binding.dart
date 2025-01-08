import 'package:get/get.dart';

import 'controller.dart';

class HelpDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HelpDetailController>(() => HelpDetailController());
  }
}
