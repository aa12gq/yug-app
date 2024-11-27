import 'package:flutter/material.dart';

/// 间距
class AppSpace {
  /// appbar
  static double get appbar => 10;

  /// 页面
  static double get page => 10;

  /// 卡片
  static double get card => 10;

  /// 图标文字
  static double get iconText => 4;

  /// column 间距
  static double get column => 10;

  /// 按钮
  static double get button => 5;

  /// 按钮
  static double get buttonHeight => 50;

  /// 输入框 - 10, 10 上下，左右
  static EdgeInsetsGeometry get edgeInput =>
      const EdgeInsets.symmetric(vertical: 10, horizontal: 10);

  /// 列表视图
  static double get listView => 5;

  /// 列表行 - 10 上下
  static double get listRow => 10;

  /// 列表项
  static double get listItem => 8;

  /// 段落 - 24
  static double get paragraph => 24;

  /// 标题内容 - 10
  static double get titleContent => 10;

  /// 图标文字 - 15
  static double get iconTextSmail => 5;
  static double get iconTextMedium => 10;
  static double get iconTextLarge => 15;
}
