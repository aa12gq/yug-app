import 'package:get/get.dart';

import 'index.dart';

class LoginController extends GetxController {
  LoginController();

  final state = LoginState();

  void onTap(int index) {
    state.title = 'Clicked button $index';
  }

  // Handle tap events
  void handleTap(int index) {
    Get.snackbar(
      "Title",
      "Message",
    );
  }

  /// Called immediately after the controller is allocated in memory
  @override
  void onInit() {
    super.onInit();
  }

  /// Called after onInit() when the controller's binding is initialized
  @override
  void onReady() {
    super.onReady();
  }

  /// Called before the controller is deleted from memory
  @override
  void onClose() {
    super.onClose();
  }

  /// Cleanup method to release resources
  @override
  void dispose() {
    super.dispose();
  }
}
