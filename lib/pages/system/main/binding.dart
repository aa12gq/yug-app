import 'package:get/get.dart';
import 'package:yug_app/pages/index.dart';

/// 主界面依赖
class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<MomentsIndexController>(() => MomentsIndexController());
  }
}
