import 'package:get/get.dart';

class NotesController extends GetxController {
  NotesController();

  _initData() {
    update(["notes"]);
  }

  void onTap(int index) {}

  // 生命周期
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

  @override
  void dispose() {
    super.dispose();
  }
}
