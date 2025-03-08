import 'dart:convert';
import 'dart:io';

import 'package:aliyun_push_flutter/aliyun_push_flutter.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:synchronized/synchronized.dart';
import 'package:yug_app/config/biz.dart';
import 'package:yug_app/common/utils/log.dart';
import 'package:yug_app/common/utils/store_data.dart';
import 'package:yug_app/common/widgets/dialogs.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as ln;

import 'app_link.dart';
import '../main.dart' show globalNavigatorKey;

final aliyunPush = AliyunPushFlutter();
bool _initialized = false;
bool get initialized => _initialized;
final initSyncLock = Lock();
bool _localNotificationsInitialized = false;

// 简单日志函数
void _log(String message) {
  logDebug("[阿里云推送] $message");
}

Future<void> initAliyunPush() async {
  await initSyncLock.synchronized(() async {
    if (initialized) return;

    await StoreCache.set(StoreCache.keyPushRegId, "");
    _log("开始初始化推送服务");

    try {
      var c = BizConfig();
      String appKey = "";
      String appSecret = "";
      if (Platform.isIOS) {
        appKey = c.aliyunPush.iosAppKey ?? "";
        appSecret = c.aliyunPush.iosAppSecret ?? "";
      } else if (Platform.isAndroid) {
        appKey = c.aliyunPush.androidAppKey ?? "";
        appSecret = c.aliyunPush.androidAppSecret ?? "";
      }

      if (appKey.isEmpty || appSecret.isEmpty) {
        _log("配置不完整，无法初始化");
        return;
      }

      // 初始化推送
      final result =
          await aliyunPush.initPush(appKey: appKey, appSecret: appSecret);
      _log("初始化结果: $result");

      if (result['code'] == '10000' ||
          (Platform.isIOS && result['code'] == '10002')) {
        _initialized = true;

        // 获取设备ID
        final deviceId = await aliyunPush.getDeviceId();
        _log("获取到设备ID: $deviceId");

        if (deviceId != null && deviceId.isNotEmpty) {
          await StoreCache.set(StoreCache.keyPushRegId, deviceId);
          _log("设备ID已保存");
        }

        if (Platform.isAndroid) {
          await _createNotificationChannel();
          await _checkAndRequestPermissions();
        } else if (Platform.isIOS) {
          // iOS特定初始化
          await aliyunPush.turnOnIOSDebug();
          await aliyunPush.showIOSNoticeWhenForeground(true);
        }
      }
    } catch (e) {
      _log("初始化失败: $e");
      return;
    }

    // 设置消息接收处理器
    aliyunPush.addMessageReceiver(
      onMessage: _handleMessage,
      onNotification: _handleNotification,
      onNotificationOpened: _handleNotificationOpened,
      onIOSRegisterDeviceTokenSuccess: (result) async {
        _log("iOS注册deviceToken成功: $result");
        return {};
      },
      onIOSRegisterDeviceTokenFailed: (result) async {
        _log("iOS注册deviceToken失败: $result");
        return {};
      },
      onIOSChannelOpened: (result) async {
        _log("iOS通道打开: $result");
        return {};
      },
    );
  });
}

Future<void> _createNotificationChannel() async {
  try {
    await aliyunPush.createAndroidChannel(
      "yugapp_ch01",
      "语光系统通知",
      4,
      "语光应用的系统通知通道",
      showBadge: true,
      vibration: true,
    );
    _log("系统通知通道创建完成");
  } catch (e) {
    _log("创建通知通道失败: $e");
  }
}

Future<void> _checkAndRequestPermissions() async {
  try {
    final isEnabled = await aliyunPush.isAndroidNotificationEnabled();
    if (!isEnabled && globalNavigatorKey.currentContext != null) {
      showInfoDialog(
        globalNavigatorKey.currentContext!,
        title: "需要通知权限",
        content: "为了接收重要通知，请开启通知权限。",
        onConfirm: () {
          Navigator.of(globalNavigatorKey.currentContext!).pop();
          aliyunPush.jumpToAndroidNotificationSettings();
        },
      );
    }
  } catch (e) {
    _log("检查通知权限失败: $e");
  }
}

Future<void> _handleMessage(Map<dynamic, dynamic> message) async {
  try {
    _log("收到消息: $message");
    String title = "语光通知";
    String content = "您有一条新消息";
    Map<String, dynamic>? extraData;

    // 处理标题
    if (message.containsKey('title')) {
      if (message['title'] is List<int>) {
        title = utf8.decode(message['title'] as List<int>);
      } else if (message['title'] is String) {
        title = message['title'];
      }
    }

    // 处理内容
    if (message.containsKey('body')) {
      if (message['body'] is List<int>) {
        content = utf8.decode(message['body'] as List<int>);
      } else if (message['body'] is String) {
        content = message['body'];
      }
    } else if (message.containsKey('content')) {
      if (message['content'] is List<int>) {
        content = utf8.decode(message['content'] as List<int>);
      } else if (message['content'] is String) {
        content = message['content'];
      }
    }

    if (message.containsKey('ext')) {
      final extStr = message['ext'] as String;
      final extData = jsonDecode(extStr);

      // 尝试从ext中获取标题和内容
      if (extData.containsKey('title')) {
        title = extData['title'];
      }
      if (extData.containsKey('content')) {
        content = extData['content'];
      }

      // 如果有biz字段，优先使用biz中的数据
      if (extData.containsKey('biz')) {
        final bizData = jsonDecode(extData['biz'] as String);
        if (bizData.containsKey('title')) {
          title = bizData['title'];
        }
        if (bizData.containsKey('content')) {
          content = bizData['content'];
        }
        extraData = bizData;
      } else {
        extraData = extData;
      }
    }

    await _showNotification(
      title: title,
      content: content,
      payload: extraData,
    );
  } catch (e) {
    _log("处理消息失败: $e");
  }
}

Future<void> _handleNotification(Map<dynamic, dynamic> message) async {
  try {
    _log("收到通知: $message");
    String title = "语光通知";
    String content = "您有一条新消息";

    // 处理标题
    if (message.containsKey('title')) {
      if (message['title'] is List<int>) {
        title = utf8.decode(message['title'] as List<int>);
      } else if (message['title'] is String) {
        title = message['title'];
      }
    } else if (message.containsKey('notifyTitle')) {
      if (message['notifyTitle'] is List<int>) {
        title = utf8.decode(message['notifyTitle'] as List<int>);
      } else if (message['notifyTitle'] is String) {
        title = message['notifyTitle'];
      }
    }

    // 处理内容
    for (final key in ['body', 'content', 'notifyContent', 'summary']) {
      if (message.containsKey(key)) {
        if (message[key] is List<int>) {
          content = utf8.decode(message[key] as List<int>);
          break;
        } else if (message[key] is String) {
          content = message[key];
          break;
        }
      }
    }

    Map<String, dynamic>? extraData;
    if (message.containsKey('extraMap')) {
      try {
        final extraMap = message['extraMap'];
        if (extraMap is Map) {
          extraData = Map<String, dynamic>.from(extraMap);
        } else if (extraMap is String && extraMap.isNotEmpty) {
          extraData = jsonDecode(extraMap);
        }
      } catch (e) {
        _log("解析extraMap失败: $e");
      }
    }

    await _showNotification(
      title: title,
      content: content,
      payload: extraData,
    );
  } catch (e) {
    _log("处理通知失败: $e");
  }
}

Future<void> _handleNotificationOpened(Map<dynamic, dynamic> message) async {
  try {
    final extraMap = message['extraMap'];
    if (extraMap != null && extraMap.isNotEmpty) {
      final params = jsonDecode(extraMap);
      if (params['link_path'] != null) {
        final packageName = (await PackageInfo.fromPlatform()).packageName;
        schemeJump(
            "vtyugapp://$packageName${params['link_path']}?${params['query_params'] ?? ''}");
      }
    }
  } catch (e) {
    _log("处理通知打开失败: $e");
  }
}

Future<void> _showNotification({
  required String title,
  required String content,
  Map<dynamic, dynamic>? payload,
}) async {
  try {
    final ln.FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        ln.FlutterLocalNotificationsPlugin();

    if (!_localNotificationsInitialized) {
      final ln.AndroidInitializationSettings initializationSettingsAndroid =
          ln.AndroidInitializationSettings('@mipmap/ic_launcher');
      final ln.DarwinInitializationSettings initializationSettingsIOS =
          ln.DarwinInitializationSettings(
        requestSoundPermission: true,
        requestBadgePermission: true,
        requestAlertPermission: true,
      );

      final ln.InitializationSettings initializationSettings =
          ln.InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
      );

      await flutterLocalNotificationsPlugin.initialize(initializationSettings);
      _localNotificationsInitialized = true;
    }

    final notificationId = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    if (Platform.isAndroid) {
      final ln.AndroidNotificationDetails androidDetails =
          ln.AndroidNotificationDetails(
        'yugapp_ch01',
        '语光系统通知',
        channelDescription: '语光应用的系统通知通道',
        importance: ln.Importance.max,
        priority: ln.Priority.high,
      );

      await flutterLocalNotificationsPlugin.show(
        notificationId,
        title,
        content,
        ln.NotificationDetails(android: androidDetails),
        payload: jsonEncode(payload ?? {}),
      );
    } else if (Platform.isIOS) {
      final ln.DarwinNotificationDetails iOSDetails =
          ln.DarwinNotificationDetails();

      await flutterLocalNotificationsPlugin.show(
        notificationId,
        title,
        content,
        ln.NotificationDetails(iOS: iOSDetails),
        payload: jsonEncode(payload ?? {}),
      );
    }
  } catch (e) {
    _log("显示通知失败: $e");
    if (globalNavigatorKey.currentContext != null) {
      showInfoDialog(
        globalNavigatorKey.currentContext!,
        title: title,
        content: content,
      );
    }
  }
}
