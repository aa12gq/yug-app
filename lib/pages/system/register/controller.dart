import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yug_app/common/routers/name.dart';
import 'package:yug_app/common/utils/loading.dart';
import 'package:yug_app/common/api/api_service.dart';

class RegisterController extends GetxController {
  RegisterController();

  // 表单key
  GlobalKey formKey = GlobalKey<FormState>();

  // 注册类型
  final registerType = 'username'.obs;

  // 用户名
  TextEditingController userNameController = TextEditingController();

  // 邮箱
  TextEditingController emailController = TextEditingController();

  // 手机号
  TextEditingController phoneController = TextEditingController();

  // 密码
  TextEditingController passwordController = TextEditingController();

  // 验证码
  TextEditingController verifyCodeController = TextEditingController();

  // 切换注册类型
  void switchRegisterType(String type) {
    registerType.value = type;
    update(["register"]);
  }

  // 获取验证码
  void getVerifyCode() {
    // TODO: 实现获取验证码逻辑
  }

  // 注册
  void onSignUp() async {
    if ((formKey.currentState as FormState).validate()) {
      // 保存注册信息到Get
      final registerData = <String, String>{
        'type': registerType.value,
        'password': passwordController.text,
      };

      switch (registerType.value) {
        case 'username':
          registerData['username'] = userNameController.text;
          break;
        case 'email':
          registerData['email'] = emailController.text;
          registerData['verify_code'] = verifyCodeController.text;
          break;
        case 'phone':
          registerData['phone'] = phoneController.text;
          registerData['verify_code'] = verifyCodeController.text;
          break;
      }

      Get.put<Map<String, String>>(registerData, tag: 'register_data');

      // 进入PIN码验证页面
      Get.toNamed(RouteNames.systemRegisterPin);
    }
  }

  // 登录
  void onSignIn() {
    Get.offNamed(RouteNames.systemLogin);
  }

  _initData() {
    update(["register"]);
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onClose() {
    super.onClose();
    userNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    verifyCodeController.dispose();
  }
}
