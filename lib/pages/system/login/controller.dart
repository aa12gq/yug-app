import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yug_app/common/routers/name.dart';
import 'package:yug_app/common/utils/loading.dart';
import 'package:yug_app/common/api/api_service.dart';
import 'package:yug_app/common/services/user.dart';
import 'package:yug_app/common/net/grpcs/proto/user/shared/v1/user.pb.dart';

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
  Future<void> getVerifyCode() async {
    try {
      Loading.show();

      final contact = loginType.value == 'phone'
          ? phoneController.text
          : emailController.text;

      if (contact.isEmpty) {
        Loading.error(loginType.value == 'phone' ? '请输入手机号' : '请输入邮箱');
        return;
      }

      // // 构建验证码请求
      // final request = SendVerifyCodeRequest(
      //   contact: contact,
      //   type:
      //       loginType.value == 'phone' ? ContactType.PHONE : ContactType.EMAIL,
      //   usage: VerifyCodeUsage.LOGIN,
      // );

      // // 调用发送验证码API
      // await AuthApiService.to.sendVerifyCode(request);
      Loading.success('验证码已发送');
    } catch (e) {
      Loading.error('发送失败：${e.toString()}');
    }
  }

  // 登录处理
  Future<void> handleLogin() async {
    if (!formKey.currentState!.validate()) return;

    try {
      Loading.show('登录中...');

      LoginRequest request;

      // 根据登录类型构建不同的请求
      switch (loginType.value) {
        case 'username':
          request = LoginRequest(
            usernamePassword: LoginRequest_UsernamePasswordLogin(
              username: userNameController.text,
              password: passwordController.text,
              appId: 'yug_app',
            ),
          );
          break;

        case 'phone':
        case 'email':
          Loading.error('该登录方式开发中');
          return;

        default:
          throw '未知的登录类型';
      }
      // 调用登录API
      final response = await AuthApiService.to.login(request);

      // 保存token
      await UserService.to.setToken(response.accessToken);

      // 获取用户信息
      await UserService.to.getMyProfile();

      Loading.success('登录成功');

      // 延迟跳转到首页
      await Future.delayed(const Duration(seconds: 1));
      Get.offAllNamed(RouteNames.systemMain);
    } catch (e) {
      await UserService.to.logout();
      Loading.error('登录失败：${e.toString()}');
    }
  }

  // 跳转到注册页
  void goToRegister() {
    Get.toNamed(RouteNames.systemRegister);
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
