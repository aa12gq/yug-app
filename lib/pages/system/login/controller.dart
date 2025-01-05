import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yug_app/common/routers/name.dart';
import 'package:yug_app/common/utils/loading.dart';
import 'package:yug_app/common/api/api_service.dart';
import 'package:yug_app/common/services/user.dart';
import 'package:yug_app/common/net/grpcs/proto/user/shared/v1/user.pb.dart';

class LoginController extends GetxController {
  LoginController();

  /// 用户名
  TextEditingController userNameController = TextEditingController(text: "");

  /// 密码
  TextEditingController passwordController =
      TextEditingController(text: "123456");

  /// 表单 key
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Sign In 登入
  Future<void> onSignIn() async {
    if (formKey.currentState == null) {
      print('表单状态为空');
      return;
    }

    if (formKey.currentState!.validate()) {
      try {
        Loading.show();
        print('开始登录流程...');

        // 构建登录请求
        final request = LoginRequest(
          usernamePassword: LoginRequest_UsernamePasswordLogin(
            username: userNameController.text,
            password: passwordController.text,
            appId: 'yug_app',
          ),
        );
        print('登录请求参数: $request');

        // 调用登录API
        print('调用登录API...');
        final response = await AuthApiService.to.login(request);
        print('登录响应: $response');

        // 设置用户服务的token
        print('设置token...');
        await UserService.to.setToken(response.accessToken);
        print('token设置成功');

        // 获取用户信息
        print('开始获取用户信息...');
        await UserService.to.getMyProfile();
        print('用户信息获取完成');

        Loading.success('登录成功');

        // 延迟跳转到首页
        print('准备跳转到首页...');
        await Future.delayed(const Duration(seconds: 1));
        Get.offAllNamed(RouteNames.systemMain);
      } catch (e, stackTrace) {
        print('登录过程出错: $e');
        print('错误堆栈: $stackTrace');
        await UserService.to.logout();
        Loading.error(e.toString());
      }
    }
  }

  /// 第三方登录 - Github
  Future<void> onGithubSignIn() async {
    try {
      Loading.show();

      // TODO: 实现Github OAuth流程，获取code
      final githubCode = '';

      // 构建Github登录请求
      final request = LoginRequest(
        github: LoginRequest_GithubLogin(
          githubCode: githubCode,
          appId: 'yug_app',
        ),
      );

      // 调用登录API
      final response = await AuthApiService.to.login(request);

      // 设置用户服务的token
      await UserService.to.setToken(response.accessToken);

      // 获取用户信息
      await UserService.to.getMyProfile();

      Loading.success('Github登录成功');

      // 延迟跳转到首页
      await Future.delayed(const Duration(seconds: 1));
      Get.offAllNamed(RouteNames.systemMain);
    } catch (e) {
      await UserService.to.logout();
      Loading.error('Github登录失败：${e.toString()}');
    }
  }

  /// Sign Up 注册
  void onSignUp() {
    Get.offNamed(RouteNames.systemRegister);
  }

  _initData() {
    update(["login"]);
  }

  void onTap() {}

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  /// 释放
  @override
  void onClose() {
    super.onClose();
    userNameController.dispose();
    passwordController.dispose();
  }
}
