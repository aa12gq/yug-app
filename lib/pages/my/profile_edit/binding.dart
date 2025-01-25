import 'package:get/get.dart';
import './controller.dart';

class ProfileEditBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileEditController>(
      () => ProfileEditController(),
      fenix: true,
    );
  }
}
