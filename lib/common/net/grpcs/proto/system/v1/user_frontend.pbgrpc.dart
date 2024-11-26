//
//  Generated code. Do not modify.
//  source: system/v1/user_frontend.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'user_bo.pb.dart' as $0;

export 'user_frontend.pb.dart';

@$pb.GrpcServiceName('com.vtyug.yug.system.grpc.v1.UserFrontend')
class UserFrontendClient extends $grpc.Client {
  static final _$getUserInfo = $grpc.ClientMethod<$0.GetUserInfoRequest, $0.GetUserInfoResponse>(
      '/com.vtyug.yug.system.grpc.v1.UserFrontend/GetUserInfo',
      ($0.GetUserInfoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetUserInfoResponse.fromBuffer(value));

  UserFrontendClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetUserInfoResponse> getUserInfo($0.GetUserInfoRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserInfo, request, options: options);
  }
}

@$pb.GrpcServiceName('com.vtyug.yug.system.grpc.v1.UserFrontend')
abstract class UserFrontendServiceBase extends $grpc.Service {
  $core.String get $name => 'com.vtyug.yug.system.grpc.v1.UserFrontend';

  UserFrontendServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetUserInfoRequest, $0.GetUserInfoResponse>(
        'GetUserInfo',
        getUserInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetUserInfoRequest.fromBuffer(value),
        ($0.GetUserInfoResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetUserInfoResponse> getUserInfo_Pre($grpc.ServiceCall call, $async.Future<$0.GetUserInfoRequest> request) async {
    return getUserInfo(call, await request);
  }

  $async.Future<$0.GetUserInfoResponse> getUserInfo($grpc.ServiceCall call, $0.GetUserInfoRequest request);
}
