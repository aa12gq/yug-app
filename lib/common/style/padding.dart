import 'package:flutter/material.dart';

/// 间距
class AppPadding {
  /// 按钮
  static EdgeInsetsGeometry get button => const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      );

  /// 列表项
  static EdgeInsetsGeometry get listTile => const EdgeInsets.symmetric(
        vertical: 3,
        horizontal: 5,
      );

  /// 头像
  static EdgeInsetsGeometry get avatar => const EdgeInsets.symmetric(
        vertical: 3,
        horizontal: 3,
      );

  /// 卡片
  static EdgeInsetsGeometry get card => const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 5,
      );

  /// BottomSheet
  static EdgeInsetsGeometry get bottomSheet => const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 5,
      );
}

/// 阴影
class AppElevation {
  /// 按钮
  static double get button => 1;

  /// 列表
  static double get listTile => 0.1;

  /// 头像
  static double get avatar => 0.1;

  /// 图片
  static double get image => 0.1;

  /// 卡片
  static double get card => 0.5;
}

/// 边框粗细
class AppBorder {
  /// 按钮
  static double get button => 0.5;

  /// 列表
  static double get listTile => 0.1;

  /// 头像
  static double get avatar => 0.1;

  /// 卡片
  static double get card => 0.5;
}

/// 尺寸
class AppSize {
  /// icon
  static double get icon => 18;

  /// 头像
  static double get avatar => 24;

  /// 旋转圆圈
  static double get indicator => 28;
}
