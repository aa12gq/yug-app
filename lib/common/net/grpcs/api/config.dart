import 'package:grpc/grpc.dart';

import '../../../../../config/grpc_channels.dart' as cf;

/// gRPC 通道配置管理器
class ConfigManager {
  // 单例模式
  static final ConfigManager _instance = ConfigManager._internal();
  factory ConfigManager() => _instance;
  static ConfigManager get instance => _instance;

  // 通道缓存
  final Map<cf.ChannelNames, ClientChannel> _channels = {};

  /// 获取指定名称的通道
  /// 如果通道不存在则创建新的通道
  ClientChannel channel(cf.ChannelNames name) {
    return _channels.putIfAbsent(name, () => _createChannel(name));
  }

  /// 创建新的通道
  ClientChannel _createChannel(cf.ChannelNames name) {
    try {
      switch (name) {
        case cf.ChannelNames.cDefault:
          return _createDefaultChannel();
        default:
          throw ConfigException("Unsupported channel name: ${name.name}");
      }
    } catch (e) {
      throw ConfigException("Failed to create channel: ${name.name}", e);
    }
  }

  /// 创建默认通道
  ClientChannel _createDefaultChannel() {
    final config = cf.ConfigDefault();
    return ClientChannel(
      config.host,
      port: config.port,
      options: ChannelOptions(
        credentials: config.credentials == null
            ? const ChannelCredentials.insecure()
            : config.credentials as ChannelCredentials,
        connectionTimeout: config.connTimeout,
        idleTimeout: config.idleTimeout,
      ),
    );
  }

  /// 关闭所有通道
  Future<void> shutdown() async {
    for (final channel in _channels.values) {
      await channel.shutdown();
    }
    _channels.clear();
  }

  ConfigManager._internal();
}

/// 配置异常
class ConfigException implements Exception {
  final String message;
  final Object? cause;

  ConfigException(this.message, [this.cause]);

  @override
  String toString() => 'ConfigException: $message${cause != null ? ' ($cause)' : ''}';
}
