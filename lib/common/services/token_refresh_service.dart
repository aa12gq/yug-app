import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:yug_app/common/api/api_service.dart';
import 'package:yug_app/common/routers/name.dart';
import 'package:yug_app/common/services/user.dart';

class TokenRefreshService extends GetxService {
  Timer? _refreshTimer;
  Worker? _tokenWorker;
  static const String _tag = "TokenRefreshService";
  static const bool _isDebug = true;
  bool _isRefreshing = false;
  int _retryCount = 0;
  static const int _maxRetries = 3;
  static const Duration _retryDelay = Duration(seconds: 5);

  // 刷新时间配置
  static const Duration _minimumRefreshInterval = Duration(seconds: 30);
  static const Duration _refreshBeforeExpiry = Duration(minutes: 5);
  static const double _refreshThresholdPercentage = 0.8; // 在过期时间的80%时刷新

  // 单例模式
  static TokenRefreshService get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    print('[$_tag] 服务初始化');
    _setupTokenWorker();
  }

  void _setupTokenWorker() {
    // 取消之前的worker（如果存在）
    _tokenWorker?.dispose();

    // 创建新的worker来监听token变化
    _tokenWorker = ever<String>(UserService.to.tokenObs, (String token) {
      print(
          '[$_tag] Worker检测到token变化: ${token.isEmpty ? "空" : token.substring(0, 10)}...');
      if (token.isNotEmpty) {
        print('[$_tag] Worker: 新token不为空，开始刷新计时');
        // 防止重复启动刷新
        if (!_isRefreshing) {
          startTokenRefresh();
        }
      } else {
        print('[$_tag] Worker: token已清空，停止刷新计时');
        stopTokenRefresh();
      }
    });

    // 检查当前token状态
    final currentToken = UserService.to.token;
    print(
        '[$_tag] 初始token状态: ${currentToken.isEmpty ? "空" : currentToken.substring(0, 10)}...');
    if (currentToken.isNotEmpty && !_isRefreshing) {
      print('[$_tag] 发现有效token，开始刷新计时');
      startTokenRefresh();
    }
  }

  // 解析JWT token
  Map<String, dynamic> _parseJwt(String token) {
    print('[$_tag] 开始解析token...');
    final parts = token.split('.');
    if (parts.length != 3) {
      print('[$_tag] token格式错误: 不是有效的JWT格式 (需要3个部分)');
      throw Exception('Invalid token');
    }

    final payload = parts[1];
    var normalized = base64Url.normalize(payload);
    var resp = utf8.decode(base64Url.decode(normalized));
    final payloadMap = json.decode(resp);
    print('[$_tag] token解析成功，payload: $payloadMap');
    return payloadMap;
  }

  // 计算下次刷新时间
  Duration _calculateRefreshInterval(String token) {
    print('[$_tag] 开始计算刷新间隔...');
    final payload = _parseJwt(token);
    if (!payload.containsKey('exp')) {
      print('[$_tag] token中未找到exp字段，使用默认刷新间隔');
      return const Duration(minutes: 30);
    }

    final expiry = DateTime.fromMillisecondsSinceEpoch(payload['exp'] * 1000);
    final now = DateTime.now();
    final totalDuration = expiry.difference(now);

    // 如果token已过期或即将过期
    if (totalDuration <= _refreshBeforeExpiry) {
      print('[$_tag] token即将过期或已过期，立即刷新');
      return Duration.zero;
    }

    // 计算智能刷新时间
    var refreshTime = totalDuration * _refreshThresholdPercentage;

    // 确保刷新间隔不小于最小值
    if (refreshTime < _minimumRefreshInterval) {
      refreshTime = _minimumRefreshInterval;
    }

    // 调试模式下缩短刷新间隔
    if (_isDebug) {
      refreshTime = _minimumRefreshInterval;
      print('[$_tag] 调试模式：使用最小刷新间隔');
    }

    print('[$_tag] 计算完成，将在${refreshTime.inSeconds}秒后刷新token');
    return refreshTime;
  }

  // 开始token刷新计时器
  void startTokenRefresh() async {
    if (_isRefreshing) {
      print('[$_tag] 已有刷新任务在进行中，跳过');
      return;
    }

    print('[$_tag] 开始token刷新流程...');
    stopTokenRefresh();
    _isRefreshing = true;
    _retryCount = 0;

    try {
      final currentToken = UserService.to.token;
      final refreshToken = UserService.to.refreshToken;

      if (currentToken.isEmpty || refreshToken.isEmpty) {
        print('[$_tag] token无效，取消刷新');
        _handleRefreshFailure('无效的token');
        return;
      }

      final refreshInterval = _calculateRefreshInterval(currentToken);
      _scheduleRefresh(refreshInterval, refreshToken);
    } catch (e) {
      print('[$_tag] 启动刷新服务失败: $e');
      _handleRefreshFailure(e.toString());
    }
  }

  // 调度刷新任务
  void _scheduleRefresh(Duration interval, String refreshToken) {
    print('[$_tag] 调度刷新任务，间隔: ${interval.inSeconds}秒');
    _refreshTimer = Timer(interval, () => _performRefresh(refreshToken));
  }

  // 执行刷新
  Future<void> _performRefresh(String refreshToken) async {
    try {
      final response = await AuthApiService.to.refreshToken(refreshToken);

      if (response.accessToken.isNotEmpty && response.refreshToken.isNotEmpty) {
        print('[$_tag] token刷新成功');
        await UserService.to.setLoginCredentials(
          response.accessToken,
          response.refreshToken,
          response.accessTokenExpiresIn.toInt(),
          response.refreshTokenExpiresIn.toInt(),
        );
        _retryCount = 0;
        _isRefreshing = false;
        startTokenRefresh(); // 使用新token重新开始计时
      } else {
        _handleRefreshRetry('收到空token');
      }
    } catch (e) {
      _handleRefreshRetry(e.toString());
    }
  }

  // 处理刷新重试
  void _handleRefreshRetry(String error) {
    print('[$_tag] 刷新失败: $error');
    if (_retryCount < _maxRetries) {
      _retryCount++;
      print('[$_tag] 尝试第$_retryCount次重试，${_retryDelay.inSeconds}秒后重试');
      _refreshTimer = Timer(_retryDelay, () {
        _performRefresh(UserService.to.refreshToken);
      });
    } else {
      _handleRefreshFailure('重试次数已达上限: $error');
    }
  }

  // 处理刷新失败
  void _handleRefreshFailure(String error) {
    print('[$_tag] 刷新失败，无法恢复: $error');
    stopTokenRefresh();
    _isRefreshing = false;
    _retryCount = 0;
    UserService.to.logout();
    Get.snackbar('提示', '登录已过期，请重新登录', duration: const Duration(seconds: 3));
    Get.offAllNamed(RouteNames.systemLogin);
  }

  // 停止token刷新计时器
  void stopTokenRefresh() {
    if (_refreshTimer != null) {
      print('[$_tag] 停止token刷新计时器');
      _refreshTimer?.cancel();
      _refreshTimer = null;
    }
  }

  @override
  void onClose() {
    print('[$_tag] 服务关闭，清理资源');
    _tokenWorker?.dispose();
    stopTokenRefresh();
    super.onClose();
  }
}
