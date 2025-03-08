import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

// 调试日志，只在调试模式下输出
void logDebug(dynamic message) {
  if (kDebugMode) {
    print('[DEBUG] ${message.toString()}');
    developer.log(message.toString(), name: 'DEBUG');
  }
}

// 信息日志，总是输出
void logMessage(dynamic message) {
  print('[INFO] ${message.toString()}');
  developer.log(message.toString(), name: 'INFO');
}

// 警告日志
void logWarning(dynamic message) {
  print('[WARN] ${message.toString()}');
  developer.log(message.toString(), name: 'WARN');
}

// 错误日志
void logError(dynamic message, [dynamic error, StackTrace? stackTrace]) {
  print('[ERROR] ${message.toString()}');
  if (error != null) {
    print('[ERROR] $error');
  }
  if (stackTrace != null) {
    print('[ERROR] $stackTrace');
  }
  developer.log(message.toString(),
      name: 'ERROR', error: error, stackTrace: stackTrace);
}
