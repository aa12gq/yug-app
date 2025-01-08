import 'package:get/get.dart';
import 'controller.dart';

class HelpFeedbackBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HelpFeedbackController>(() => HelpFeedbackController());
  }
}
