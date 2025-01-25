import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:yug_app/common/api/api_service.dart';
import 'package:yug_app/common/routers/name.dart';
import 'package:yug_app/common/services/user.dart';

class TokenRefreshService extends GetxService {
  Worker? _tokenWorker;
  static const String _tag = "TokenRefreshService";
  bool _isRefreshing = false;
  int _retryCount = 0;
  static const int _maxRetries = 3;
  static const Duration _retryDelay = Duration(seconds: 5);

  // 标记是否是由刷新服务触发的token更新
  bool _isInternalUpdate = false;

  // 单例模式
  static TokenRefreshService get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    print('[$_tag] 服务初始化');
    _setupTokenWorker();
  }

  void _setupTokenWorker() {
    _tokenWorker?.dispose();
    _tokenWorker = ever<String>(UserService.to.tokenObs, (String token) {
      if (token.isEmpty) {
        print('[$_tag] token已清空');
        _isRefreshing = false;
      }
    });
  }

  // 检查token是否过期
  bool isTokenExpired(String token) {
    try {
      final payload = _parseJwt(token);
      if (!payload.containsKey('exp')) return true;

      final expiry = DateTime.fromMillisecondsSinceEpoch(payload['exp'] * 1000);
      return DateTime.now().isAfter(expiry);
    } catch (e) {
      return true;
    }
  }

  // 解析JWT token
  Map<String, dynamic> _parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) throw Exception('Invalid token');

    final payload = parts[1];
    var normalized = base64Url.normalize(payload);
    var resp = utf8.decode(base64Url.decode(normalized));
    return json.decode(resp);
  }

  // 刷新token
  Future<bool> refreshToken() async {
    if (_isRefreshing) {
      print('[$_tag] 已有刷新任务在进行中');
      return false;
    }

    final refreshToken = UserService.to.refreshToken;
    if (refreshToken.isEmpty) {
      print('[$_tag] 无效的refresh token');
      return false;
    }

    try {
      _isRefreshing = true;
      final response = await AuthApiService.to.refreshToken(refreshToken);

      if (response.accessToken.isNotEmpty && response.refreshToken.isNotEmpty) {
        print('[$_tag] token刷新成功');
        _isInternalUpdate = true;
        await UserService.to.setLoginCredentials(
          response.accessToken,
          response.refreshToken,
          response.accessTokenExpiresIn.toInt(),
          response.refreshTokenExpiresIn.toInt(),
        );
        _isInternalUpdate = false;
        _isRefreshing = false;
        return true;
      }

      _handleRefreshFailure('收到空token');
      return false;
    } catch (e) {
      _handleRefreshFailure(e.toString());
      return false;
    }
  }

  // 处理刷新失败
  void _handleRefreshFailure(String error) {
    print('[$_tag] 刷新失败: $error');
    _isRefreshing = false;
    UserService.to.logout();
    Get.snackbar('提示', '登录已过期，请重新登录', duration: const Duration(seconds: 3));
    Get.offAllNamed(RouteNames.systemLogin);
  }

  @override
  void onClose() {
    _tokenWorker?.dispose();
    super.onClose();
  }
}
