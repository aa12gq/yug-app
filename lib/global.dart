import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/index.dart';
import 'common/services/config.dart';
import 'common/utils/storage.dart';
import 'common/api/api_service.dart';
import 'common/services/captcha.dart';

class Global {
  static Future<void> init() async {
    // plugin initialization
    WidgetsFlutterBinding.ensureInitialized();

    // initialize storage
    await Storage().init();

    Loading();

    // initialize queue
    await Future.wait([
      // configuration service
      Get.putAsync<ConfigService>(() async => await ConfigService()),
    ]).whenComplete(() {});

    // 初始化API服务
    Get.put<UserApiService>(UserApiService());
    Get.put<AuthApiService>(AuthApiService());
    Get.put<CaptchaApiService>(CaptchaApiService());

    // 初始化业务服务
    Get.put<UserService>(UserService()); // 用户
    Get.put<CaptchaService>(CaptchaService()); // 验证码
  }
}
