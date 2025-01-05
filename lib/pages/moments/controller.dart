import 'package:get/get.dart';

class MomentsController extends GetxController {
  MomentsController();

  _initData() {
    update(["moments"]);
  }

  void onTap(int index) {}

  // 生命周期

  ///在 widget 内存中分配后立即调用。
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
