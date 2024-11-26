import 'package:grpc/grpc.dart';
import 'package:grpc/service_api.dart' as $grpc;
import 'package:yug_app/common/net/grpcs/api/config.dart';
import 'package:yug_app/common/net/grpcs/api/interceptors.dart';
import 'package:yug_app/common/utils/storage.dart';
import 'package:yug_app/common/values/constants.dart';
import 'package:yug_app/config/grpc_channels.dart';
import 'dart:core';

typedef VGrpcClientCreator<T> = T Function($grpc.ClientChannel channel,
    {$grpc.CallOptions? options,
    Iterable<$grpc.ClientInterceptor>? interceptors});

Future<T> vGrpcClient<T extends $grpc.Client>(VGrpcClientCreator<T> creator,
    {ChannelNames? channel}) async {
  ConfigManager config = ConfigManager.instance;
  channel ??= ChannelNames.cDefault;
  final token = await Storage().getString(Constants.keyAuthToken);
  return creator(config.channel(channel),
      interceptors: [ResponseL10n()],
      options: $grpc.CallOptions(
          metadata: {"yug-x-authorization": token},
          timeout: const Duration(milliseconds: 5000)));
}

/// 临时替换本次请求的jwt(auth token).
replaceGrpcToken({required String token, CallOptions? originOptions}) {
  final tokenHeader = {"yug-x-authorization": token};
  if (originOptions != null) {
    return originOptions..metadata.addAll(tokenHeader);
  }
  return CallOptions(metadata: tokenHeader);
}
