import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yug_app/common/routers/name.dart';

class LoginController extends GetxController {
  LoginController();

  // 表单key
  final formKey = GlobalKey<FormState>();

  // 登录类型
  final loginType = 'username'.obs;

  // 用户名
  final userNameController = TextEditingController();

  // 邮箱
  final emailController = TextEditingController();

  // 手机号
  final phoneController = TextEditingController();

  // 密码
  final passwordController = TextEditingController();

  // 验证码
  final verifyCodeController = TextEditingController();

  // 切换登录类型
  void switchLoginType(String type) {
    loginType.value = type;
    update(["login"]);
  }

  // 获取验证码
  void getVerifyCode() {
    // TODO: 实现获取验证码逻辑
  }

  // 登录
  void handleLogin() async {
    if (formKey.currentState!.validate()) {
      // TODO: 实现登录逻辑
    }
  }

  @override
  void onClose() {
    userNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    verifyCodeController.dispose();
    super.onClose();
  }
}
