//
//  Generated code. Do not modify.
//  source: system/v1/user_bo.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use userInfoDescriptor instead')
const UserInfo$json = {
  '1': 'UserInfo',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 4, '10': 'userId'},
    {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    {'1': 'nickname', '3': 3, '4': 1, '5': 9, '10': 'nickname'},
  ],
};

/// Descriptor for `UserInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userInfoDescriptor = $convert.base64Decode(
    'CghVc2VySW5mbxIXCgd1c2VyX2lkGAEgASgEUgZ1c2VySWQSGgoIdXNlcm5hbWUYAiABKAlSCH'
    'VzZXJuYW1lEhoKCG5pY2tuYW1lGAMgASgJUghuaWNrbmFtZQ==');

@$core.Deprecated('Use getUserInfoRequestDescriptor instead')
const GetUserInfoRequest$json = {
  '1': 'GetUserInfoRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 4, '10': 'userId'},
  ],
};

/// Descriptor for `GetUserInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserInfoRequestDescriptor = $convert.base64Decode(
    'ChJHZXRVc2VySW5mb1JlcXVlc3QSFwoHdXNlcl9pZBgBIAEoBFIGdXNlcklk');

@$core.Deprecated('Use getUserInfoResponseDescriptor instead')
const GetUserInfoResponse$json = {
  '1': 'GetUserInfoResponse',
  '2': [
    {'1': 'user_info', '3': 1, '4': 1, '5': 11, '6': '.com.vtyug.yug.system.grpc.v1.UserInfo', '10': 'userInfo'},
  ],
};

/// Descriptor for `GetUserInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserInfoResponseDescriptor = $convert.base64Decode(
    'ChNHZXRVc2VySW5mb1Jlc3BvbnNlEkMKCXVzZXJfaW5mbxgBIAEoCzImLmNvbS52dHl1Zy55dW'
    'cuc3lzdGVtLmdycGMudjEuVXNlckluZm9SCHVzZXJJbmZv');

