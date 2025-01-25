import 'package:get/get.dart';
import './controller.dart';
import 'package:yug_app/common/api/api_service.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    // 确保验证码服务可用
    if (!Get.isRegistered<CaptchaApiService>()) {
      Get.put<CaptchaApiService>(CaptchaApiService());
    }

    // 注入登录控制器 - 使用 lazyPut 延迟加载并确保单例
    Get.lazyPut<LoginController>(
      () => LoginController(),
      fenix: true,
    );
  }
}
