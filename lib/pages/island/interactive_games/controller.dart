import 'package:get/get.dart';

class IslandInteractiveGamesController extends GetxController {
  IslandInteractiveGamesController();

  _initData() {
    update(["interactive_games"]);
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
