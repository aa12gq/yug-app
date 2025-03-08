import 'package:shared_preferences/shared_preferences.dart';

/// 数据存储工具类
class StoreCache {
  // 缓存键定义
  static const keyAuthToken = 'auth_token';
  static const keyAuthRefreshToken = 'auth_refresh_token';
  static const keyAuthUserId = 'auth_user_id';
  static const keyAuthUserInfo = 'auth_user_info';
  static const keyPrivacyPolicyAgreed = 'privacy_policy_agreed';
  static const keyPushRegId = 'push_reg_id';

  static Future<SharedPreferences> get _sp => SharedPreferences.getInstance();

  /// 获取缓存
  static Future<String> getCache(String key) async {
    return (await _sp).getString(key) ?? '';
  }

  /// 设置缓存
  static Future<bool> setCache(String key, String value) async {
    return (await _sp).setString(key, value);
  }

  /// 获取用户ID缓存
  static Future<int> getUserIdCache() async {
    return int.tryParse(await getCache(keyAuthUserId)) ?? 0;
  }

  /// 设置用户ID缓存
  static Future<bool> setUserIdCache(int value) async {
    return setCache(keyAuthUserId, value.toString());
  }

  /// 简化的设置函数
  static Future<bool> set(String key, String value) async {
    return setCache(key, value);
  }
}
