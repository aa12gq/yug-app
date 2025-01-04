import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yug_app/common/routers/name.dart';
import 'package:yug_app/common/utils/loading.dart';
import 'package:yug_app/common/api/api_service.dart';

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
  void onSignUp() async {
    if ((formKey.currentState as FormState).validate()) {
      // 保存注册信息到Get
      Get.put<Map<String, String>>(
        {
          'username': userNameController.text,
          'email': emailController.text,
          'firstName': firstNameController.text,
          'lastName': lastNameController.text,
          'password': passwordController.text,
        },
        tag: 'register_data',
      );

      // 进入PIN码验证页面
      Get.toNamed(RouteNames.systemRegisterPin);
    }
  }

  // 登录
  void onSignIn() {
    Get.back(); // 返回登录页
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
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
  }
}
