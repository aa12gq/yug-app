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
    'coral': Color(0xFFFF7F50), // 珊瑚橙
    'rose': Color(0xFFE8B4B8), // 玫瑰粉
    'sage': Color(0xFF9CAF88), // 鼠尾草绿
    'ocean': Color(0xFF1E88E5), // 海洋蓝
    'plum': Color(0xFF8E354A), // 梅子红
    'lavender': Color(0xFF9575CD), // 薰衣草紫
    'teal': Color(0xFF006D5B), // 孔雀绿
    'marigold': Color(0xFFEEB042), // 万寿菊黄
    'wine': Color(0xFF722F37), // 酒红色
    'slate': Color(0xFF36454F), // 岩石灰
    'blush': Color(0xFFE6B3B3), // 腮红粉
  };

  // 主题颜色名称
  static const Map<String, String> themeColorNames = {
    'mint': '薄荷绿',
    'coral': '珊瑚橙',
    'rose': '玫瑰粉',
    'sage': '鼠尾草',
    'ocean': '海洋蓝',
    'plum': '梅子红',
    'lavender': '薰衣草',
    'teal': '孔雀绿',
    'marigold': '万寿菊',
    'wine': '酒红色',
    'slate': '岩石灰',
    'blush': '腮红粉',
  };

  static Color get primary =>
      themeColors[ConfigService.to.themeColor] ?? themeColors['mint']!;
  // ignore: deprecated_member_use
  static Color get secondary => primary.withValues(alpha: 0.8); // 辅助色
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
