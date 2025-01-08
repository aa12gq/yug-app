import 'package:get/get.dart';

import 'index.dart';

class PublishBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PublishController>(() => PublishController());
  }
}
