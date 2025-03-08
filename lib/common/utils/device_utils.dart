import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

/// 设备信息工具类
class Device {
  // 设备信息实例
  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  // UUID生成器
  static const _uuid = Uuid();

  // 缓存键
  static const _guidCacheKey = 'device_guid';

  /// 获取设备的唯一标识符
  static Future<String> get guuid async {
    final prefs = await SharedPreferences.getInstance();
    String? guid = prefs.getString(_guidCacheKey);

    if (guid == null || guid.isEmpty) {
      guid = _uuid.v4();
      await prefs.setString(_guidCacheKey, guid);
    }

    return guid;
  }

  /// 获取设备的操作系统
  static String get operatingSystem {
    if (kIsWeb) return 'web';
    if (Platform.isAndroid) return 'android';
    if (Platform.isIOS) return 'ios';
    if (Platform.isWindows) return 'windows';
    if (Platform.isMacOS) return 'macos';
    if (Platform.isLinux) return 'linux';
    if (Platform.isFuchsia) return 'fuchsia';
    return 'unknown';
  }

  /// 获取设备的操作系统版本
  static Future<String> get osVersion async {
    if (kIsWeb) return 'web';
    if (Platform.isAndroid) {
      final info = await _deviceInfo.androidInfo;
      return info.version.release;
    }
    if (Platform.isIOS) {
      final info = await _deviceInfo.iosInfo;
      return info.systemVersion ?? 'unknown';
    }
    return 'unknown';
  }

  /// 获取设备型号
  static Future<String> get model async {
    if (kIsWeb) return 'web';
    if (Platform.isAndroid) {
      final info = await _deviceInfo.androidInfo;
      return info.model;
    }
    if (Platform.isIOS) {
      final info = await _deviceInfo.iosInfo;
      return info.model;
    }
    return 'unknown';
  }

  /// 获取设备品牌
  static Future<String> get brand async {
    if (kIsWeb) return 'web';
    if (Platform.isAndroid) {
      final info = await _deviceInfo.androidInfo;
      return info.brand;
    }
    if (Platform.isIOS) {
      final info = await _deviceInfo.iosInfo;
      return 'Apple';
    }
    return 'unknown';
  }
}
