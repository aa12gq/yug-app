import 'package:get/get.dart';
import 'controller.dart';

class IslandBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IslandController>(() => IslandController());
  }
}
