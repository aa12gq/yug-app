import 'package:get/get.dart';

import 'index.dart';

class ListenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListenController>(() => ListenController());
  }
}
