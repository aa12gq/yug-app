//
//  Generated code. Do not modify.
//  source: protoc-gen-openapiv2/options/annotations.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'openapiv2.pb.dart' as $0;

class Annotations {
  static final openapiv2Swagger = $pb.Extension<$0.Swagger>(_omitMessageNames ? '' : 'google.protobuf.FileOptions', _omitFieldNames ? '' : 'openapiv2Swagger', 1042, $pb.PbFieldType.OM, defaultOrMaker: $0.Swagger.getDefault, subBuilder: $0.Swagger.create);
  static final openapiv2Operation = $pb.Extension<$0.Operation>(_omitMessageNames ? '' : 'google.protobuf.MethodOptions', _omitFieldNames ? '' : 'openapiv2Operation', 1042, $pb.PbFieldType.OM, defaultOrMaker: $0.Operation.getDefault, subBuilder: $0.Operation.create);
  static final openapiv2Schema = $pb.Extension<$0.Schema>(_omitMessageNames ? '' : 'google.protobuf.MessageOptions', _omitFieldNames ? '' : 'openapiv2Schema', 1042, $pb.PbFieldType.OM, defaultOrMaker: $0.Schema.getDefault, subBuilder: $0.Schema.create);
  static final openapiv2Enum = $pb.Extension<$0.EnumSchema>(_omitMessageNames ? '' : 'google.protobuf.EnumOptions', _omitFieldNames ? '' : 'openapiv2Enum', 1042, $pb.PbFieldType.OM, defaultOrMaker: $0.EnumSchema.getDefault, subBuilder: $0.EnumSchema.create);
  static final openapiv2Tag = $pb.Extension<$0.Tag>(_omitMessageNames ? '' : 'google.protobuf.ServiceOptions', _omitFieldNames ? '' : 'openapiv2Tag', 1042, $pb.PbFieldType.OM, defaultOrMaker: $0.Tag.getDefault, subBuilder: $0.Tag.create);
  static final openapiv2Field = $pb.Extension<$0.JSONSchema>(_omitMessageNames ? '' : 'google.protobuf.FieldOptions', _omitFieldNames ? '' : 'openapiv2Field', 1042, $pb.PbFieldType.OM, defaultOrMaker: $0.JSONSchema.getDefault, subBuilder: $0.JSONSchema.create);
  static void registerAllExtensions($pb.ExtensionRegistry registry) {
    registry.add(openapiv2Swagger);
    registry.add(openapiv2Operation);
    registry.add(openapiv2Schema);
    registry.add(openapiv2Enum);
    registry.add(openapiv2Tag);
    registry.add(openapiv2Field);
  }
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
