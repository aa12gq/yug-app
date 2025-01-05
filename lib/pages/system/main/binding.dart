import 'package:get/get.dart';
import 'package:yug_app/pages/index.dart';

/// 主界面依赖
class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<IslandController>(() => IslandController());
    Get.lazyPut<MomentsController>(() => MomentsController());
    Get.lazyPut<SocialController>(() => SocialController());
    Get.lazyPut<MyIndexController>(() => MyIndexController());
    Get.lazyPut<MainController>(() => MainController());
  }
}
