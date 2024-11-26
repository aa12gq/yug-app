import 'package:grpc/grpc.dart';
import 'package:grpc/service_api.dart' as $grpc;
import 'package:yug_app/common/utils/storage.dart';
import 'package:yug_app/common/values/constants.dart';
import 'package:yug_app/config/grpc_channels.dart';
import 'dart:core';
import 'config.dart';
import 'interceptors.dart';

/// gRPC 客户端创建器类型定义
typedef VGrpcClientCreator<T> = T Function(
  $grpc.ClientChannel channel, {
  $grpc.CallOptions? options,
  Iterable<$grpc.ClientInterceptor>? interceptors,
});

/// gRPC 客户端工具类
class GrpcClientUtil {
  /// 创建 gRPC 客户端
  /// 
  /// [creator] - 客户端创建器函数
  /// [channel] - 可选的通道名称，默认使用 [ChannelNames.cDefault]
  /// 返回创建的客户端实例
  static Future<T> createClient<T extends $grpc.Client>(
    VGrpcClientCreator<T> creator, {
    ChannelNames? channel,
  }) async {
    ConfigManager config = ConfigManager.instance;
    channel ??= ChannelNames.cDefault;
    final token = await Storage().getString(Constants.keyAuthToken);
    
    return creator(
      config.channel(channel),
      interceptors: [ResponseL10n()],
      options: $grpc.CallOptions(
        metadata: {"yug-x-authorization": token ?? ""},
        timeout: const Duration(milliseconds: 5000),
      ),
    );
  }

  /// 替换本次请求的 JWT token
  /// 
  /// [token] - 新的 token
  /// [originOptions] - 原始的调用选项
  /// 返回更新后的调用选项
  static CallOptions replaceToken({
    required String token,
    CallOptions? originOptions,
  }) {
    final tokenHeader = {"yug-x-authorization": token};
    if (originOptions != null) {
      return originOptions..metadata.addAll(tokenHeader);
    }
    return CallOptions(metadata: tokenHeader);
  }
}

// 为了保持向后兼容，保留原有的顶层函数
Future<T> vGrpcClient<T extends $grpc.Client>(
  VGrpcClientCreator<T> creator, {
  ChannelNames? channel,
}) =>
    GrpcClientUtil.createClient(creator, channel: channel);

CallOptions replaceGrpcToken({
  required String token,
  CallOptions? originOptions,
}) =>
    GrpcClientUtil.replaceToken(token: token, originOptions: originOptions);
