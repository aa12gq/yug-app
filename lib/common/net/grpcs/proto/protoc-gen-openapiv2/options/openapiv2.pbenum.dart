//
//  Generated code. Do not modify.
//  source: protoc-gen-openapiv2/options/openapiv2.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Scheme describes the schemes supported by the OpenAPI Swagger
/// and Operation objects.
class Scheme extends $pb.ProtobufEnum {
  static const Scheme UNKNOWN = Scheme._(0, _omitEnumNames ? '' : 'UNKNOWN');
  static const Scheme HTTP = Scheme._(1, _omitEnumNames ? '' : 'HTTP');
  static const Scheme HTTPS = Scheme._(2, _omitEnumNames ? '' : 'HTTPS');
  static const Scheme WS = Scheme._(3, _omitEnumNames ? '' : 'WS');
  static const Scheme WSS = Scheme._(4, _omitEnumNames ? '' : 'WSS');

  static const $core.List<Scheme> values = <Scheme> [
    UNKNOWN,
    HTTP,
    HTTPS,
    WS,
    WSS,
  ];

  static final $core.Map<$core.int, Scheme> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Scheme? valueOf($core.int value) => _byValue[value];

  const Scheme._($core.int v, $core.String n) : super(v, n);
}

/// `Type` is a supported HTTP header type.
/// See https://swagger.io/specification/v2/#parameterType.
class HeaderParameter_Type extends $pb.ProtobufEnum {
  static const HeaderParameter_Type UNKNOWN = HeaderParameter_Type._(0, _omitEnumNames ? '' : 'UNKNOWN');
  static const HeaderParameter_Type STRING = HeaderParameter_Type._(1, _omitEnumNames ? '' : 'STRING');
  static const HeaderParameter_Type NUMBER = HeaderParameter_Type._(2, _omitEnumNames ? '' : 'NUMBER');
  static const HeaderParameter_Type INTEGER = HeaderParameter_Type._(3, _omitEnumNames ? '' : 'INTEGER');
  static const HeaderParameter_Type BOOLEAN = HeaderParameter_Type._(4, _omitEnumNames ? '' : 'BOOLEAN');

  static const $core.List<HeaderParameter_Type> values = <HeaderParameter_Type> [
    UNKNOWN,
    STRING,
    NUMBER,
    INTEGER,
    BOOLEAN,
  ];

  static final $core.Map<$core.int, HeaderParameter_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static HeaderParameter_Type? valueOf($core.int value) => _byValue[value];

  const HeaderParameter_Type._($core.int v, $core.String n) : super(v, n);
}

class JSONSchema_JSONSchemaSimpleTypes extends $pb.ProtobufEnum {
  static const JSONSchema_JSONSchemaSimpleTypes UNKNOWN = JSONSchema_JSONSchemaSimpleTypes._(0, _omitEnumNames ? '' : 'UNKNOWN');
  static const JSONSchema_JSONSchemaSimpleTypes ARRAY = JSONSchema_JSONSchemaSimpleTypes._(1, _omitEnumNames ? '' : 'ARRAY');
  static const JSONSchema_JSONSchemaSimpleTypes BOOLEAN = JSONSchema_JSONSchemaSimpleTypes._(2, _omitEnumNames ? '' : 'BOOLEAN');
  static const JSONSchema_JSONSchemaSimpleTypes INTEGER = JSONSchema_JSONSchemaSimpleTypes._(3, _omitEnumNames ? '' : 'INTEGER');
  static const JSONSchema_JSONSchemaSimpleTypes NULL = JSONSchema_JSONSchemaSimpleTypes._(4, _omitEnumNames ? '' : 'NULL');
  static const JSONSchema_JSONSchemaSimpleTypes NUMBER = JSONSchema_JSONSchemaSimpleTypes._(5, _omitEnumNames ? '' : 'NUMBER');
  static const JSONSchema_JSONSchemaSimpleTypes OBJECT = JSONSchema_JSONSchemaSimpleTypes._(6, _omitEnumNames ? '' : 'OBJECT');
  static const JSONSchema_JSONSchemaSimpleTypes STRING = JSONSchema_JSONSchemaSimpleTypes._(7, _omitEnumNames ? '' : 'STRING');

  static const $core.List<JSONSchema_JSONSchemaSimpleTypes> values = <JSONSchema_JSONSchemaSimpleTypes> [
    UNKNOWN,
    ARRAY,
    BOOLEAN,
    INTEGER,
    NULL,
    NUMBER,
    OBJECT,
    STRING,
  ];

  static final $core.Map<$core.int, JSONSchema_JSONSchemaSimpleTypes> _byValue = $pb.ProtobufEnum.initByValue(values);
  static JSONSchema_JSONSchemaSimpleTypes? valueOf($core.int value) => _byValue[value];

  const JSONSchema_JSONSchemaSimpleTypes._($core.int v, $core.String n) : super(v, n);
}

/// The type of the security scheme. Valid values are "basic",
/// "apiKey" or "oauth2".
class SecurityScheme_Type extends $pb.ProtobufEnum {
  static const SecurityScheme_Type TYPE_INVALID = SecurityScheme_Type._(0, _omitEnumNames ? '' : 'TYPE_INVALID');
  static const SecurityScheme_Type TYPE_BASIC = SecurityScheme_Type._(1, _omitEnumNames ? '' : 'TYPE_BASIC');
  static const SecurityScheme_Type TYPE_API_KEY = SecurityScheme_Type._(2, _omitEnumNames ? '' : 'TYPE_API_KEY');
  static const SecurityScheme_Type TYPE_OAUTH2 = SecurityScheme_Type._(3, _omitEnumNames ? '' : 'TYPE_OAUTH2');

  static const $core.List<SecurityScheme_Type> values = <SecurityScheme_Type> [
    TYPE_INVALID,
    TYPE_BASIC,
    TYPE_API_KEY,
    TYPE_OAUTH2,
  ];

  static final $core.Map<$core.int, SecurityScheme_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SecurityScheme_Type? valueOf($core.int value) => _byValue[value];

  const SecurityScheme_Type._($core.int v, $core.String n) : super(v, n);
}

/// The location of the API key. Valid values are "query" or "header".
class SecurityScheme_In extends $pb.ProtobufEnum {
  static const SecurityScheme_In IN_INVALID = SecurityScheme_In._(0, _omitEnumNames ? '' : 'IN_INVALID');
  static const SecurityScheme_In IN_QUERY = SecurityScheme_In._(1, _omitEnumNames ? '' : 'IN_QUERY');
  static const SecurityScheme_In IN_HEADER = SecurityScheme_In._(2, _omitEnumNames ? '' : 'IN_HEADER');

  static const $core.List<SecurityScheme_In> values = <SecurityScheme_In> [
    IN_INVALID,
    IN_QUERY,
    IN_HEADER,
  ];

  static final $core.Map<$core.int, SecurityScheme_In> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SecurityScheme_In? valueOf($core.int value) => _byValue[value];

  const SecurityScheme_In._($core.int v, $core.String n) : super(v, n);
}

/// The flow used by the OAuth2 security scheme. Valid values are
/// "implicit", "password", "application" or "accessCode".
class SecurityScheme_Flow extends $pb.ProtobufEnum {
  static const SecurityScheme_Flow FLOW_INVALID = SecurityScheme_Flow._(0, _omitEnumNames ? '' : 'FLOW_INVALID');
  static const SecurityScheme_Flow FLOW_IMPLICIT = SecurityScheme_Flow._(1, _omitEnumNames ? '' : 'FLOW_IMPLICIT');
  static const SecurityScheme_Flow FLOW_PASSWORD = SecurityScheme_Flow._(2, _omitEnumNames ? '' : 'FLOW_PASSWORD');
  static const SecurityScheme_Flow FLOW_APPLICATION = SecurityScheme_Flow._(3, _omitEnumNames ? '' : 'FLOW_APPLICATION');
  static const SecurityScheme_Flow FLOW_ACCESS_CODE = SecurityScheme_Flow._(4, _omitEnumNames ? '' : 'FLOW_ACCESS_CODE');

  static const $core.List<SecurityScheme_Flow> values = <SecurityScheme_Flow> [
    FLOW_INVALID,
    FLOW_IMPLICIT,
    FLOW_PASSWORD,
    FLOW_APPLICATION,
    FLOW_ACCESS_CODE,
  ];

  static final $core.Map<$core.int, SecurityScheme_Flow> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SecurityScheme_Flow? valueOf($core.int value) => _byValue[value];

  const SecurityScheme_Flow._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
