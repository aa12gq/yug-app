import 'package:get/get.dart';

import 'index.dart';

class MomentsIndexBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MomentsIndexController>(() => MomentsIndexController());
  }
}
