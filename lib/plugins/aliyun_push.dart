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

// 导入全局导航键引用
import '../main.dart' show globalNavigatorKey;

// 日志控制 - 设置为false可关闭大部分非关键日志
bool _enableVerboseLogging = false;

// 本地通知控制
bool _localNotificationsInitialized = false;

final aliyunPush = AliyunPushFlutter();
bool _initialized = false;

bool get initialized => _initialized;
final initSyncLock = Lock();

// 推送类型说明
// ----------------------------------------------------------------------------------
// 阿里云推送有两种主要推送类型：
// 1. 消息(Message): 透传消息，不在通知栏显示，适合传递数据，默认会被加密(f=324)
// 2. 通知(Notification): 在通知栏展示的消息，用户可见，通常不加密
//
// 如果遇到"推送内容全部被加密，解密失败"的问题，可以尝试以下解决方案：
// - 在阿里云推送控制台中使用"通知"类型而非"消息"类型
// - 确保AppKey和AppSecret配置正确
// - 联系阿里云技术支持，请求关闭特定应用的消息加密
// ----------------------------------------------------------------------------------

// 仅输出重要日志的辅助函数
void _logImportant(String message) {
  logDebug("[阿里云推送-重要] $message");
}

// 输出详细日志的辅助函数
void _logVerbose(String message) {
  if (_enableVerboseLogging) {
    logDebug("[阿里云推送-详细] $message");
  }
}

Future<void> initAliyunPush() async {
  await initSyncLock.synchronized(() async {
    if (initialized) {
      return;
    }

    // 清除缓存的设备ID，强制重新初始化
    await StoreCache.set(StoreCache.keyPushRegId, "");
    _logVerbose("清除缓存的设备ID，强制重新初始化");

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
        _logImportant("配置不完整，无法初始化");
        return;
      }

      // 添加更详细的日志，记录实际使用的AppKey和AppSecret值
      _logImportant("初始化使用的AppKey: $appKey");
      _logImportant(
          "初始化使用的AppSecret: ${appSecret.length > 4 ? appSecret.substring(0, 4) : ''}...");

      // 关闭推送日志可能影响问题排查，通常在调试时应该启用
      // 初始化推送SDK前，先检查是否已存在推送服务
      try {
        final deviceId = await aliyunPush.getDeviceId();
        if (deviceId != null && deviceId.isNotEmpty) {
          _logImportant("设备可能已初始化过，当前设备ID: $deviceId");
        }
      } catch (e) {
        _logVerbose("检查设备ID失败，可能SDK尚未初始化: $e");
      }

      // 初始化推送SDK
      await aliyunPush
          .initPush(appKey: appKey, appSecret: appSecret)
          .then((m) async {
        _logImportant("初始化结果: $m");

        if (m['code'] == '10000') {
          // 成功
          _initialized = true;

          // 获取并保存设备ID
          final deviceId = await aliyunPush.getDeviceId();
          _logImportant("设备ID: $deviceId");

          if (deviceId != null && deviceId.isNotEmpty) {
            await StoreCache.set(StoreCache.keyPushRegId, deviceId);
            _logVerbose("设备ID已保存到缓存");
          } else {
            _logImportant("获取设备ID失败，返回为空");
          }

          // 初始化成功后，尝试设置日志级别为调试级别
          if (Platform.isAndroid) {
            try {
              await aliyunPush.setAndroidLogLevel(2); // 2=Debug级别
              _logVerbose("Android日志级别设置为Debug");
            } catch (e) {
              _logVerbose("设置Android日志级别失败: $e");
            }
          }

          // 初始化成功后的操作
          _initPostProcess();
        } else {
          _logImportant("初始化失败，错误码: ${m['code']}, 错误信息: ${m['errorMsg']}");
        }
      });
    } catch (e, s) {
      _logImportant("初始化失败: $e");
      if (_enableVerboseLogging) {
        logDebug(s);
      }
      return;
    }

    // 检查通知权限(对Android设备)
    if (Platform.isAndroid) {
      // 增强型权限检查
      try {
        final isEnabled = await aliyunPush.isAndroidNotificationEnabled();
        _logImportant("通知权限状态: ${isEnabled ? '已启用' : '未启用'}");

        if (!isEnabled) {
          _logImportant("⚠️ 警告：通知权限未开启，用户将无法收到通知！");

          // 记录设备型号和系统版本，有助于排查特定设备的问题
          String deviceInfo = '';
          try {
            deviceInfo =
                "设备型号: ${await _getDeviceModel()}, 安卓版本: ${await _getAndroidVersion()}";
            _logImportant(deviceInfo);
          } catch (e) {
            _logVerbose("获取设备信息失败: $e");
          }

          if (globalNavigatorKey.currentContext != null) {
            await showInfoDialog(globalNavigatorKey.currentContext!,
                title: "需要开启通知权限",
                content: "您尚未开启语光的通知权限，这会导致推送通知无法显示。\n\n是否前往开启通知权限？",
                onConfirm: () async {
              Navigator.of(globalNavigatorKey.currentContext!).pop();
              try {
                aliyunPush.jumpToAndroidNotificationSettings();
                _logImportant("已引导用户前往通知设置页面");
              } catch (e) {
                _logImportant("跳转到通知设置页面失败: $e");
                // 尝试使用备用方法打开应用设置
                _openAppSettings();
              }
            });
          }
        }
      } catch (e, s) {
        _logImportant("检查通知权限发生错误: $e");
        if (_enableVerboseLogging) {
          logDebug(s);
        }
      }

      // 初始化第三方推送通道
      await aliyunPush.initAndroidThirdPush().then((m) {
        _logVerbose("第三方推送初始化结果: $m");
      }).onError((e, s) {
        _logImportant("第三方推送初始化失败: $e");
        if (_enableVerboseLogging) {
          logDebug(s);
        }
      });

      // 打开推送通道
      try {
        final result = await aliyunPush.turnOnAndroidPushChannel();
        _logImportant("打开推送通道结果: $result");
      } catch (e) {
        _logImportant("打开推送通道失败: $e");
      }

      // 创建通知通道
      await _createNotificationChannels();
    }

    // 消息接收处理器
    aliyunPush.addMessageReceiver(
      onMessage: (m) async {
        try {
          _logImportant(
              "收到消息推送: ${m.containsKey('i') ? '消息ID:${m['i']}' : '未知ID'}");

          // 收到加密消息时直接解析ext字段内容
          final Map<String, dynamic> messageData = {};
          if (m.containsKey('ext')) {
            try {
              // ext字段通常是未加密的JSON字符串
              final String extStr = m['ext'] as String;
              _logImportant("收到消息ext字段: $extStr");

              final Map<String, dynamic> extData = jsonDecode(extStr);
              messageData['ext'] = extData;

              // 进一步尝试解析biz字段
              if (extData.containsKey('biz')) {
                try {
                  final bizData = jsonDecode(extData['biz'] as String);
                  messageData['biz'] = bizData;

                  if (bizData.containsKey('taskId')) {
                    _logImportant("收到消息任务ID: ${bizData['taskId']}");
                    // 这里可以根据taskId执行相应的业务逻辑

                    // 尝试显示通知 - 即使消息体无法解密，我们仍然可以使用ext字段的内容
                    if (globalNavigatorKey.currentContext != null) {
                      showInfoDialog(
                        globalNavigatorKey.currentContext!,
                        title: "收到新消息",
                        content: "收到任务ID: ${bizData['taskId']}\n\n您可能需要执行相关操作。",
                      );
                    }
                  }
                } catch (e) {
                  _logImportant("解析biz字段失败: $e");
                }
              }
            } catch (e) {
              _logImportant("解析ext字段失败: $e");
            }
          }

          // 仅记录重要字段
          if (m.containsKey('f')) {
            _logImportant(
                "消息标志(f)值: ${m['f']} - ${m['f'] == 324 ? '加密消息' : '普通消息'}");
          }

          // 显示原始加密内容（即使在非详细日志模式下）
          if (m.containsKey('b') && m['f'] == 324) {
            _logImportant("加密内容(用于调试): ${m['b']}");
            _logImportant("提示: 加密内容无法直接查看，请使用通知类型推送或联系阿里云技术支持");

            // 尝试使用辅助函数提取加密消息中的有用信息
            final extractedInfo = extractInfoFromEncryptedMessage(m);
            _logImportant("从加密消息中提取的信息: $extractedInfo");

            // 如果提取到了额外信息，尝试基于这些信息进行处理
            final extraInfo = extractedInfo['extraInfo'];
            if (extraInfo != null && extraInfo is Map && extraInfo.isNotEmpty) {
              _logImportant("提取到的额外信息: $extraInfo");

              // 尝试从加密消息创建本地通知
              await showLocalNotificationFromEncryptedMessage(m);

              // 如果有biz字段，尝试进一步处理业务逻辑
              if (extraInfo.containsKey('ext') &&
                  extraInfo['ext'] is Map &&
                  extraInfo['ext'].containsKey('biz')) {
                try {
                  final bizInfo =
                      jsonDecode(extraInfo['ext']['biz'].toString());
                  _logImportant("业务信息: $bizInfo");

                  // 可以根据业务信息做进一步处理
                  if (bizInfo.containsKey('taskId')) {
                    _logImportant("任务ID: ${bizInfo['taskId']}");
                    // 这里可以根据taskId执行相应业务逻辑
                  }
                } catch (e) {
                  _logVerbose("解析业务信息失败: $e");
                }
              }
            }

            // 尝试告知用户接收到了加密消息，但无法解密
            if (messageData.isEmpty &&
                globalNavigatorKey.currentContext != null) {
              try {
                // 仅在测试环境中使用此提示，生产环境一般不需要
                if (m.containsKey('i')) {
                  showInfoDialog(globalNavigatorKey.currentContext!,
                      title: "收到加密消息",
                      content:
                          "收到一条加密消息(ID: ${m['i']})\n由于加密原因，无法显示消息内容。\n如需查看消息内容，请联系开发团队或使用通知类型推送。");
                }
              } catch (dialogError) {
                _logVerbose("显示加密消息提示失败: $dialogError");
              }
            }
          }

          // 尝试提取消息中可能存在的任何非加密字段
          Map<String, dynamic> extractedContent = {};
          m.forEach((key, value) {
            if (key != 'b' && key != 'f' && key != 'i' && key != 'p') {
              try {
                extractedContent[key] = value;
              } catch (e) {
                // 忽略解析错误
              }
            }
          });

          if (extractedContent.isNotEmpty) {
            _logImportant("从加密消息中提取的非加密内容: $extractedContent");

            // 如果有ext字段，尝试解析它
            if (m.containsKey('ext')) {
              try {
                final ext = jsonDecode(m['ext'].toString());
                _logImportant("消息扩展内容: $ext");
              } catch (e) {
                _logVerbose("解析ext字段失败: $e");
              }
            }
          }

          // 详细日志记录所有字段
          if (_enableVerboseLogging) {
            m.forEach((key, value) => logDebug("消息字段 $key: $value"));

            if (m.containsKey('b')) {
              logDebug("消息内容(b)字段存在，长度: ${m['b'].toString().length}");
            }
          }
        } catch (e, s) {
          _logImportant("处理推送消息时发生异常: $e");
          if (_enableVerboseLogging) {
            logDebug(s);
          }
        }
      },
      onNotification: (m) async {
        try {
          // 添加更多日志来查看完整的通知结构
          _logImportant("收到通知原始数据: $m");

          // 尝试从多个可能的字段提取标题和内容
          String title = '未知标题';
          String body = '';

          // 尝试提取标题
          if (m.containsKey('title')) {
            title = m['title'].toString();
          } else if (m.containsKey('notifyTitle')) {
            title = m['notifyTitle'].toString();
          }

          // 尝试提取内容 - 阿里云可能使用不同字段存储内容
          if (m.containsKey('body')) {
            body = m['body'].toString();
          } else if (m.containsKey('content')) {
            body = m['content'].toString();
          } else if (m.containsKey('notifyContent')) {
            body = m['notifyContent'].toString();
          } else if (m.containsKey('summary')) {
            body = m['summary'].toString();
          } else if (m.containsKey('message')) {
            body = m['message'].toString();
          }

          _logImportant("收到通知推送: 标题='$title', 内容='$body'");
          _logImportant("检查可用字段: ${m.keys.toList()}");

          // 提取扩展信息
          Map<String, dynamic> extraData = {};

          // 处理extraMap字段
          if (m.containsKey('extraMap')) {
            try {
              final extraMap = m['extraMap'];
              _logImportant("通知extraMap: $extraMap");

              if (extraMap != null) {
                if (extraMap is Map) {
                  // 如果已经是Map类型，直接使用
                  extraData = Map<String, dynamic>.from(extraMap);
                  _logImportant("通知附加数据(Map): $extraData");
                } else if (extraMap is String && extraMap.isNotEmpty) {
                  // 只有在是字符串类型时才尝试解析JSON
                  extraData = jsonDecode(extraMap);
                  _logImportant("通知附加数据(String): $extraData");
                }
              }
            } catch (e) {
              _logImportant("解析通知extraMap失败: $e");
            }
          }

          // 新增：主动触发本地通知显示，确保通知能够显示出来
          await showLocalNotificationFromMessage(
            title: title,
            content: body,
            payload: extraData,
          );

          // 详细日志记录
          if (_enableVerboseLogging) {
            m.forEach((key, value) => logDebug("通知字段 $key: $value"));
          }
        } catch (e, s) {
          _logImportant("处理推送通知时发生异常: $e");
          if (_enableVerboseLogging) {
            logDebug(s);
          }
        }
      },
      onNotificationOpened: (m) async {
        _logImportant("通知已打开");

        // 只在详细日志模式下记录所有字段
        if (_enableVerboseLogging) {
          m.forEach((key, value) => logDebug("通知打开数据 $key: $value"));
        }

        // 通过通知打开指定页面
        try {
          final extraMap = m['extraMap'];
          if (extraMap != null && extraMap.isNotEmpty) {
            final params = jsonDecode(extraMap);
            _logVerbose(
                "通知已打开, 参数: link_path: ${params['link_path']} params: ${params['query_params']}");
            if (params['link_path'] != null) {
              schemeJump(
                  "vtyugapp://${(await PackageInfo.fromPlatform()).packageName}${params['link_path']}?${params['query_params'] ?? ''}");
            }
          } else {
            _logVerbose("通知打开但无额外参数");
          }
        } catch (e, s) {
          _logImportant("处理通知打开失败: $e");
          if (_enableVerboseLogging) {
            logDebug(s);
          }
        }
      },
      onNotificationRemoved: (m) async {
        _logVerbose("通知已移除");
      },
      onAndroidNotificationReceivedInApp: (m) async {
        _logVerbose("应用内收到Android通知");
      },
      onAndroidNotificationClickedWithNoAction: (m) async {
        _logVerbose("Android通知点击无操作");
      },
    );

    // 打印当前设备ID方便调试
    final currentDeviceId = await aliyunPush.getDeviceId();
    _logImportant("当前设备ID: $currentDeviceId");
  });
}

// 启用或禁用详细日志
void setVerboseLogging(bool enable) {
  _enableVerboseLogging = enable;
  _logImportant("详细日志已${enable ? '启用' : '禁用'}");
}

/// 检查并诊断阿里云推送设置
///
/// 用于检查当前配置并提供解决推送加密问题的建议
Future<Map<String, dynamic>> diagnosePushSettings() async {
  Map<String, dynamic> result = {
    'initialized': initialized,
    'deviceId': 'unknown',
    'suggestions': <String>[],
  };

  try {
    // 检查初始化状态
    if (!initialized) {
      result['suggestions'].add('阿里云推送未初始化，请先调用initAliyunPush()');
      return result;
    }

    // 获取设备ID
    final deviceId = await aliyunPush.getDeviceId();
    result['deviceId'] = deviceId ?? 'unknown';

    // 检查配置
    var c = BizConfig();
    String appKey = '';
    String appSecret = '';
    if (Platform.isIOS) {
      appKey = c.aliyunPush.iosAppKey ?? '';
      appSecret = c.aliyunPush.iosAppSecret ?? '';
    } else if (Platform.isAndroid) {
      appKey = c.aliyunPush.androidAppKey ?? '';
      appSecret = c.aliyunPush.androidAppSecret ?? '';
    }

    result['appKeyConfigured'] = appKey.isNotEmpty;
    result['appSecretConfigured'] = appSecret.isNotEmpty;

    // 添加建议
    if (appKey.isEmpty || appSecret.isEmpty) {
      result['suggestions'].add('AppKey或AppSecret未正确配置');
    }

    // 通知权限检查
    if (Platform.isAndroid) {
      final isEnabled = await aliyunPush.isAndroidNotificationEnabled();
      result['notificationsEnabled'] = isEnabled;
      if (!isEnabled) {
        result['suggestions'].add('Android通知权限未开启');
      }
    }

    // 通用建议
    result['suggestions'].add('在阿里云推送控制台，使用"通知"类型而非"消息"类型发送');
    result['suggestions'].add('请确认AppKey和AppSecret配置与阿里云控制台完全一致，包括大小写');
    result['suggestions'].add('考虑联系阿里云技术支持，请求关闭应用的消息加密功能');
  } catch (e) {
    result['error'] = e.toString();
    result['suggestions'].add('诊断过程中发生错误: $e');
  }

  return result;
}

/// 尝试从解密失败的消息中提取有用信息
///
/// 当收到加密消息且解密失败时，此方法可以帮助提取其中的非加密信息
Map<String, dynamic> extractInfoFromEncryptedMessage(
    Map<dynamic, dynamic> message) {
  Map<String, dynamic> extractedInfo = {
    'isEncrypted': message.containsKey('f') && message['f'] == 324,
    'messageId': message.containsKey('i') ? message['i'] : null,
    'packageName': message.containsKey('p') ? message['p'] : null,
    'extraInfo': <String, dynamic>{},
  };

  // 尝试解析ext字段
  if (message.containsKey('ext')) {
    try {
      final extInfo = jsonDecode(message['ext'].toString());
      extractedInfo['extraInfo']['ext'] = extInfo;
    } catch (e) {
      extractedInfo['extraInfo']['ext'] = message['ext'];
    }
  }

  // 添加其他非加密字段
  message.forEach((key, value) {
    if (key != 'b' && key != 'f' && key != 'i' && key != 'p' && key != 'ext') {
      extractedInfo['extraInfo'][key] = value;
    }
  });

  return extractedInfo;
}

/// 在未加密消息的场景下使用此方法在本地创建通知
///
/// 当收到加密消息但能解析ext字段时，可以使用此方法创建本地通知
Future<void> createLocalNotification(
    String title, String content, Map<String, dynamic>? payload) async {
  try {
    if (Platform.isAndroid) {
      await aliyunPush.createAndroidChannel(
        "vg-local-ch01",
        "语光应用本地通知",
        4, // 重要程度最高
        "用于语光应用的本地通知通道，处理推送消息解密失败的情况。",
        showBadge: true,
        vibration: true,
      );

      _logImportant("已创建本地通知 - 标题: $title, 内容: $content");

      // 这里实际应用中，您可能需要集成本地通知插件如flutter_local_notifications
      // 例如：
      // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
      // flutterLocalNotificationsPlugin.show(
      //   DateTime.now().millisecondsSinceEpoch ~/ 1000,
      //   title,
      //   content,
      //   NotificationDetails(...),
      //   payload: jsonEncode(payload),
      // );
    }
  } catch (e) {
    _logImportant("创建本地通知失败: $e");
  }
}

/// 获取设备型号
Future<String> _getDeviceModel() async {
  try {
    // 这里可以使用device_info_plus插件获取更详细信息
    // 简单示例，您可能需要导入相关插件
    return Platform.isAndroid ? 'Android设备' : 'iOS设备';
  } catch (e) {
    return '未知设备';
  }
}

/// 获取Android系统版本
Future<String> _getAndroidVersion() async {
  try {
    return Platform.operatingSystemVersion;
  } catch (e) {
    return '未知版本';
  }
}

/// 尝试打开应用设置页面
Future<void> _openAppSettings() async {
  try {
    _logImportant("尝试使用备用方法打开应用设置");
    // 这里需要使用如app_settings或permission_handler插件
    // 简单的实现可能不起作用，建议引入相关插件
  } catch (e) {
    _logImportant("打开应用设置失败: $e");
  }
}

Future<void> _createNotificationChannels() async {
  try {
    // 创建高优先级系统通道，用于重要通知
    await aliyunPush
        .createAndroidChannel(
      "yug-important",
      "语光重要通知",
      4, // 重要程度最高
      "用于语光应用的重要系统通知，此通道的消息为高优先级，应当立即送达用户。",
      showBadge: true,
      vibration: true,
    )
        .then((m) {
      _logImportant("高优先级通道创建结果: $m");
    });

    // 创建常规通知通道，用于一般通知
    await aliyunPush
        .createAndroidChannel(
      "yug-normal",
      "语光常规通知",
      3, // 默认重要程度
      "用于语光应用的常规通知，包括活动提醒、消息更新等。",
      showBadge: true,
      vibration: true,
    )
        .then((m) {
      _logImportant("常规通知通道创建结果: $m");
    });

    // 创建营销通知通道，用于营销和推广内容
    await aliyunPush
        .createAndroidChannel(
      "yug-marketing",
      "语光营销通知",
      2, // 低优先级
      "用于语光应用的营销和推广信息，包括优惠活动、新功能介绍等。",
      showBadge: false,
      vibration: false,
    )
        .then((m) {
      _logImportant("营销通知通道创建结果: $m");
    });

    _logImportant("已创建所有通知通道");

    // 验证通知通道状态
    await _verifyNotificationChannels();
  } catch (e) {
    _logImportant("创建通知通道失败: $e");
  }
}

/// 验证通知通道状态
Future<void> _verifyNotificationChannels() async {
  try {
    final channels = [
      "yug-important",
      "yug-normal",
      "yug-marketing",
    ];

    for (final channelId in channels) {
      final isEnabled =
          await aliyunPush.isAndroidNotificationEnabled(id: channelId);
      _logImportant("通知通道 '$channelId' 状态: ${isEnabled ? '已启用' : '未启用'}");
    }
  } catch (e) {
    _logImportant("验证通知通道状态失败: $e");
  }
}

/// 测试本地通知显示
///
/// 用于测试设备是否能正常显示通知，不依赖于阿里云推送
Future<bool> testLocalNotification() async {
  _logImportant("开始测试本地通知显示");

  try {
    // 确保通知通道已创建
    await _createNotificationChannels();

    // 实际显示一个测试通知
    final ln.FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        ln.FlutterLocalNotificationsPlugin();

    // 初始化本地通知设置（如果尚未初始化）
    if (!_localNotificationsInitialized) {
      final ln.AndroidInitializationSettings initializationSettingsAndroid =
          ln.AndroidInitializationSettings('@mipmap/ic_launcher');

      final ln.InitializationSettings initializationSettings =
          ln.InitializationSettings(android: initializationSettingsAndroid);

      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
      );

      _localNotificationsInitialized = true;
      _logImportant("本地通知插件已初始化");
    }

    // 创建Android通知详情
    final ln.AndroidNotificationDetails androidPlatformChannelSpecifics =
        ln.AndroidNotificationDetails(
      'yug-important', // 使用已创建的通道ID
      '语光重要通知',
      channelDescription: '语光应用的重要系统通知',
      importance: ln.Importance.max,
      priority: ln.Priority.high,
      ticker: '语光测试通知',
      styleInformation: ln.BigTextStyleInformation(
          '这是一个测试通知的详细内容，用于验证设备通知显示功能是否正常工作。如果您看到此通知，说明设备通知功能正常。'),
    );

    final ln.NotificationDetails platformChannelSpecifics =
        ln.NotificationDetails(android: androidPlatformChannelSpecifics);

    // 显示测试通知
    await flutterLocalNotificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000, // 使用时间戳作为ID确保唯一
      '语光测试通知标题',
      '这是一条测试通知内容，用于验证设备通知功能',
      platformChannelSpecifics,
    );

    _logImportant("已显示测试通知，请检查通知栏");

    // 同时也显示对话框作为备选方案
    if (globalNavigatorKey.currentContext != null) {
      showInfoDialog(
        globalNavigatorKey.currentContext!,
        title: "测试通知",
        content: "已发送一条测试通知到通知栏。\n\n"
            "如果您没有在通知栏看到通知，请检查:\n"
            "1. 应用通知权限是否已开启\n"
            "2. 通知通道是否已启用\n"
            "3. 设备是否有限制通知的设置",
      );
    }

    return true;
  } catch (e) {
    _logImportant("测试本地通知失败: $e");

    // 出错时显示错误信息对话框
    if (globalNavigatorKey.currentContext != null) {
      showInfoDialog(
        globalNavigatorKey.currentContext!,
        title: "测试通知失败",
        content: "发送测试通知时出错: $e\n\n请检查通知权限设置。",
      );
    }

    return false;
  }
}

/// 从加密消息创建本地通知
/// 当接收到加密消息但希望仍能显示通知时，此方法将从消息中提取可用信息并创建本地通知
Future<void> showLocalNotificationFromEncryptedMessage(
    Map<dynamic, dynamic> message) async {
  try {
    _logImportant("尝试从加密消息创建本地通知");

    // 尝试提取标题和内容
    String title = "语光通知";
    String content = "您有一条新消息";
    Map<String, dynamic> payload = {};

    // 提取消息ID用于通知唯一标识
    if (message.containsKey('i')) {
      payload['messageId'] = message['i'];
    }

    // 尝试从ext字段提取信息
    if (message.containsKey('ext')) {
      try {
        final extData = jsonDecode(message['ext'].toString());
        _logImportant("从ext字段提取的数据: $extData");

        // 尝试获取标题和内容
        if (extData.containsKey('title')) {
          title = extData['title'];
        }

        if (extData.containsKey('content')) {
          content = extData['content'];
        } else if (extData.containsKey('body')) {
          content = extData['body'];
        }

        // 提取其他可能的有用数据
        if (extData.containsKey('biz')) {
          try {
            final bizData = jsonDecode(extData['biz'].toString());
            payload['biz'] = bizData;

            // 如果biz字段包含有效内容，可以使用它作为通知内容
            if (bizData.containsKey('title')) {
              title = bizData['title'];
            }

            if (bizData.containsKey('content')) {
              content = bizData['content'];
            }

            if (bizData.containsKey('taskId')) {
              payload['taskId'] = bizData['taskId'];
              content = "$content (任务ID: ${bizData['taskId']})";
            }
          } catch (e) {
            _logVerbose("解析biz数据失败: $e");
          }
        }

        // 保存所有ext数据到payload
        payload['ext'] = extData;
      } catch (e) {
        _logVerbose("解析ext数据失败: $e");
      }
    }

    // 简化：使用通用通知显示方法
    await showLocalNotificationFromMessage(
      title: title,
      content: content,
      payload: payload,
    );

    return;
  } catch (e) {
    _logImportant("创建本地通知失败: $e");
  }
}

/// 通用通知显示方法（处理阿里云通知和本地通知）
Future<void> showLocalNotificationFromMessage({
  required String title,
  required String content,
  Map<String, dynamic>? payload,
}) async {
  try {
    _logImportant("尝试显示本地通知 - 标题: '$title', 内容: '$content'");

    final ln.FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        ln.FlutterLocalNotificationsPlugin();

    // 确保通知插件已初始化
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

      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (response) {
          // 处理通知点击逻辑
          if (response.payload != null) {
            try {
              final payloadData = jsonDecode(response.payload!);
              _handleNotificationPayload(payloadData);
            } catch (e) {
              _logVerbose("解析通知负载失败: $e");
            }
          }
        },
      );
      _localNotificationsInitialized = true;
      _logImportant("本地通知插件已初始化完成");
    }

    // 创建通知ID - 使用时间戳确保唯一性
    final int notificationId = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    if (Platform.isAndroid) {
      // Android通知详情
      final ln.AndroidNotificationDetails androidPlatformChannelSpecifics =
          ln.AndroidNotificationDetails(
        'yug-important', // 使用高优先级通道
        '语光重要通知',
        channelDescription: '重要系统通知',
        importance: ln.Importance.max,
        priority: ln.Priority.high,
        ticker: '新通知',
        visibility: ln.NotificationVisibility.public,
        styleInformation: ln.BigTextStyleInformation(content),
      );

      final ln.NotificationDetails platformChannelSpecifics =
          ln.NotificationDetails(android: androidPlatformChannelSpecifics);

      // 显示通知
      await flutterLocalNotificationsPlugin.show(
        notificationId,
        title,
        content,
        platformChannelSpecifics,
        payload: jsonEncode(payload ?? {}),
      );
    } else if (Platform.isIOS) {
      // iOS通知详情
      final ln.DarwinNotificationDetails iOSPlatformChannelSpecifics =
          ln.DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      );

      final ln.NotificationDetails platformChannelSpecifics =
          ln.NotificationDetails(iOS: iOSPlatformChannelSpecifics);

      // 显示通知
      await flutterLocalNotificationsPlugin.show(
        notificationId,
        title,
        content,
        platformChannelSpecifics,
        payload: jsonEncode(payload ?? {}),
      );
    }

    _logImportant("通知已成功显示：$title");
  } catch (e) {
    _logImportant("显示通知失败: $e");
    // 备用方案：如果应用在前台，显示应用内弹窗
    if (globalNavigatorKey.currentContext != null &&
        WidgetsBinding.instance.lifecycleState == AppLifecycleState.resumed) {
      showInfoDialog(
        globalNavigatorKey.currentContext!,
        title: title,
        content: content,
      );
    }
  }
}

/// 处理通知点击时的负载数据
void _handleNotificationPayload(Map<String, dynamic> payload) {
  _logImportant("处理通知点击事件: $payload");
  try {
    // 处理跳转链接
    if (payload.containsKey('link_path')) {
      _logImportant("检测到跳转链接: ${payload['link_path']}");

      PackageInfo.fromPlatform().then((info) {
        final path = payload['link_path'];
        final params = payload['query_params'] ?? '';
        final packageName = info.packageName;
        final fullPath = "vtyugapp://$packageName$path?$params";

        _logImportant("执行跳转: $fullPath");
        schemeJump(fullPath);
      });
    }

    // 处理任务ID
    else if (payload.containsKey('taskId')) {
      _logImportant("处理任务ID: ${payload['taskId']}");
      // 添加具体业务逻辑处理任务
    }

    // 处理ext字段中可能包含的信息
    else if (payload.containsKey('ext') && payload['ext'] is Map) {
      final ext = payload['ext'] as Map;
      if (ext.containsKey('link_path')) {
        _logImportant("从ext中检测到跳转链接: ${ext['link_path']}");
        // 处理ext中的链接
        PackageInfo.fromPlatform().then((info) {
          final path = ext['link_path'];
          final params = ext['query_params'] ?? '';
          schemeJump("vtyugapp://${info.packageName}$path?$params");
        });
      }
    }
  } catch (e, s) {
    _logImportant("处理通知负载失败: $e");
    if (_enableVerboseLogging) {
      logDebug(s);
    }
  }
}

/// 请求通知权限并在必要时引导用户
Future<bool> requestNotificationPermissions({bool showDialog = true}) async {
  _logImportant("检查并请求通知权限");

  // 首先检查权限状态
  final isEnabled = await _checkAndroidNotificationPermissions();

  // 如果权限已启用，或不是Android设备，直接返回
  if (isEnabled || !Platform.isAndroid) {
    return isEnabled;
  }

  // 权限未启用且需要显示对话框
  if (showDialog && globalNavigatorKey.currentContext != null) {
    _logImportant("显示通知权限请求对话框");

    try {
      showInfoDialog(
        globalNavigatorKey.currentContext!,
        title: "需要通知权限",
        content: "为了接收重要通知，请开启通知权限。",
        onConfirm: () {
          Navigator.of(globalNavigatorKey.currentContext!).pop();
          try {
            aliyunPush.jumpToAndroidNotificationSettings();
            _logImportant("已跳转到通知设置页面");
          } catch (e) {
            _logImportant("跳转设置页面失败: $e");
            _openAppSettings();
          }
        },
      );
    } catch (e) {
      _logImportant("显示权限对话框失败: $e");
    }
  } else {
    _logImportant("不显示权限请求对话框，静默记录权限状态");
  }

  return false;
}

/// 检查Android通知权限并记录状态
Future<bool> _checkAndroidNotificationPermissions() async {
  if (!Platform.isAndroid) return true;

  try {
    final isEnabled = await aliyunPush.isAndroidNotificationEnabled();
    _logImportant("通知权限状态: ${isEnabled ? '已启用' : '未启用'}");

    if (!isEnabled) {
      _logImportant("⚠️ 警告：通知权限未开启，用户将无法收到通知！");

      // 记录设备信息
      try {
        final deviceInfo =
            "设备型号: ${await _getDeviceModel()}, 安卓版本: ${await _getAndroidVersion()}";
        _logImportant(deviceInfo);
      } catch (e) {
        _logVerbose("获取设备信息失败: $e");
      }
    }

    return isEnabled;
  } catch (e) {
    _logImportant("检查通知权限失败: $e");
    return false;
  }
}

/// 初始化成功后的处理流程
void _initPostProcess() {
  // 在UI渲染后执行
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    _logImportant("执行初始化后处理");

    if (Platform.isAndroid) {
      // 检查通知权限状态（不自动弹窗请求权限）
      await requestNotificationPermissions(showDialog: false);

      // 记录设备信息以便调试
      try {
        final deviceInfo =
            "设备型号: ${await _getDeviceModel()}, 安卓版本: ${await _getAndroidVersion()}";
        _logImportant(deviceInfo);
      } catch (e) {
        _logVerbose("获取设备信息失败: $e");
      }

      // 调试模式下测试通知功能
      // 仅在调试环境执行，不影响生产用户
      assert(() {
        Future.delayed(const Duration(seconds: 2), () {
          _logImportant("调试模式：测试本地通知");
          testLocalNotification();
        });
        return true;
      }());
    }
  });
}
