//
//  Generated code. Do not modify.
//  source: google/api/client.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Client {
  static final defaultHost = $pb.Extension<$core.String>(_omitMessageNames ? '' : 'google.protobuf.ServiceOptions', _omitFieldNames ? '' : 'defaultHost', 1049, $pb.PbFieldType.OS);
  static final oauthScopes = $pb.Extension<$core.String>(_omitMessageNames ? '' : 'google.protobuf.ServiceOptions', _omitFieldNames ? '' : 'oauthScopes', 1050, $pb.PbFieldType.OS);
  static final methodSignature = $pb.Extension<$core.String>.repeated(_omitMessageNames ? '' : 'google.protobuf.MethodOptions', _omitFieldNames ? '' : 'methodSignature', 1051, $pb.PbFieldType.PS, check: $pb.getCheckFunction($pb.PbFieldType.PS));
  static void registerAllExtensions($pb.ExtensionRegistry registry) {
    registry.add(defaultHost);
    registry.add(oauthScopes);
    registry.add(methodSignature);
  }
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
