import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yug_app/common/routers/name.dart';

class RegisterController extends GetxController {
  RegisterController();

  // 表单key
  GlobalKey formKey = GlobalKey<FormState>();

  // 用户名
  TextEditingController userNameController =
      TextEditingController(text: "aa12gq");

  // 邮件
  TextEditingController emailController =
      TextEditingController(text: "aa12gq@gmail.com");

  // 姓
  TextEditingController firstNameController =
      TextEditingController(text: "aa12");

  // 名
  TextEditingController lastNameController = TextEditingController(text: "12");

  // 密码
  TextEditingController passwordController =
      TextEditingController(text: "12345678");

  // 注册
  void onSignUp() {
    if ((formKey.currentState as FormState).validate()) {
      // 验证通过提交数据
      Get.toNamed(RouteNames.systemRegisterPin);
    }
  }

// 登录
  void onSignIn() {}

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
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
  }
}
