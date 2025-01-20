import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:yug_app/common/api/api_service.dart';
import 'package:yug_app/common/routers/name.dart';
import 'package:yug_app/common/services/user.dart';

class TokenRefreshService extends GetxService {
  Timer? _refreshTimer;
  Worker? _tokenWorker;
  static const int _refreshBeforeExpirySeconds = 30; // 在过期前30秒刷新
  static const String _tag = "TokenRefreshService"; // 日志标签
  static const bool _isDebug = true; // 调试模式标志
  bool _isRefreshing = false; // 防止重复刷新

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
      print('[$_tag] token中未找到exp字段，使用默认刷新间隔（59分30秒）');
      return const Duration(minutes: 59, seconds: 30);
    }

    // exp是Unix时间戳（秒）
    final expiry = DateTime.fromMillisecondsSinceEpoch(payload['exp'] * 1000);
    final now = DateTime.now();
    final timeUntilExpiry = expiry.difference(now);

    print('[$_tag] token过期时间: $expiry');
    print('[$_tag] 当前时间: $now');
    print('[$_tag] 距离过期还有: ${timeUntilExpiry.inSeconds}秒');

    // 计算刷新时间（过期前30秒）
    var refreshTime =
        timeUntilExpiry - const Duration(seconds: _refreshBeforeExpirySeconds);

    // 如果在调试模式下，缩短刷新间隔为30秒，方便测试
    if (_isDebug && refreshTime > const Duration(seconds: 30)) {
      print('[$_tag] 调试模式：缩短刷新间隔为30秒');
      refreshTime = const Duration(seconds: 30);
    }

    // 如果已经太接近过期时间或已过期，立即刷新
    if (refreshTime.isNegative || refreshTime < const Duration(seconds: 5)) {
      print('[$_tag] token即将过期或已过期，将立即刷新');
      return const Duration(seconds: 1);
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
    stopTokenRefresh(); // 确保先停止之前的计时器
    _isRefreshing = true;

    try {
      final currentToken = UserService.to.token;
      print(
          '[$_tag] 当前token: ${currentToken.isEmpty ? "空" : currentToken.substring(0, 10)}...');

      if (currentToken.isEmpty) {
        print('[$_tag] 当前token为空，取消刷新');
        _isRefreshing = false;
        return;
      }

      final refreshInterval = _calculateRefreshInterval(currentToken);
      print('[$_tag] 设置定时器，将在${refreshInterval.inSeconds}秒后刷新token');

      _refreshTimer = Timer(refreshInterval, () async {
        print('[$_tag] 定时器触发，开始刷新token...');
        try {
          final response = await AuthApiService.to.refreshToken();
          print('[$_tag] 收到刷新响应');
          if (response.accessToken.isNotEmpty) {
            print(
                '[$_tag] token刷新成功，获得新token: ${response.accessToken.substring(0, 10)}...');
            // 更新用户服务中的token
            await UserService.to.setToken(response.accessToken);
            // 重新开始计时器，使用新token的过期时间
            print('[$_tag] 使用新token重新开始刷新计时');
          } else {
            print('[$_tag] 刷新失败：收到空token');
            _handleRefreshFailure('收到空token');
          }
        } catch (e) {
          print('[$_tag] token刷新失败: $e');
          _handleRefreshFailure(e.toString());
        } finally {
          _isRefreshing = false;
        }
      });
    } catch (e) {
      print('[$_tag] token解析失败: $e');
      _isRefreshing = false;
      // 如果解析token失败，使用默认的刷新间隔
      const defaultInterval = Duration(minutes: 59, seconds: 30);
      print('[$_tag] 使用默认刷新间隔：${defaultInterval.inMinutes}分钟');
      _refreshTimer = Timer(defaultInterval, () => startTokenRefresh());
    }
  }

  // 处理刷新失败的情况
  void _handleRefreshFailure(String error) {
    print('[$_tag] 处理刷新失败：$error');
    // 停止计时器
    stopTokenRefresh();
    // 通知用户
    Get.snackbar(
      '提示',
      '登录已过期，请重新登录',
      duration: const Duration(seconds: 3),
    );
    // 跳转到登录页
    print('[$_tag] 跳转到登录页');
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
