import 'package:get/get.dart';

class IslandNotificationsController extends GetxController {
  IslandNotificationsController();

  final RxList notifications = [].obs;

  _initData() {
    // TODO: 加载通知数据
    update(["notifications"]);
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
