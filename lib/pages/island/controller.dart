import 'package:get/get.dart';

class IslandController extends GetxController {
  IslandController();

  _initData() {
    update(["island"]);
  }

  void onTap(int index) {}

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

  ///dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
