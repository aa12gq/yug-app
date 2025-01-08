import 'package:get/get.dart';
import 'package:yug_app/common/index.dart';

class MomentsIndexController extends GetxController {
  static MomentsIndexController get to => Get.find();

  // 打开语友圈
  void onOpenCircle() {
    Get.toNamed(RouteNames.momentsCircle);
  }

  // 打开扫一扫
  void onOpenScan() {
    Get.toNamed(RouteNames.momentsScan);
  }

  // 打开听一听
  void onOpenListen() {
    Get.toNamed(RouteNames.momentsListen);
  }
}
