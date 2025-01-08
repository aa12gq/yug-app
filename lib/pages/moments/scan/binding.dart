import 'package:get/get.dart';

import 'index.dart';

class ScanBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanController>(() => ScanController());
  }
}
