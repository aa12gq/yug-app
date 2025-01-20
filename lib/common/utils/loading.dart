import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// 提示框
class Loading {
  static const int _milliseconds = 500; // 提示 延迟毫秒, 提示体验 秒关太快
  static const int _dismissMilliseconds = 2000; // dismiss 延迟毫秒

  Loading() {
    EasyLoading.instance
      ..displayDuration =
          const Duration(milliseconds: _dismissMilliseconds) // 关闭延迟
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.custom // loading样式 自定义
      ..indicatorSize = 35.0 // 指示器大小
      ..lineWidth = 2 // 进度条宽度
      ..radius = 10.0 // 圆角
      ..progressColor = Colors.white // 进度条颜色
      ..backgroundColor = Colors.black.withValues(alpha: 0.7) // 背景颜色
      ..indicatorColor = Colors.white // 指示器颜色
      ..textColor = Colors.white // 文字颜色
      ..maskColor = Colors.black.withValues(alpha: 0.6) // 遮罩颜色
      ..userInteractions = true // 用户交互
      ..dismissOnTap = false // 点击关闭
      ..indicatorWidget = Image.asset(
        'assets/icons/launcher_ios.png',
        width: 35.0,
        height: 35.0,
      );
  }

  // 配置通用样式
  static void _configureWithLogo() {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = Colors.white
      ..indicatorColor = Colors.transparent
      ..textColor = const Color(0xFF2C3E50)
      ..maskColor = Colors.transparent
      ..userInteractions = true
      ..dismissOnTap = false
      ..indicatorWidget = Image.asset(
        'assets/icons/launcher_ios.png',
        width: 26,
        height: 26,
      );
  }

  // 自定义提示方法
  static void _showCustom(String text, {bool isSuccess = true}) {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = Colors.white
      ..indicatorColor = Colors.transparent
      ..textColor = const Color(0xFF2C3E50)
      ..maskColor = Colors.transparent
      ..userInteractions = true
      ..dismissOnTap = false
      ..indicatorWidget = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/icons/launcher_ios.png',
            width: 26,
            height: 26,
          ),
          SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(
              color: const Color(0xFF2C3E50),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );

    EasyLoading.show();

    Future.delayed(Duration(seconds: 2), () {
      EasyLoading.dismiss();
    });
  }

  // 显示
  static void show([String? text]) {
    _configureWithLogo();
    EasyLoading.instance.userInteractions = false;
    EasyLoading.show(status: text ?? 'Loading...');
  }

  // 错误
  static void error([String? text]) {
    Future.delayed(
      const Duration(milliseconds: _milliseconds),
      () => _showCustom(text ?? 'Error', isSuccess: false),
    );
  }

  // 成功
  static void success([String? text]) {
    Future.delayed(
      const Duration(milliseconds: _milliseconds),
      () => _showCustom(text ?? 'Success'),
    );
  }

  // toast
  static void toast(String text) {
    _showCustom(text);
  }

  // 关闭
  static Future<void> dismiss() async {
    await Future.delayed(
      const Duration(milliseconds: _dismissMilliseconds),
      () {
        EasyLoading.instance.userInteractions = true; // 恢复交互操作
        EasyLoading.dismiss();
      },
    );
  }
}
