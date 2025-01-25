import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:yug_app/common/api/api_service.dart';
import 'package:yug_app/common/routers/name.dart';
import 'package:yug_app/common/services/user.dart';

class TokenRefreshService extends GetxService {
  Worker? _tokenWorker;
  Timer? _refreshTimer;
  static const String _tag = "TokenRefreshService";
  bool _isRefreshing = false;
  static const Duration _checkInterval = Duration(minutes: 1); // 每1分钟检查一次
  static const int _refreshThresholdSeconds = 600; // 剩余10分钟时开始刷新

  // 单例模式
  static TokenRefreshService get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    print('[$_tag] 服务初始化');
    _setupTokenWorker();
    // 如果已经有token，立即开始检查
    if (UserService.to.hasToken) {
      _startRefreshTimer();
      // 立即检查一次
      _checkAndRefreshToken();
    }
  }

  void _setupTokenWorker() {
    _tokenWorker?.dispose();
    _tokenWorker = ever<String>(UserService.to.tokenObs, (String token) {
      if (token.isEmpty) {
        print('[$_tag] token已清空');
        _isRefreshing = false;
        _stopRefreshTimer();
      } else {
        print('[$_tag] 检测到新token，开始监控');
        _startRefreshTimer();
        // 立即检查一次
        _checkAndRefreshToken();
      }
    });
  }

  void _startRefreshTimer() {
    _refreshTimer?.cancel();
    _refreshTimer = Timer.periodic(_checkInterval, (timer) {
      print('[$_tag] 定时检查token状态');
      _checkAndRefreshToken();
    });
    print('[$_tag] 启动token刷新定时器');
  }

  void _stopRefreshTimer() {
    _refreshTimer?.cancel();
    _refreshTimer = null;
    print('[$_tag] 停止token刷新定时器');
  }

  Future<void> _checkAndRefreshToken() async {
    final token = UserService.to.token;
    if (token.isEmpty) return;

    try {
      final payload = _parseJwt(token);
      if (!payload.containsKey('exp')) return;

      final expiry = DateTime.fromMillisecondsSinceEpoch(payload['exp'] * 1000);
      final now = DateTime.now();
      final remainingSeconds = expiry.difference(now).inSeconds;

      // 如果token剩余有效期小于阈值，则刷新
      if (remainingSeconds < _refreshThresholdSeconds) {
        print('[$_tag] token即将过期，剩余${remainingSeconds}秒，开始刷新');
        await refreshToken();
      }
    } catch (e) {
      print('[$_tag] 检查token状态失败: $e');
    }
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
        await UserService.to.setLoginCredentials(
          response.accessToken,
          response.refreshToken,
          response.accessTokenExpiresIn.toInt(),
          response.refreshTokenExpiresIn.toInt(),
        );
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
    _stopRefreshTimer();
    super.onClose();
  }
}
