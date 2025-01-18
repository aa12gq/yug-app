import 'package:flutter/material.dart';
import 'package:yug_app/common/services/config.dart';

import 'colors.dart';

/// 主题
class AppTheme {
  /////////////////////////////////////////////////
  /// 自定义颜色
  /////////////////////////////////////////////////

  // 预设主题颜色
  static const Map<String, Color> themeColors = {
    'mint': Color(0xFF88C9C9), // 薄荷绿
    'ocean': Color(0xFF1E88E5), // 海洋蓝
    'lavender': Color(0xFF9575CD), // 薰衣草紫
    'sakura': Color(0xFFEC407A), // 樱花粉
    'forest': Color(0xFF66BB6A), // 森林绿
    'sunset': Color(0xFFFF7043), // 落日橙
  };

  // 主题颜色名称
  static const Map<String, String> themeColorNames = {
    'mint': '薄荷绿',
    'ocean': '海洋蓝',
    'lavender': '薰衣草紫',
    'sakura': '樱花粉',
    'forest': '森林绿',
    'sunset': '落日橙',
  };

  static Color get primary =>
      themeColors[ConfigService.to.themeColor] ?? themeColors['mint']!;
  // ignore: deprecated_member_use
  static Color get secondary => primary.withOpacity(0.8); // 辅助色
  static const success = Color(0xFF23A757); // 成功色
  static const warning = Color(0xFFFF1843); // 警告色
  static const error = Color(0xFFDA1414); // 错误色
  static const info = Color(0xFF7BAFAF); // 信息色

  /////////////////////////////////////////////////
  /// 主题
  /////////////////////////////////////////////////

  /// 亮色主题
  static ThemeData get light {
    ColorScheme scheme = ColorScheme.light(
      primary: primary,
      onPrimary: Colors.white,
      secondary: secondary,
      onSecondary: Colors.white,
      surface: Colors.white,
      onSurface: const Color(0xFF333333),
      error: error,
      onError: Colors.white,
      tertiary: const Color(0xFFF8FBFB),
    );
    return _getTheme(scheme);
  }

  /// 暗色主题
  static ThemeData get dark {
    ColorScheme scheme = ColorScheme.dark(
      primary: primary,
      secondary: secondary,
      error: error,
      onError: Colors.white,
    );
    return _getTheme(scheme);
  }

  /// 获取主题
  static ThemeData _getTheme(ColorScheme scheme) {
    return ThemeData(
      useMaterial3: false,
      colorScheme: scheme,
      fontFamily: "Montserrat",
      // 配置AppBar主题
      appBarTheme: AppBarTheme(
        backgroundColor: primary,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
