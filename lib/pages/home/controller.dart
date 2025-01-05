import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController();

  _initData() {
    update(["home"]);
  }

  void onTap(int index) {}

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  ///在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  ///在 [onDelete] 方法之前调用。
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
