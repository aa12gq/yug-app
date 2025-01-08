import 'package:get/get.dart';
import './controller.dart';
import 'package:yug_app/common/services/captcha.dart';
import 'package:yug_app/common/api/api_service.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    // 确保验证码服务可用
    if (!Get.isRegistered<CaptchaApiService>()) {
      Get.put<CaptchaApiService>(CaptchaApiService());
    }
    if (!Get.isRegistered<CaptchaService>()) {
      Get.put<CaptchaService>(CaptchaService());
    }

    // 注入登录控制器
    Get.put(LoginController());
  }
}
