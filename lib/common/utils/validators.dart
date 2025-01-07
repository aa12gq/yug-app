import 'package:flutter/material.dart';

/// 表单验证
class Validators {
  /// 密码验证
  static FormFieldValidator<String> password(int min, int max, String message) {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return null;
      }

      final passwordRegExp = RegExp(r'^[a-zA-Z0-9!@#\$&*~]{6,18}$');
      if (!passwordRegExp.hasMatch(value)) {
        return message;
      }

      if (value.length < min || value.length > max) {
        return message;
      }

      return null;
    };
  }

  /// 手机号验证
  static FormFieldValidator<String> phone(String message) {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return null;
      }

      final phoneRegExp = RegExp(r'^1[3-9]\d{9}$');
      if (!phoneRegExp.hasMatch(value)) {
        return message;
      }

      return null;
    };
  }
}
