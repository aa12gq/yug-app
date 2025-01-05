import 'package:get/get.dart';

class IslandMoodWeatherController extends GetxController {
  IslandMoodWeatherController();

  _initData() {
    update(["mood_weather"]);
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
