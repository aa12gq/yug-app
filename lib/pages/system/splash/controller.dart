import 'package:get/get.dart';
import 'package:yug_app/common/routers/name.dart';

class SplashController extends GetxController {
  SplashController();

  _initData() {
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.offAllNamed(RouteNames.systemMain),
    );
    update(["splash"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
