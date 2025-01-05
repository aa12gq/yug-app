import 'package:get/get.dart';

class IslandActivitiesController extends GetxController {
  IslandActivitiesController();

  _initData() {
    update(["activities"]);
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
