import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yug_app/common/i18n/locale_keys.dart';
import 'package:yug_app/common/utils/loading.dart';
import 'package:yug_app/common/api/api_service.dart';
import 'package:yug_app/common/routers/name.dart';
import 'package:yug_app/common/net/grpcs/proto/user/shared/v1/user.pb.dart';

class RegisterPinController extends GetxController {
  RegisterPinController();

  // ping 文字输入控制器
  TextEditingController pinController = TextEditingController();

  // 表单 key
  GlobalKey formKey = GlobalKey<FormState>();

  // 默认一个 pin 值，生产环境在服务端验证
  String pinCheckValue = '111111';

  // 验证 pin
  String? pinValidator(val) {
    return val == pinCheckValue
        ? null
        : LocaleKeys.commonMessageIncorrect.trParams({"method": "Pin"});
  }

  // pin 触发提交
  void onPinSubmit(String val) async {
    debugPrint("onPinSubmit: $val");
    if (val == pinCheckValue) {
      await _doRegister();
    } else {
      Loading.error('PIN码错误');
    }
  }

  // 按钮提交
  void onBtnSubmit() async {
    if ((formKey.currentState as FormState).validate()) {
      await _doRegister();
    }
  }

  // 执行注册
  Future<void> _doRegister() async {
    Loading.show();
    try {
      // 获取注册数据
      final registerData = Get.find<Map<String, String>>(tag: 'register_data');

      // 构建注册请求
      final request = RegisterRequest();

      switch (registerData['type']) {
        case 'username':
          request.usernamePassword = RegisterRequest_UsernamePasswordRegister(
            username: registerData['username']!,
            password: registerData['password']!,
            appId: 'yug_app',
          );
          break;
        case 'phone':
          request.phone = RegisterRequest_PhoneRegister(
            phone: registerData['phone']!,
            password: registerData['password']!,
            phoneVerificationCode: registerData['verify_code']!,
            appId: 'yug_app',
          );
          break;
        case 'email':
          request.email = RegisterRequest_EmailRegister(
            email: registerData['email']!,
            password: registerData['password']!,
            emailVerificationCode: registerData['verify_code']!,
            appId: 'yug_app',
          );
          break;
      }

      // 调用注册API
      final response = await AuthApiService.to.register(request);

      // 注册成功，清理数据
      Get.delete<Map<String, String>>(tag: 'register_data');

      Loading.success('注册成功');

      // 延迟跳转到登录页
      await Future.delayed(const Duration(seconds: 1));
      Get.offAllNamed(RouteNames.systemLogin);
    } catch (e) {
      Loading.error(e.toString());
    }
  }

  // 按钮返回
  void onBtnBackup() {
    Get.back();
  }

  _initData() {
    update(["register_pin"]);
  }

  void onTap() {}

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onClose() {
    super.onClose();
    pinController.dispose();
    Get.delete<Map<String, String>>(tag: 'register_data', force: true);
  }
}
