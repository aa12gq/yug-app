import 'package:get/get.dart';

import 'controller.dart';

class LanguageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguageController>(() => LanguageController());
  }
}
