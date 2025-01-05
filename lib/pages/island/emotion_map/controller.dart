import 'package:get/get.dart';

class IslandEmotionMapController extends GetxController {
  IslandEmotionMapController();

  _initData() {
    update(["emotion_map"]);
  }

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
