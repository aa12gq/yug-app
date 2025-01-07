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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/struct.pb.dart' as $0;
import 'openapiv2.pbenum.dart';

export 'openapiv2.pbenum.dart';

///  `Swagger` is a representation of OpenAPI v2 specification's Swagger object.
///
///  See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#swaggerObject
///
///  Example:
///
///   option (grpc.gateway.protoc_gen_openapiv2.options.openapiv2_swagger) = {
///     info: {
///       title: "Echo API";
///       version: "1.0";
///       description: "";
///       contact: {
///         name: "gRPC-Gateway project";
///         url: "https://github.com/grpc-ecosystem/grpc-gateway";
///         email: "none@example.com";
///       };
///       license: {
///         name: "BSD 3-Clause License";
///         url: "https://github.com/grpc-ecosystem/grpc-gateway/blob/main/LICENSE";
///       };
///     };
///     schemes: HTTPS;
///     consumes: "application/json";
///     produces: "application/json";
///   };
class Swagger extends $pb.GeneratedMessage {
  factory Swagger({
    $core.String? swagger,
    Info? info,
    $core.String? host,
    $core.String? basePath,
    $core.Iterable<Scheme>? schemes,
    $core.Iterable<$core.String>? consumes,
    $core.Iterable<$core.String>? produces,
    $core.Map<$core.String, Response>? responses,
    SecurityDefinitions? securityDefinitions,
    $core.Iterable<SecurityRequirement>? security,
    $core.Iterable<Tag>? tags,
    ExternalDocumentation? externalDocs,
    $core.Map<$core.String, $0.Value>? extensions,
  }) {
    final $result = create();
    if (swagger != null) {
      $result.swagger = swagger;
    }
    if (info != null) {
      $result.info = info;
    }
    if (host != null) {
      $result.host = host;
    }
    if (basePath != null) {
      $result.basePath = basePath;
    }
    if (schemes != null) {
      $result.schemes.addAll(schemes);
    }
    if (consumes != null) {
      $result.consumes.addAll(consumes);
    }
    if (produces != null) {
      $result.produces.addAll(produces);
    }
    if (responses != null) {
      $result.responses.addAll(responses);
    }
    if (securityDefinitions != null) {
      $result.securityDefinitions = securityDefinitions;
    }
    if (security != null) {
      $result.security.addAll(security);
    }
    if (tags != null) {
      $result.tags.addAll(tags);
    }
    if (externalDocs != null) {
      $result.externalDocs = externalDocs;
    }
    if (extensions != null) {
      $result.extensions.addAll(extensions);
    }
    return $result;
  }
  Swagger._() : super();
  factory Swagger.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Swagger.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Swagger', package: const $pb.PackageName(_omitMessageNames ? '' : 'grpc.gateway.protoc_gen_openapiv2.options'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'swagger')
    ..aOM<Info>(2, _omitFieldNames ? '' : 'info', subBuilder: Info.create)
    ..aOS(3, _omitFieldNames ? '' : 'host')
    ..aOS(4, _omitFieldNames ? '' : 'basePath')
    ..pc<Scheme>(5, _omitFieldNames ? '' : 'schemes', $pb.PbFieldType.KE, valueOf: Scheme.valueOf, enumValues: Scheme.values, defaultEnumValue: Scheme.UNKNOWN)
    ..pPS(6, _omitFieldNames ? '' : 'consumes')
    ..pPS(7, _omitFieldNames ? '' : 'produces')
    ..m<$core.String, Response>(10, _omitFieldNames ? '' : 'responses', entryClassName: 'Swagger.ResponsesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: Response.create, valueDefaultOrMaker: Response.getDefault, packageName: const $pb.PackageName('grpc.gateway.protoc_gen_openapiv2.options'))
    ..aOM<SecurityDefinitions>(11, _omitFieldNames ? '' : 'securityDefinitions', subBuilder: SecurityDefinitions.create)
    ..pc<SecurityRequirement>(12, _omitFieldNames ? '' : 'security', $pb.PbFieldType.PM, subBuilder: SecurityRequirement.create)
    ..pc<Tag>(13, _omitFieldNames ? '' : 'tags', $pb.PbFieldType.PM, subBuilder: Tag.create)
    ..aOM<ExternalDocumentation>(14, _omitFieldNames ? '' : 'externalDocs', subBuilder: ExternalDocumentation.create)
    ..m<$core.String, $0.Value>(15, _omitFieldNames ? '' : 'extensions', entryClassName: 'Swagger.ExtensionsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: $0.Value.create, valueDefaultOrMaker: $0.Value.getDefault, packageName: const $pb.PackageName('grpc.gateway.protoc_gen_openapiv2.options'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Swagger clone() => Swagger()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Swagger copyWith(void Function(Swagger) updates) => super.copyWith((message) => updates(message as Swagger)) as Swagger;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Swagger create() => Swagger._();
  Swagger createEmptyInstance() => create();
  static $pb.PbList<Swagger> createRepeated() => $pb.PbList<Swagger>();
  @$core.pragma('dart2js:noInline')
  static Swagger getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Swagger>(create);
  static Swagger? _defaultInstance;

  /// Specifies the OpenAPI Specification version being used. It can be
  /// used by the OpenAPI UI and other clients to interpret the API listing. The
  /// value MUST be "2.0".
  @$pb.TagNumber(1)
  $core.String get swagger => $_getSZ(0);
  @$pb.TagNumber(1)
  set swagger($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSwagger() => $_has(0);
  @$pb.TagNumber(1)
  void clearSwagger() => clearField(1);

  /// Provides metadata about the API. The metadata can be used by the
  /// clients if needed.
  @$pb.TagNumber(2)
  Info get info => $_getN(1);
  @$pb.TagNumber(2)
  set info(Info v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearInfo() => clearField(2);
  @$pb.TagNumber(2)
  Info ensureInfo() => $_ensure(1);

  /// The host (name or ip) serving the API. This MUST be the host only and does
  /// not include the scheme nor sub-paths. It MAY include a port. If the host is
  /// not included, the host serving the documentation is to be used (including
  /// the port). The host does not support path templating.
  @$pb.TagNumber(3)
  $core.String get host => $_getSZ(2);
  @$pb.TagNumber(3)
  set host($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHost() => $_has(2);
  @$pb.TagNumber(3)
  void clearHost() => clearField(3);

  /// The base path on which the API is served, which is relative to the host. If
  /// it is not included, the API is served directly under the host. The value
  /// MUST start with a leading slash (/). The basePath does not support path
  /// templating.
  /// Note that using `base_path` does not change the endpoint paths that are
  /// generated in the resulting OpenAPI file. If you wish to use `base_path`
  /// with relatively generated OpenAPI paths, the `base_path` prefix must be
  /// manually removed from your `google.api.http` paths and your code changed to
  /// serve the API from the `base_path`.
  @$pb.TagNumber(4)
  $core.String get basePath => $_getSZ(3);
  @$pb.TagNumber(4)
  set basePath($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBasePath() => $_has(3);
  @$pb.TagNumber(4)
  void clearBasePath() => clearField(4);

  /// The transfer protocol of the API. Values MUST be from the list: "http",
  /// "https", "ws", "wss". If the schemes is not included, the default scheme to
  /// be used is the one used to access the OpenAPI definition itself.
  @$pb.TagNumber(5)
  $core.List<Scheme> get schemes => $_getList(4);

  /// A list of MIME types the APIs can consume. This is global to all APIs but
  /// can be overridden on specific API calls. Value MUST be as described under
  /// Mime Types.
  @$pb.TagNumber(6)
  $core.List<$core.String> get consumes => $_getList(5);

  /// A list of MIME types the APIs can produce. This is global to all APIs but
  /// can be overridden on specific API calls. Value MUST be as described under
  /// Mime Types.
  @$pb.TagNumber(7)
  $core.List<$core.String> get produces => $_getList(6);

  /// An object to hold responses that can be used across operations. This
  /// property does not define global responses for all operations.
  @$pb.TagNumber(10)
  $core.Map<$core.String, Response> get responses => $_getMap(7);

  /// Security scheme definitions that can be used across the specification.
  @$pb.TagNumber(11)
  SecurityDefinitions get securityDefinitions => $_getN(8);
  @$pb.TagNumber(11)
  set securityDefinitions(SecurityDefinitions v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasSecurityDefinitions() => $_has(8);
  @$pb.TagNumber(11)
  void clearSecurityDefinitions() => clearField(11);
  @$pb.TagNumber(11)
  SecurityDefinitions ensureSecurityDefinitions() => $_ensure(8);

  /// A declaration of which security schemes are applied for the API as a whole.
  /// The list of values describes alternative security schemes that can be used
  /// (that is, there is a logical OR between the security requirements).
  /// Individual operations can override this definition.
  @$pb.TagNumber(12)
  $core.List<SecurityRequirement> get security => $_getList(9);

  /// A list of tags for API documentation control. Tags can be used for logical
  /// grouping of operations by resources or any other qualifier.
  @$pb.TagNumber(13)
  $core.List<Tag> get tags => $_getList(10);

  /// Additional external documentation.
  @$pb.TagNumber(14)
  ExternalDocumentation get externalDocs => $_getN(11);
  @$pb.TagNumber(14)
  set externalDocs(ExternalDocumentation v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasExternalDocs() => $_has(11);
  @$pb.TagNumber(14)
  void clearExternalDocs() => clearField(14);
  @$pb.TagNumber(14)
  ExternalDocumentation ensureExternalDocs() => $_ensure(11);

  /// Custom properties that start with "x-" such as "x-foo" used to describe
  /// extra functionality that is not covered by the standard OpenAPI Specification.
  /// See: https://swagger.io/docs/specification/2-0/swagger-extensions/
  @$pb.TagNumber(15)
  $core.Map<$core.String, $0.Value> get extensions => $_getMap(12);
}

///  `Operation` is a representation of OpenAPI v2 specification's Operation object.
///
///  See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#operationObject
///
///  Example:
///
///   service EchoService {
///     rpc Echo(SimpleMessage) returns (SimpleMessage) {
///       option (google.api.http) = {
///         get: "/v1/example/echo/{id}"
///       };
///
///       option (grpc.gateway.protoc_gen_openapiv2.options.openapiv2_operation) = {
///         summary: "Get a message.";
///         operation_id: "getMessage";
///         tags: "echo";
///         responses: {
///           key: "200"
///             value: {
///             description: "OK";
///           }
///         }
///       };
///     }
///   }
class Operation extends $pb.GeneratedMessage {
  factory Operation({
    $core.Iterable<$core.String>? tags,
    $core.String? summary,
    $core.String? description,
    ExternalDocumentation? externalDocs,
    $core.String? operationId,
    $core.Iterable<$core.String>? consumes,
    $core.Iterable<$core.String>? produces,
    $core.Map<$core.String, Response>? responses,
    $core.Iterable<Scheme>? schemes,
    $core.bool? deprecated,
    $core.Iterable<SecurityRequirement>? security,
    $core.Map<$core.String, $0.Value>? extensions,
    Parameters? parameters,
  }) {
    final $result = create();
    if (tags != null) {
      $result.tags.addAll(tags);
    }
    if (summary != null) {
      $result.summary = summary;
    }
    if (description != null) {
      $result.description = description;
    }
    if (externalDocs != null) {
      $result.externalDocs = externalDocs;
    }
    if (operationId != null) {
      $result.operationId = operationId;
    }
    if (consumes != null) {
      $result.consumes.addAll(consumes);
    }
    if (produces != null) {
      $result.produces.addAll(produces);
    }
    if (responses != null) {
      $result.responses.addAll(responses);
    }
    if (schemes != null) {
      $result.schemes.addAll(schemes);
    }
    if (deprecated != null) {
      $result.deprecated = deprecated;
    }
    if (security != null) {
      $result.security.addAll(security);
    }
    if (extensions != null) {
      $result.extensions.addAll(extensions);
    }
    if (parameters != null) {
      $result.parameters = parameters;
    }
    return $result;
  }
  Operation._() : super();
  factory Operation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Operation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Operation', package: const $pb.PackageName(_omitMessageNames ? '' : 'grpc.gateway.protoc_gen_openapiv2.options'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'tags')
    ..aOS(2, _omitFieldNames ? '' : 'summary')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..aOM<ExternalDocumentation>(4, _omitFieldNames ? '' : 'externalDocs', subBuilder: ExternalDocumentation.create)
    ..aOS(5, _omitFieldNames ? '' : 'operationId')
    ..pPS(6, _omitFieldNames ? '' : 'consumes')
    ..pPS(7, _omitFieldNames ? '' : 'produces')
    ..m<$core.String, Response>(9, _omitFieldNames ? '' : 'responses', entryClassName: 'Operation.ResponsesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: Response.create, valueDefaultOrMaker: Response.getDefault, packageName: const $pb.PackageName('grpc.gateway.protoc_gen_openapiv2.options'))
    ..pc<Scheme>(10, _omitFieldNames ? '' : 'schemes', $pb.PbFieldType.KE, valueOf: Scheme.valueOf, enumValues: Scheme.values, defaultEnumValue: Scheme.UNKNOWN)
    ..aOB(11, _omitFieldNames ? '' : 'deprecated')
    ..pc<SecurityRequirement>(12, _omitFieldNames ? '' : 'security', $pb.PbFieldType.PM, subBuilder: SecurityRequirement.create)
    ..m<$core.String, $0.Value>(13, _omitFieldNames ? '' : 'extensions', entryClassName: 'Operation.ExtensionsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: $0.Value.create, valueDefaultOrMaker: $0.Value.getDefault, packageName: const $pb.PackageName('grpc.gateway.protoc_gen_openapiv2.options'))
    ..aOM<Parameters>(14, _omitFieldNames ? '' : 'parameters', subBuilder: Parameters.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Operation clone() => Operation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Operation copyWith(void Function(Operation) updates) => super.copyWith((message) => updates(message as Operation)) as Operation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Operation create() => Operation._();
  Operation createEmptyInstance() => create();
  static $pb.PbList<Operation> createRepeated() => $pb.PbList<Operation>();
  @$core.pragma('dart2js:noInline')
  static Operation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Operation>(create);
  static Operation? _defaultInstance;

  /// A list of tags for API documentation control. Tags can be used for logical
  /// grouping of operations by resources or any other qualifier.
  @$pb.TagNumber(1)
  $core.List<$core.String> get tags => $_getList(0);

  /// A short summary of what the operation does. For maximum readability in the
  /// swagger-ui, this field SHOULD be less than 120 characters.
  @$pb.TagNumber(2)
  $core.String get summary => $_getSZ(1);
  @$pb.TagNumber(2)
  set summary($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSummary() => $_has(1);
  @$pb.TagNumber(2)
  void clearSummary() => clearField(2);

  /// A verbose explanation of the operation behavior. GFM syntax can be used for
  /// rich text representation.
  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  /// Additional external documentation for this operation.
  @$pb.TagNumber(4)
  ExternalDocumentation get externalDocs => $_getN(3);
  @$pb.TagNumber(4)
  set externalDocs(ExternalDocumentation v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasExternalDocs() => $_has(3);
  @$pb.TagNumber(4)
  void clearExternalDocs() => clearField(4);
  @$pb.TagNumber(4)
  ExternalDocumentation ensureExternalDocs() => $_ensure(3);

  /// Unique string used to identify the operation. The id MUST be unique among
  /// all operations described in the API. Tools and libraries MAY use the
  /// operationId to uniquely identify an operation, therefore, it is recommended
  /// to follow common programming naming conventions.
  @$pb.TagNumber(5)
  $core.String get operationId => $_getSZ(4);
  @$pb.TagNumber(5)
  set operationId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOperationId() => $_has(4);
  @$pb.TagNumber(5)
  void clearOperationId() => clearField(5);

  /// A list of MIME types the operation can consume. This overrides the consumes
  /// definition at the OpenAPI Object. An empty value MAY be used to clear the
  /// global definition. Value MUST be as described under Mime Types.
  @$pb.TagNumber(6)
  $core.List<$core.String> get consumes => $_getList(5);

  /// A list of MIME types the operation can produce. This overrides the produces
  /// definition at the OpenAPI Object. An empty value MAY be used to clear the
  /// global definition. Value MUST be as described under Mime Types.
  @$pb.TagNumber(7)
  $core.List<$core.String> get produces => $_getList(6);

  /// The list of possible responses as they are returned from executing this
  /// operation.
  @$pb.TagNumber(9)
  $core.Map<$core.String, Response> get responses => $_getMap(7);

  /// The transfer protocol for the operation. Values MUST be from the list:
  /// "http", "https", "ws", "wss". The value overrides the OpenAPI Object
  /// schemes definition.
  @$pb.TagNumber(10)
  $core.List<Scheme> get schemes => $_getList(8);

  /// Declares this operation to be deprecated. Usage of the declared operation
  /// should be refrained. Default value is false.
  @$pb.TagNumber(11)
  $core.bool get deprecated => $_getBF(9);
  @$pb.TagNumber(11)
  set deprecated($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(11)
  $core.bool hasDeprecated() => $_has(9);
  @$pb.TagNumber(11)
  void clearDeprecated() => clearField(11);

  /// A declaration of which security schemes are applied for this operation. The
  /// list of values describes alternative security schemes that can be used
  /// (that is, there is a logical OR between the security requirements). This
  /// definition overrides any declared top-level security. To remove a top-level
  /// security declaration, an empty array can be used.
  @$pb.TagNumber(12)
  $core.List<SecurityRequirement> get security => $_getList(10);

  /// Custom properties that start with "x-" such as "x-foo" used to describe
  /// extra functionality that is not covered by the standard OpenAPI Specification.
  /// See: https://swagger.io/docs/specification/2-0/swagger-extensions/
  @$pb.TagNumber(13)
  $core.Map<$core.String, $0.Value> get extensions => $_getMap(11);

  /// Custom parameters such as HTTP request headers.
  /// See: https://swagger.io/docs/specification/2-0/describing-parameters/
  /// and https://swagger.io/specification/v2/#parameter-object.
  @$pb.TagNumber(14)
  Parameters get parameters => $_getN(12);
  @$pb.TagNumber(14)
  set parameters(Parameters v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasParameters() => $_has(12);
  @$pb.TagNumber(14)
  void clearParameters() => clearField(14);
  @$pb.TagNumber(14)
  Parameters ensureParameters() => $_ensure(12);
}

/// `Parameters` is a representation of OpenAPI v2 specification's parameters object.
/// Note: This technically breaks compatibility with the OpenAPI 2 definition structure as we only
/// allow header parameters to be set here since we do not want users specifying custom non-header
/// parameters beyond those inferred from the Protobuf schema.
/// See: https://swagger.io/specification/v2/#parameter-object
class Parameters extends $pb.GeneratedMessage {
  factory Parameters({
    $core.Iterable<HeaderParameter>? headers,
  }) {
    final $result = create();
    if (headers != null) {
      $result.headers.addAll(headers);
    }
    return $result;
  }
  Parameters._() : super();
  factory Parameters.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Parameters.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Parameters', package: const $pb.PackageName(_omitMessageNames ? '' : 'grpc.gateway.protoc_gen_openapiv2.options'), createEmptyInstance: create)
    ..pc<HeaderParameter>(1, _omitFieldNames ? '' : 'headers', $pb.PbFieldType.PM, subBuilder: HeaderParameter.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Parameters clone() => Parameters()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Parameters copyWith(void Function(Parameters) updates) => super.copyWith((message) => updates(message as Parameters)) as Parameters;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Parameters create() => Parameters._();
  Parameters createEmptyInstance() => create();
  static $pb.PbList<Parameters> createRepeated() => $pb.PbList<Parameters>();
  @$core.pragma('dart2js:noInline')
  static Parameters getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Parameters>(create);
  static Parameters? _defaultInstance;

  /// `Headers` is one or more HTTP header parameter.
  /// See: https://swagger.io/docs/specification/2-0/describing-parameters/#header-parameters
  @$pb.TagNumber(1)
  $core.List<HeaderParameter> get headers => $_getList(0);
}

/// `HeaderParameter` a HTTP header parameter.
/// See: https://swagger.io/specification/v2/#parameter-object
class HeaderParameter extends $pb.GeneratedMessage {
  factory HeaderParameter({
    $core.String? name,
    $core.String? description,
    HeaderParameter_Type? type,
    $core.String? format,
    $core.bool? required,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (type != null) {
      $result.type = type;
    }
    if (format != null) {
      $result.format = format;
    }
    if (required != null) {
      $result.required = required;
    }
    return $result;
  }
  HeaderParameter._() : super();
  factory HeaderParameter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HeaderParameter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HeaderParameter', package: const $pb.PackageName(_omitMessageNames ? '' : 'grpc.gateway.protoc_gen_openapiv2.options'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..e<HeaderParameter_Type>(3, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: HeaderParameter_Type.UNKNOWN, valueOf: HeaderParameter_Type.valueOf, enumValues: HeaderParameter_Type.values)
    ..aOS(4, _omitFieldNames ? '' : 'format')
    ..aOB(5, _omitFieldNames ? '' : 'required')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HeaderParameter clone() => HeaderParameter()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HeaderParameter copyWith(void Function(HeaderParameter) updates) => super.copyWith((message) => updates(message as HeaderParameter)) as HeaderParameter;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HeaderParameter create() => HeaderParameter._();
  HeaderParameter createEmptyInstance() => create();
  static $pb.PbList<HeaderParameter> createRepeated() => $pb.PbList<HeaderParameter>();
  @$core.pragma('dart2js:noInline')
  static HeaderParameter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HeaderParameter>(create);
  static HeaderParameter? _defaultInstance;

  /// `Name` is the header name.
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  /// `Description` is a short description of the header.
  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  /// `Type` is the type of the object. The value MUST be one of "string", "number", "integer", or "boolean". The "array" type is not supported.
  /// See: https://swagger.io/specification/v2/#parameterType.
  @$pb.TagNumber(3)
  HeaderParameter_Type get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(HeaderParameter_Type v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  /// `Format` The extending format for the previously mentioned type.
  @$pb.TagNumber(4)
  $core.String get format => $_getSZ(3);
  @$pb.TagNumber(4)
  set format($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFormat() => $_has(3);
  @$pb.TagNumber(4)
  void clearFormat() => clearField(4);

  /// `Required` indicates if the header is optional
  @$pb.TagNumber(5)
  $core.bool get required => $_getBF(4);
  @$pb.TagNumber(5)
  set required($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRequired() => $_has(4);
  @$pb.TagNumber(5)
  void clearRequired() => clearField(5);
}

///  `Header` is a representation of OpenAPI v2 specification's Header object.
///
///  See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#headerObject
class Header extends $pb.GeneratedMessage {
  factory Header({
    $core.String? description,
    $core.String? type,
    $core.String? format,
    $core.String? default_6,
    $core.String? pattern,
  }) {
    final $result = create();
    if (description != null) {
      $result.description = description;
    }
    if (type != null) {
      $result.type = type;
    }
    if (format != null) {
      $result.format = format;
    }
    if (default_6 != null) {
      $result.default_6 = default_6;
    }
    if (pattern != null) {
      $result.pattern = pattern;
    }
    return $result;
  }
  Header._() : super();
  factory Header.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Header.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Header', package: const $pb.PackageName(_omitMessageNames ? '' : 'grpc.gateway.protoc_gen_openapiv2.options'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'description')
    ..aOS(2, _omitFieldNames ? '' : 'type')
    ..aOS(3, _omitFieldNames ? '' : 'format')
    ..aOS(6, _omitFieldNames ? '' : 'default')
    ..aOS(13, _omitFieldNames ? '' : 'pattern')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Header clone() => Header()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Header copyWith(void Function(Header) updates) => super.copyWith((message) => updates(message as Header)) as Header;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Header create() => Header._();
  Header createEmptyInstance() => create();
  static $pb.PbList<Header> createRepeated() => $pb.PbList<Header>();
  @$core.pragma('dart2js:noInline')
  static Header getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Header>(create);
  static Header? _defaultInstance;

  /// `Description` is a short description of the header.
  @$pb.TagNumber(1)
  $core.String get description => $_getSZ(0);
  @$pb.TagNumber(1)
  set description($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDescription() => $_has(0);
  @$pb.TagNumber(1)
  void clearDescription() => clearField(1);

  /// The type of the object. The value MUST be one of "string", "number", "integer", or "boolean". The "array" type is not supported.
  @$pb.TagNumber(2)
  $core.String get type => $_getSZ(1);
  @$pb.TagNumber(2)
  set type($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  /// `Format` The extending format for the previously mentioned type.
  @$pb.TagNumber(3)
  $core.String get format => $_getSZ(2);
  @$pb.TagNumber(3)
  set format($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFormat() => $_has(2);
  @$pb.TagNumber(3)
  void clearFormat() => clearField(3);

  /// `Default` Declares the value of the header that the server will use if none is provided.
  /// See: https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-6.2.
  /// Unlike JSON Schema this value MUST conform to the defined type for the header.
  @$pb.TagNumber(6)
  $core.String get default_6 => $_getSZ(3);
  @$pb.TagNumber(6)
  set default_6($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(6)
  $core.bool hasDefault_6() => $_has(3);
  @$pb.TagNumber(6)
  void clearDefault_6() => clearField(6);

  /// 'Pattern' See https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.2.3.
  @$pb.TagNumber(13)
  $core.String get pattern => $_getSZ(4);
  @$pb.TagNumber(13)
  set pattern($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(13)
  $core.bool hasPattern() => $_has(4);
  @$pb.TagNumber(13)
  void clearPattern() => clearField(13);
}

///  `Response` is a representation of OpenAPI v2 specification's Response object.
///
///  See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#responseObject
class Response extends $pb.GeneratedMessage {
  factory Response({
    $core.String? description,
    Schema? schema,
    $core.Map<$core.String, Header>? headers,
    $core.Map<$core.String, $core.String>? examples,
    $core.Map<$core.String, $0.Value>? extensions,
  }) {
    final $result = create();
    if (description != null) {
      $result.description = description;
    }
    if (schema != null) {
      $result.schema = schema;
    }
    if (headers != null) {
      $result.headers.addAll(headers);
    }
    if (examples != null) {
      $result.examples.addAll(examples);
    }
    if (extensions != null) {
      $result.extensions.addAll(extensions);
    }
    return $result;
  }
  Response._() : super();
  factory Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Response', package: const $pb.PackageName(_omitMessageNames ? '' : 'grpc.gateway.protoc_gen_openapiv2.options'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'description')
    ..aOM<Schema>(2, _omitFieldNames ? '' : 'schema', subBuilder: Schema.create)
    ..m<$core.String, Header>(3, _omitFieldNames ? '' : 'headers', entryClassName: 'Response.HeadersEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: Header.create, valueDefaultOrMaker: Header.getDefault, packageName: const $pb.PackageName('grpc.gateway.protoc_gen_openapiv2.options'))
    ..m<$core.String, $core.String>(4, _omitFieldNames ? '' : 'examples', entryClassName: 'Response.ExamplesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('grpc.gateway.protoc_gen_openapiv2.options'))
    ..m<$core.String, $0.Value>(5, _omitFieldNames ? '' : 'extensions', entryClassName: 'Response.ExtensionsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: $0.Value.create, valueDefaultOrMaker: $0.Value.getDefault, packageName: const $pb.PackageName('grpc.gateway.protoc_gen_openapiv2.options'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Response clone() => Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Response copyWith(void Function(Response) updates) => super.copyWith((message) => updates(message as Response)) as Response;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Response create() => Response._();
  Response createEmptyInstance() => create();
  static $pb.PbList<Response> createRepeated() => $pb.PbList<Response>();
  @$core.pragma('dart2js:noInline')
  static Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Response>(create);
  static Response? _defaultInstance;

  /// `Description` is a short description of the response.
  /// GFM syntax can be used for rich text representation.
  @$pb.TagNumber(1)
  $core.String get description => $_getSZ(0);
  @$pb.TagNumber(1)
  set description($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDescription() => $_has(0);
  @$pb.TagNumber(1)
  void clearDescription() => clearField(1);

  /// `Schema` optionally defines the structure of the response.
  /// If `Schema` is not provided, it means there is no content to the response.
  @$pb.TagNumber(2)
  Schema get schema => $_getN(1);
  @$pb.TagNumber(2)
  set schema(Schema v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSchema() => $_has(1);
  @$pb.TagNumber(2)
  void clearSchema() => clearField(2);
  @$pb.TagNumber(2)
  Schema ensureSchema() => $_ensure(1);

  /// `Headers` A list of headers that are sent with the response.
  /// `Header` name is expected to be a string in the canonical format of the MIME header key
  /// See: https://golang.org/pkg/net/textproto/#CanonicalMIMEHeaderKey
  @$pb.TagNumber(3)
  $core.Map<$core.String, Header> get headers => $_getMap(2);

  /// `Examples` gives per-mimetype response examples.
  /// See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#example-object
  @$pb.TagNumber(4)
  $core.Map<$core.String, $core.String> get examples => $_getMap(3);

  /// Custom properties that start with "x-" such as "x-foo" used to describe
  /// extra functionality that is not covered by the standard OpenAPI Specification.
  /// See: https://swagger.io/docs/specification/2-0/swagger-extensions/
  @$pb.TagNumber(5)
  $core.Map<$core.String, $0.Value> get extensions => $_getMap(4);
}

///  `Info` is a representation of OpenAPI v2 specification's Info object.
///
///  See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#infoObject
///
///  Example:
///
///   option (grpc.gateway.protoc_gen_openapiv2.options.openapiv2_swagger) = {
///     info: {
///       title: "Echo API";
///       version: "1.0";
///       description: "";
///       contact: {
///         name: "gRPC-Gateway project";
///         url: "https://github.com/grpc-ecosystem/grpc-gateway";
///         email: "none@example.com";
///       };
///       license: {
///         name: "BSD 3-Clause License";
///         url: "https://github.com/grpc-ecosystem/grpc-gateway/blob/main/LICENSE";
///       };
///     };
///     ...
///   };
class Info extends $pb.GeneratedMessage {
  factory Info({
    $core.String? title,
    $core.String? description,
    $core.String? termsOfService,
    Contact? contact,
    License? license,
    $core.String? version,
    $core.Map<$core.String, $0.Value>? extensions,
  }) {
    final $result = create();
    if (title != null) {
      $result.title = title;
    }
    if (description != null) {
      $result.description = description;
    }
    if (termsOfService != null) {
      $result.termsOfService = termsOfService;
    }
    if (contact != null) {
      $result.contact = contact;
    }
    if (license != null) {
      $result.license = license;
    }
    if (version != null) {
      $result.version = version;
    }
    if (extensions != null) {
      $result.extensions.addAll(extensions);
    }
    return $result;
  }
  Info._() : super();
  factory Info.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Info.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Info', package: const $pb.PackageName(_omitMessageNames ? '' : 'grpc.gateway.protoc_gen_openapiv2.options'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..aOS(3, _omitFieldNames ? '' : 'termsOfService')
    ..aOM<Contact>(4, _omitFieldNames ? '' : 'contact', subBuilder: Contact.create)
    ..aOM<License>(5, _omitFieldNames ? '' : 'license', subBuilder: License.create)
    ..aOS(6, _omitFieldNames ? '' : 'version')
    ..m<$core.String, $0.Value>(7, _omitFieldNames ? '' : 'extensions', entryClassName: 'Info.ExtensionsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: $0.Value.create, valueDefaultOrMaker: $0.Value.getDefault, packageName: const $pb.PackageName('grpc.gateway.protoc_gen_openapiv2.options'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Info clone() => Info()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Info copyWith(void Function(Info) updates) => super.copyWith((message) => updates(message as Info)) as Info;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Info create() => Info._();
  Info createEmptyInstance() => create();
  static $pb.PbList<Info> createRepeated() => $pb.PbList<Info>();
  @$core.pragma('dart2js:noInline')
  static Info getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Info>(create);
  static Info? _defaultInstance;

  /// The title of the application.
  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  /// A short description of the application. GFM syntax can be used for rich
  /// text representation.
  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  /// The Terms of Service for the API.
  @$pb.TagNumber(3)
  $core.String get termsOfService => $_getSZ(2);
  @$pb.TagNumber(3)
  set termsOfService($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTermsOfService() => $_has(2);
  @$pb.TagNumber(3)
  void clearTermsOfService() => clearField(3);

  /// The contact information for the exposed API.
  @$pb.TagNumber(4)
  Contact get contact => $_getN(3);
  @$pb.TagNumber(4)
  set contact(Contact v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasContact() => $_has(3);
  @$pb.TagNumber(4)
  void clearContact() => clearField(4);
  @$pb.TagNumber(4)
  Contact ensureContact() => $_ensure(3);

  /// The license information for the exposed API.
  @$pb.TagNumber(5)
  License get license => $_getN(4);
  @$pb.TagNumber(5)
  set license(License v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasLicense() => $_has(4);
  @$pb.TagNumber(5)
  void clearLicense() => clearField(5);
  @$pb.TagNumber(5)
  License ensureLicense() => $_ensure(4);

  /// Provides the version of the application API (not to be confused
  /// with the specification version).
  @$pb.TagNumber(6)
  $core.String get version => $_getSZ(5);
  @$pb.TagNumber(6)
  set version($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasVersion() => $_has(5);
  @$pb.TagNumber(6)
  void clearVersion() => clearField(6);

  /// Custom properties that start with "x-" such as "x-foo" used to describe
  /// extra functionality that is not covered by the standard OpenAPI Specification.
  /// See: https://swagger.io/docs/specification/2-0/swagger-extensions/
  @$pb.TagNumber(7)
  $core.Map<$core.String, $0.Value> get extensions => $_getMap(6);
}

///  `Contact` is a representation of OpenAPI v2 specification's Contact object.
///
///  See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#contactObject
///
///  Example:
///
///   option (grpc.gateway.protoc_gen_openapiv2.options.openapiv2_swagger) = {
///     info: {
///       ...
///       contact: {
///         name: "gRPC-Gateway project";
///         url: "https://github.com/grpc-ecosystem/grpc-gateway";
///         email: "none@example.com";
///       };
///       ...
///     };
///     ...
///   };
class Contact extends $pb.GeneratedMessage {
  factory Contact({
    $core.String? name,
    $core.String? url,
    $core.String? email,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (url != null) {
      $result.url = url;
    }
    if (email != null) {
      $result.email = email;
    }
    return $result;
  }
  Contact._() : super();
  factory Contact.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Contact.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Contact', package: const $pb.PackageName(_omitMessageNames ? '' : 'grpc.gateway.protoc_gen_openapiv2.options'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'url')
    ..aOS(3, _omitFieldNames ? '' : 'email')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Contact clone() => Contact()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Contact copyWith(void Function(Contact) updates) => super.copyWith((message) => updates(message as Contact)) as Contact;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Contact create() => Contact._();
  Contact createEmptyInstance() => create();
  static $pb.PbList<Contact> createRepeated() => $pb.PbList<Contact>();
  @$core.pragma('dart2js:noInline')
  static Contact getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Contact>(create);
  static Contact? _defaultInstance;

  /// The identifying name of the contact person/organization.
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  /// The URL pointing to the contact information. MUST be in the format of a
  /// URL.
  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => clearField(2);

  /// The email address of the contact person/organization. MUST be in the format
  /// of an email address.
  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);
}

///  `License` is a representation of OpenAPI v2 specification's License object.
///
///  See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#licenseObject
///
///  Example:
///
///   option (grpc.gateway.protoc_gen_openapiv2.options.openapiv2_swagger) = {
///     info: {
///       ...
///       license: {
///         name: "BSD 3-Clause License";
///         url: "https://github.com/grpc-ecosystem/grpc-gateway/blob/main/LICENSE";
///       };
///       ...
///     };
///     ...
///   };
class License extends $pb.GeneratedMessage {
  factory License({
    $core.String? name,
    $core.String? url,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (url != null) {
      $result.url = url;
    }
    return $result;
  }
  License._() : super();
  factory License.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory License.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'License', package: const $pb.PackageName(_omitMessageNames ? '' : 'grpc.gateway.protoc_gen_openapiv2.options'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  License clone() => License()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  License copyWith(void Function(License) updates) => super.copyWith((message) => updates(message as License)) as License;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static License create() => License._();
  License createEmptyInstance() => create();
  static $pb.PbList<License> createRepeated() => $pb.PbList<License>();
  @$core.pragma('dart2js:noInline')
  static License getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<License>(create);
  static License? _defaultInstance;

  /// The license name used for the API.
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  /// A URL to the license used for the API. MUST be in the format of a URL.
  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => clearField(2);
}

///  `ExternalDocumentation` is a representation of OpenAPI v2 specification's
///  ExternalDocumentation object.
///
///  See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#externalDocumentationObject
///
///  Example:
///
///   option (grpc.gateway.protoc_gen_openapiv2.options.openapiv2_swagger) = {
///     ...
///     external_docs: {
///       description: "More about gRPC-Gateway";
///       url: "https://github.com/grpc-ecosystem/grpc-gateway";
///     }
///     ...
///   };
class ExternalDocumentation extends $pb.GeneratedMessage {
  factory ExternalDocumentation({
    $core.String? description,
    $core.String? url,
  }) {
    final $result = create();
    if (description != null) {
      $result.description = description;
    }
    if (url != null) {
      $result.url = url;
    }
    return $result;
  }
  ExternalDocumentation._() : super();
  factory ExternalDocumentation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExternalDocumentation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ExternalDocumentation', package: const $pb.PackageName(_omitMessageNames ? '' : 'grpc.gateway.protoc_gen_openapiv2.options'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'description')
    ..aOS(2, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ExternalDocumentation clone() => ExternalDocumentation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ExternalDocumentation copyWith(void Function(ExternalDocumentation) updates) => super.copyWith((message) => updates(message as ExternalDocumentation)) as ExternalDocumentation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExternalDocumentation create() => ExternalDocumentation._();
  ExternalDocumentation createEmptyInstance() => create();
  static $pb.PbList<ExternalDocumentation> createRepeated() => $pb.PbList<ExternalDocumentation>();
  @$core.pragma('dart2js:noInline')
  static ExternalDocumentation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExternalDocumentation>(create);
  static ExternalDocumentation? _defaultInstance;

  /// A short description of the target documentation. GFM syntax can be used for
  /// rich text representation.
  @$pb.TagNumber(1)
  $core.String get description => $_getSZ(0);
  @$pb.TagNumber(1)
  set description($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDescription() => $_has(0);
  @$pb.TagNumber(1)
  void clearDescription() => clearField(1);

  /// The URL for the target documentation. Value MUST be in the format
  /// of a URL.
  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => clearField(2);
}

///  `Schema` is a representation of OpenAPI v2 specification's Schema object.
///
///  See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#schemaObject
class Schema extends $pb.GeneratedMessage {
  factory Schema({
    JSONSchema? jsonSchema,
    $core.String? discriminator,
    $core.bool? readOnly,
    ExternalDocumentation? externalDocs,
    $core.String? example,
  }) {
    final $result = create();
    if (jsonSchema != null) {
      $result.jsonSchema = jsonSchema;
    }
    if (discriminator != null) {
      $result.discriminator = discriminator;
    }
    if (readOnly != null) {
      $result.readOnly = readOnly;
    }
    if (externalDocs != null) {
      $result.externalDocs = externalDocs;
    }
    if (example != null) {
      $result.example = example;
    }
    return $result;
  }
  Schema._() : super();
  factory Schema.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Schema.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Schema', package: const $pb.PackageName(_omitMessageNames ? '' : 'grpc.gateway.protoc_gen_openapiv2.options'), createEmptyInstance: create)
    ..aOM<JSONSchema>(1, _omitFieldNames ? '' : 'jsonSchema', subBuilder: JSONSchema.create)
    ..aOS(2, _omitFieldNames ? '' : 'discriminator')
    ..aOB(3, _omitFieldNames ? '' : 'readOnly')
    ..aOM<ExternalDocumentation>(5, _omitFieldNames ? '' : 'externalDocs', subBuilder: ExternalDocumentation.create)
    ..aOS(6, _omitFieldNames ? '' : 'example')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Schema clone() => Schema()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Schema copyWith(void Function(Schema) updates) => super.copyWith((message) => updates(message as Schema)) as Schema;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Schema create() => Schema._();
  Schema createEmptyInstance() => create();
  static $pb.PbList<Schema> createRepeated() => $pb.PbList<Schema>();
  @$core.pragma('dart2js:noInline')
  static Schema getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Schema>(create);
  static Schema? _defaultInstance;

  @$pb.TagNumber(1)
  JSONSchema get jsonSchema => $_getN(0);
  @$pb.TagNumber(1)
  set jsonSchema(JSONSchema v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasJsonSchema() => $_has(0);
  @$pb.TagNumber(1)
  void clearJsonSchema() => clearField(1);
  @$pb.TagNumber(1)
  JSONSchema ensureJsonSchema() => $_ensure(0);

  /// Adds support for polymorphism. The discriminator is the schema property
  /// name that is used to differentiate between other schema that inherit this
  /// schema. The property name used MUST be defined at this schema and it MUST
  /// be in the required property list. When used, the value MUST be the name of
  /// this schema or any schema that inherits it.
  @$pb.TagNumber(2)
  $core.String get discriminator => $_getSZ(1);
  @$pb.TagNumber(2)
  set discriminator($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDiscriminator() => $_has(1);
  @$pb.TagNumber(2)
  void clearDiscriminator() => clearField(2);

  /// Relevant only for Schema "properties" definitions. Declares the property as
  /// "read only". This means that it MAY be sent as part of a response but MUST
  /// NOT be sent as part of the request. Properties marked as readOnly being
  /// true SHOULD NOT be in the required list of the defined schema. Default
  /// value is false.
  @$pb.TagNumber(3)
  $core.bool get readOnly => $_getBF(2);
  @$pb.TagNumber(3)
  set readOnly($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasReadOnly() => $_has(2);
  @$pb.TagNumber(3)
  void clearReadOnly() => clearField(3);

  /// Additional external documentation for this schema.
  @$pb.TagNumber(5)
  ExternalDocumentation get externalDocs => $_getN(3);
  @$pb.TagNumber(5)
  set externalDocs(ExternalDocumentation v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasExternalDocs() => $_has(3);
  @$pb.TagNumber(5)
  void clearExternalDocs() => clearField(5);
  @$pb.TagNumber(5)
  ExternalDocumentation ensureExternalDocs() => $_ensure(3);

  /// A free-form property to include an example of an instance for this schema in JSON.
  /// This is copied verbatim to the output.
  @$pb.TagNumber(6)
  $core.String get example => $_getSZ(4);
  @$pb.TagNumber(6)
  set example($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasExample() => $_has(4);
  @$pb.TagNumber(6)
  void clearExample() => clearField(6);
}

///  `EnumSchema` is subset of fields from the OpenAPI v2 specification's Schema object.
///  Only fields that are applicable to Enums are included
///  See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#schemaObject
///
///  Example:
///
///   option (grpc.gateway.protoc_gen_openapiv2.options.openapiv2_enum) = {
///     ...
///     title: "MyEnum";
///     description:"This is my nice enum";
///     example: "ZERO";
///     required: true;
///     ...
///   };
class EnumSchema extends $pb.GeneratedMessage {
  factory EnumSchema({
    $core.String? description,
    $core.String? default_2,
    $core.String? title,
    $core.bool? required,
    $core.bool? readOnly,
    ExternalDocumentation? externalDocs,
    $core.String? example,
    $core.String? ref,
    $core.Map<$core.String, $0.Value>? extensions,
  }) {
    final $result = create();
    if (description != null) {
      $result.description = description;
    }
    if (default_2 != null) {
      $result.default_2 = default_2;
    }
    if (title != null) {
      $result.title = title;
    }
    if (required != null) {
      $result.required = required;
    }
    if (readOnly != null) {
      $result.readOnly = readOnly;
    }
    if (externalDocs != null) {
      $result.externalDocs = externalDocs;
    }
    if (example != null) {
      $result.example = example;
    }
    if (ref != null) {
      $result.ref = ref;
    }
    if (extensions != null) {
      $result.extensions.addAll(extensions);
    }
    return $result;
  }
  EnumSchema._() : super();
  factory EnumSchema.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EnumSchema.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EnumSchema', package: const $pb.PackageName(_omitMessageNames ? '' : 'grpc.gateway.protoc_gen_openapiv2.options'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'description')
    ..aOS(2, _omitFieldNames ? '' : 'default')
    ..aOS(3, _omitFieldNames ? '' : 'title')
    ..aOB(4, _omitFieldNames ? '' : 'required')
    ..aOB(5, _omitFieldNames ? '' : 'readOnly')
    ..aOM<ExternalDocumentation>(6, _omitFieldNames ? '' : 'externalDocs', subBuilder: ExternalDocumentation.create)
    ..aOS(7, _omitFieldNames ? '' : 'example')
    ..aOS(8, _omitFieldNames ? '' : 'ref')
    ..m<$core.String, $0.Value>(9, _omitFieldNames ? '' : 'extensions', entryClassName: 'EnumSchema.ExtensionsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: $0.Value.create, valueDefaultOrMaker: $0.Value.getDefault, packageName: const $pb.PackageName('grpc.gateway.protoc_gen_openapiv2.options'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EnumSchema clone() => EnumSchema()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EnumSchema copyWith(void Function(EnumSchema) updates) => super.copyWith((message) => updates(message as EnumSchema)) as EnumSchema;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EnumSchema create() => EnumSchema._();
  EnumSchema createEmptyInstance() => create();
  static $pb.PbList<EnumSchema> createRepeated() => $pb.PbList<EnumSchema>();
  @$core.pragma('dart2js:noInline')
  static EnumSchema getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EnumSchema>(create);
  static EnumSchema? _defaultInstance;

  /// A short description of the schema.
  @$pb.TagNumber(1)
  $core.String get description => $_getSZ(0);
  @$pb.TagNumber(1)
  set description($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDescription() => $_has(0);
  @$pb.TagNumber(1)
  void clearDescription() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get default_2 => $_getSZ(1);
  @$pb.TagNumber(2)
  set default_2($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDefault_2() => $_has(1);
  @$pb.TagNumber(2)
  void clearDefault_2() => clearField(2);

  /// The title of the schema.
  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get required => $_getBF(3);
  @$pb.TagNumber(4)
  set required($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRequired() => $_has(3);
  @$pb.TagNumber(4)
  void clearRequired() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get readOnly => $_getBF(4);
  @$pb.TagNumber(5)
  set readOnly($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasReadOnly() => $_has(4);
  @$pb.TagNumber(5)
  void clearReadOnly() => clearField(5);

  /// Additional external documentation for this schema.
  @$pb.TagNumber(6)
  ExternalDocumentation get externalDocs => $_getN(5);
  @$pb.TagNumber(6)
  set externalDocs(ExternalDocumentation v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasExternalDocs() => $_has(5);
  @$pb.TagNumber(6)
  void clearExternalDocs() => clearField(6);
  @$pb.TagNumber(6)
  ExternalDocumentation ensureExternalDocs() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.String get example => $_getSZ(6);
  @$pb.TagNumber(7)
  set example($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasExample() => $_has(6);
  @$pb.TagNumber(7)
  void clearExample() => clearField(7);

  /// Ref is used to define an external reference to include in the message.
  /// This could be a fully qualified proto message reference, and that type must
  /// be imported into the protofile. If no message is identified, the Ref will
  /// be used verbatim in the output.
  /// For example:
  ///  `ref: ".google.protobuf.Timestamp"`.
  @$pb.TagNumber(8)
  $core.String get ref => $_getSZ(7);
  @$pb.TagNumber(8)
  set ref($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasRef() => $_has(7);
  @$pb.TagNumber(8)
  void clearRef() => clearField(8);

  /// Custom properties that start with "x-" such as "x-foo" used to describe
  /// extra functionality that is not covered by the standard OpenAPI Specification.
  /// See: https://swagger.io/docs/specification/2-0/swagger-extensions/
  @$pb.TagNumber(9)
  $core.Map<$core.String, $0.Value> get extensions => $_getMap(8);
}

/// 'FieldConfiguration' provides additional field level properties used when generating the OpenAPI v2 file.
/// These properties are not defined by OpenAPIv2, but they are used to control the generation.
class JSONSchema_FieldConfiguration extends $pb.GeneratedMessage {
  factory JSONSchema_FieldConfiguration({
    $core.String? pathParamName,
  }) {
    final $result = create();
    if (pathParamName != null) {
      $result.pathParamName = pathParamName;
    }
    return $result;
  }
  JSONSchema_FieldConfiguration._() : super();
  factory JSONSchema_FieldConfiguration.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JSONSchema_FieldConfiguration.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'JSONSchema.FieldConfiguration', package: const $pb.PackageName(_omitMessageNames ? '' : 'grpc.gateway.protoc_gen_openapiv2.options'), createEmptyInstance: create)
    ..aOS(47, _omitFieldNames ? '' : 'pathParamName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  JSONSchema_FieldConfiguration clone() => JSONSchema_FieldConfiguration()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  JSONSchema_FieldConfiguration copyWith(void Function(JSONSchema_FieldConfiguration) updates) => super.copyWith((message) => updates(message as JSONSchema_FieldConfiguration)) as JSONSchema_FieldConfiguration;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JSONSchema_FieldConfiguration create() => JSONSchema_FieldConfiguration._();
  JSONSchema_FieldConfiguration createEmptyInstance() => create();
  static $pb.PbList<JSONSchema_FieldConfiguration> createRepeated() => $pb.PbList<JSONSchema_FieldConfiguration>();
  @$core.pragma('dart2js:noInline')
  static JSONSchema_FieldConfiguration getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JSONSchema_FieldConfiguration>(create);
  static JSONSchema_FieldConfiguration? _defaultInstance;

  /// Alternative parameter name when used as path parameter. If set, this will
  /// be used as the complete parameter name when this field is used as a path
  /// parameter. Use this to avoid having auto generated path parameter names
  /// for overlapping paths.
  @$pb.TagNumber(47)
  $core.String get pathParamName => $_getSZ(0);
  @$pb.TagNumber(47)
  set pathParamName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(47)
  $core.bool hasPathParamName() => $_has(0);
  @$pb.TagNumber(47)
  void clearPathParamName() => clearField(47);
}

///  `JSONSchema` represents properties from JSON Schema taken, and as used, in
///  the OpenAPI v2 spec.
///
///  This includes changes made by OpenAPI v2.
///
///  See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#schemaObject
///
///  See also: https://cswr.github.io/JsonSchema/spec/basic_types/,
///  https://github.com/json-schema-org/json-schema-spec/blob/master/schema.json
///
///  Example:
///
///   message SimpleMessage {
///     option (grpc.gateway.protoc_gen_openapiv2.options.openapiv2_schema) = {
///       json_schema: {
///         title: "SimpleMessage"
///         description: "A simple message."
///         required: ["id"]
///       }
///     };
///
///     // Id represents the message identifier.
///     string id = 1; [
///         (grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
///           description: "The unique identifier of the simple message."
///         }];
///   }
class JSONSchema extends $pb.GeneratedMessage {
  factory JSONSchema({
    $core.String? ref,
    $core.String? title,
    $core.String? description,
    $core.String? default_7,
    $core.bool? readOnly,
    $core.String? example,
    $core.double? multipleOf,
    $core.double? maximum,
    $core.bool? exclusiveMaximum,
    $core.double? minimum,
    $core.bool? exclusiveMinimum,
    $fixnum.Int64? maxLength,
    $fixnum.Int64? minLength,
    $core.String? pattern,
    $fixnum.Int64? maxItems,
    $fixnum.Int64? minItems,
    $core.bool? uniqueItems,
    $fixnum.Int64? maxProperties,
    $fixnum.Int64? minProperties,
    $core.Iterable<$core.String>? required,
    $core.Iterable<$core.String>? array,
    $core.Iterable<JSONSchema_JSONSchemaSimpleTypes>? type,
    $core.String? format,
    $core.Iterable<$core.String>? enum_46,
    $core.Map<$core.String, $0.Value>? extensions,
    JSONSchema_FieldConfiguration? fieldConfiguration,
  }) {
    final $result = create();
    if (ref != null) {
      $result.ref = ref;
    }
    if (title != null) {
      $result.title = title;
    }
    if (description != null) {
      $result.description = description;
    }
    if (default_7 != null) {
      $result.default_7 = default_7;
    }
    if (readOnly != null) {
      $result.readOnly = readOnly;
    }
    if (example != null) {
      $result.example = example;
    }
    if (multipleOf != null) {
      $result.multipleOf = multipleOf;
    }
    if (maximum != null) {
      $result.maximum = maximum;
    }
    if (exclusiveMaximum != null) {
      $result.exclusiveMaximum = exclusiveMaximum;
    }
    if (minimum != null) {
      $result.minimum = minimum;
    }
    if (exclusiveMinimum != null) {
      $result.exclusiveMinimum = exclusiveMinimum;
    }
    if (maxLength != null) {
      $result.maxLength = maxLength;
    }
    if (minLength != null) {
      $result.minLength = minLength;
    }
    if (pattern != null) {
      $result.pattern = pattern;
    }
    if (maxItems != null) {
      $result.maxItems = maxItems;
    }
    if (minItems != null) {
      $result.minItems = minItems;
    }
    if (uniqueItems != null) {
      $result.uniqueItems = uniqueItems;
    }
    if (maxProperties != null) {
      $result.maxProperties = maxProperties;
    }
    if (minProperties != null) {
      $result.minProperties = minProperties;
    }
    if (required != null) {
      $result.required.addAll(required);
    }
    if (array != null) {
      $result.array.addAll(array);
    }
    if (type != null) {
      $result.type.addAll(type);
    }
    if (format != null) {
      $result.format = format;
    }
    if (enum_46 != null) {
      $result.enum_46.addAll(enum_46);
    }
    if (extensions != null) {
      $result.extensions.addAll(extensions);
    }
    if (fieldConfiguration != null) {
      $result.fieldConfiguration = fieldConfiguration;
    }
    return $result;
  }
  JSONSchema._() : super();
  factory JSONSchema.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JSONSchema.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'JSONSchema', package: const $pb.PackageName(_omitMessageNames ? '' : 'grpc.gateway.protoc_gen_openapiv2.options'), createEmptyInstance: create)
    ..aOS(3, _omitFieldNames ? '' : 'ref')
    ..aOS(5, _omitFieldNames ? '' : 'title')
    ..aOS(6, _omitFieldNames ? '' : 'description')
    ..aOS(7, _omitFieldNames ? '' : 'default')
    ..aOB(8, _omitFieldNames ? '' : 'readOnly')
    ..aOS(9, _omitFieldNames ? '' : 'example')
    ..a<$core.double>(10, _omitFieldNames ? '' : 'multipleOf', $pb.PbFieldType.OD)
    ..a<$core.double>(11, _omitFieldNames ? '' : 'maximum', $pb.PbFieldType.OD)
    ..aOB(12, _omitFieldNames ? '' : 'exclusiveMaximum')
    ..a<$core.double>(13, _omitFieldNames ? '' : 'minimum', $pb.PbFieldType.OD)
    ..aOB(14, _omitFieldNames ? '' : 'exclusiveMinimum')
    ..a<$fixnum.Int64>(15, _omitFieldNames ? '' : 'maxLength', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(16, _omitFieldNames ? '' : 'minLength', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(17, _omitFieldNames ? '' : 'pattern')
    ..a<$fixnum.Int64>(20, _omitFieldNames ? '' : 'maxItems', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(21, _omitFieldNames ? '' : 'minItems', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(22, _omitFieldNames ? '' : 'uniqueItems')
    ..a<$fixnum.Int64>(24, _omitFieldNames ? '' : 'maxProperties', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(25, _omitFieldNames ? '' : 'minProperties', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..pPS(26, _omitFieldNames ? '' : 'required')
    ..pPS(34, _omitFieldNames ? '' : 'array')
    ..pc<JSONSchema_JSONSchemaSimpleTypes>(35, _omitFieldNames ? '' : 'type', $pb.PbFieldType.KE, valueOf: JSONSchema_JSONSchemaSimpleTypes.valueOf, enumValues: JSONSchema_JSONSchemaSimpleTypes.values, defaultEnumValue: JSONSchema_JSONSchemaSimpleTypes.UNKNOWN)
    ..aOS(36, _omitFieldNames ? '' : 'format')
    ..pPS(46, _omitFieldNames ? '' : 'enum')
    ..m<$core.String, $0.Value>(48, _omitFieldNames ? '' : 'extensions', entryClassName: 'JSONSchema.ExtensionsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: $0.Value.create, valueDefaultOrMaker: $0.Value.getDefault, packageName: const $pb.PackageName('grpc.gateway.protoc_gen_openapiv2.options'))
    ..aOM<JSONSchema_FieldConfiguration>(1001, _omitFieldNames ? '' : 'fieldConfiguration', subBuilder: JSONSchema_FieldConfiguration.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  JSONSchema clone() => JSONSchema()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  JSONSchema copyWith(void Function(JSONSchema) updates) => super.copyWith((message) => updates(message as JSONSchema)) as JSONSchema;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JSONSchema create() => JSONSchema._();
  JSONSchema createEmptyInstance() => create();
  static $pb.PbList<JSONSchema> createRepeated() => $pb.PbList<JSONSchema>();
  @$core.pragma('dart2js:noInline')
  static JSONSchema getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JSONSchema>(create);
  static JSONSchema? _defaultInstance;

  /// Ref is used to define an external reference to include in the message.
  /// This could be a fully qualified proto message reference, and that type must
  /// be imported into the protofile. If no message is identified, the Ref will
  /// be used verbatim in the output.
  /// For example:
  ///  `ref: ".google.protobuf.Timestamp"`.
  @$pb.TagNumber(3)
  $core.String get ref => $_getSZ(0);
  @$pb.TagNumber(3)
  set ref($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(3)
  $core.bool hasRef() => $_has(0);
  @$pb.TagNumber(3)
  void clearRef() => clearField(3);

  /// The title of the schema.
  @$pb.TagNumber(5)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(5)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(5)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(5)
  void clearTitle() => clearField(5);

  /// A short description of the schema.
  @$pb.TagNumber(6)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(6)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(6)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(6)
  void clearDescription() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get default_7 => $_getSZ(3);
  @$pb.TagNumber(7)
  set default_7($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(7)
  $core.bool hasDefault_7() => $_has(3);
  @$pb.TagNumber(7)
  void clearDefault_7() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get readOnly => $_getBF(4);
  @$pb.TagNumber(8)
  set readOnly($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(8)
  $core.bool hasReadOnly() => $_has(4);
  @$pb.TagNumber(8)
  void clearReadOnly() => clearField(8);

  /// A free-form property to include a JSON example of this field. This is copied
  /// verbatim to the output swagger.json. Quotes must be escaped.
  /// This property is the same for 2.0 and 3.0.0 https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/3.0.0.md#schemaObject  https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#schemaObject
  @$pb.TagNumber(9)
  $core.String get example => $_getSZ(5);
  @$pb.TagNumber(9)
  set example($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(9)
  $core.bool hasExample() => $_has(5);
  @$pb.TagNumber(9)
  void clearExample() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get multipleOf => $_getN(6);
  @$pb.TagNumber(10)
  set multipleOf($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(10)
  $core.bool hasMultipleOf() => $_has(6);
  @$pb.TagNumber(10)
  void clearMultipleOf() => clearField(10);

  /// Maximum represents an inclusive upper limit for a numeric instance. The
  /// value of MUST be a number,
  @$pb.TagNumber(11)
  $core.double get maximum => $_getN(7);
  @$pb.TagNumber(11)
  set maximum($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(11)
  $core.bool hasMaximum() => $_has(7);
  @$pb.TagNumber(11)
  void clearMaximum() => clearField(11);

  @$pb.TagNumber(12)
  $core.bool get exclusiveMaximum => $_getBF(8);
  @$pb.TagNumber(12)
  set exclusiveMaximum($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(12)
  $core.bool hasExclusiveMaximum() => $_has(8);
  @$pb.TagNumber(12)
  void clearExclusiveMaximum() => clearField(12);

  /// minimum represents an inclusive lower limit for a numeric instance. The
  /// value of MUST be a number,
  @$pb.TagNumber(13)
  $core.double get minimum => $_getN(9);
  @$pb.TagNumber(13)
  set minimum($core.double v) { $_setDouble(9, v); }
  @$pb.TagNumber(13)
  $core.bool hasMinimum() => $_has(9);
  @$pb.TagNumber(13)
  void clearMinimum() => clearField(13);

  @$pb.TagNumber(14)
  $core.bool get exclusiveMinimum => $_getBF(10);
  @$pb.TagNumber(14)
  set exclusiveMinimum($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(14)
  $core.bool hasExclusiveMinimum() => $_has(10);
  @$pb.TagNumber(14)
  void clearExclusiveMinimum() => clearField(14);

  @$pb.TagNumber(15)
  $fixnum.Int64 get maxLength => $_getI64(11);
  @$pb.TagNumber(15)
  set maxLength($fixnum.Int64 v) { $_setInt64(11, v); }
  @$pb.TagNumber(15)
  $core.bool hasMaxLength() => $_has(11);
  @$pb.TagNumber(15)
  void clearMaxLength() => clearField(15);

  @$pb.TagNumber(16)
  $fixnum.Int64 get minLength => $_getI64(12);
  @$pb.TagNumber(16)
  set minLength($fixnum.Int64 v) { $_setInt64(12, v); }
  @$pb.TagNumber(16)
  $core.bool hasMinLength() => $_has(12);
  @$pb.TagNumber(16)
  void clearMinLength() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get pattern => $_getSZ(13);
  @$pb.TagNumber(17)
  set pattern($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(17)
  $core.bool hasPattern() => $_has(13);
  @$pb.TagNumber(17)
  void clearPattern() => clearField(17);

  @$pb.TagNumber(20)
  $fixnum.Int64 get maxItems => $_getI64(14);
  @$pb.TagNumber(20)
  set maxItems($fixnum.Int64 v) { $_setInt64(14, v); }
  @$pb.TagNumber(20)
  $core.bool hasMaxItems() => $_has(14);
  @$pb.TagNumber(20)
  void clearMaxItems() => clearField(20);

  @$pb.TagNumber(21)
  $fixnum.Int64 get minItems => $_getI64(15);
  @$pb.TagNumber(21)
  set minItems($fixnum.Int64 v) { $_setInt64(15, v); }
  @$pb.TagNumber(21)
  $core.bool hasMinItems() => $_has(15);
  @$pb.TagNumber(21)
  void clearMinItems() => clearField(21);

  @$pb.TagNumber(22)
  $core.bool get uniqueItems => $_getBF(16);
  @$pb.TagNumber(22)
  set uniqueItems($core.bool v) { $_setBool(16, v); }
  @$pb.TagNumber(22)
  $core.bool hasUniqueItems() => $_has(16);
  @$pb.TagNumber(22)
  void clearUniqueItems() => clearField(22);

  @$pb.TagNumber(24)
  $fixnum.Int64 get maxProperties => $_getI64(17);
  @$pb.TagNumber(24)
  set maxProperties($fixnum.Int64 v) { $_setInt64(17, v); }
  @$pb.TagNumber(24)
  $core.bool hasMaxProperties() => $_has(17);
  @$pb.TagNumber(24)
  void clearMaxProperties() => clearField(24);

  @$pb.TagNumber(25)
  $fixnum.Int64 get minProperties => $_getI64(18);
  @$pb.TagNumber(25)
  set minProperties($fixnum.Int64 v) { $_setInt64(18, v); }
  @$pb.TagNumber(25)
  $core.bool hasMinProperties() => $_has(18);
  @$pb.TagNumber(25)
  void clearMinProperties() => clearField(25);

  @$pb.TagNumber(26)
  $core.List<$core.String> get required => $_getList(19);

  /// Items in 'array' must be unique.
  @$pb.TagNumber(34)
  $core.List<$core.String> get array => $_getList(20);

  @$pb.TagNumber(35)
  $core.List<JSONSchema_JSONSchemaSimpleTypes> get type => $_getList(21);

  /// `Format`
  @$pb.TagNumber(36)
  $core.String get format => $_getSZ(22);
  @$pb.TagNumber(36)
  set format($core.String v) { $_setString(22, v); }
  @$pb.TagNumber(36)
  $core.bool hasFormat() => $_has(22);
  @$pb.TagNumber(36)
  void clearFormat() => clearField(36);

  /// Items in `enum` must be unique https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.5.1
  @$pb.TagNumber(46)
  $core.List<$core.String> get enum_46 => $_getList(23);

  /// Custom properties that start with "x-" such as "x-foo" used to describe
  /// extra functionality that is not covered by the standard OpenAPI Specification.
  /// See: https://swagger.io/docs/specification/2-0/swagger-extensions/
  @$pb.TagNumber(48)
  $core.Map<$core.String, $0.Value> get extensions => $_getMap(24);

  /// Additional field level properties used when generating the OpenAPI v2 file.
  @$pb.TagNumber(1001)
  JSONSchema_FieldConfiguration get fieldConfiguration => $_getN(25);
  @$pb.TagNumber(1001)
  set fieldConfiguration(JSONSchema_FieldConfiguration v) { setField(1001, v); }
  @$pb.TagNumber(1001)
  $core.bool hasFieldConfiguration() => $_has(25);
  @$pb.TagNumber(1001)
  void clearFieldConfiguration() => clearField(1001);
  @$pb.TagNumber(1001)
  JSONSchema_FieldConfiguration ensureFieldConfiguration() => $_ensure(25);
}

///  `Tag` is a representation of OpenAPI v2 specification's Tag object.
///
///  See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#tagObject
class Tag extends $pb.GeneratedMessage {
  factory Tag({
    $core.String? name,
    $core.String? description,
    ExternalDocumentation? externalDocs,
    $core.Map<$core.String, $0.Value>? extensions,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (externalDocs != null) {
      $result.externalDocs = externalDocs;
    }
    if (extensions != null) {
      $result.extensions.addAll(extensions);
    }
    return $result;
  }
  Tag._() : super();
  factory Tag.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Tag.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Tag', package: const $pb.PackageName(_omitMessageNames ? '' : 'grpc.gateway.protoc_gen_openapiv2.options'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..aOM<ExternalDocumentation>(3, _omitFieldNames ? '' : 'externalDocs', subBuilder: ExternalDocumentation.create)
    ..m<$core.String, $0.Value>(4, _omitFieldNames ? '' : 'extensions', entryClassName: 'Tag.ExtensionsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: $0.Value.create, valueDefaultOrMaker: $0.Value.getDefault, packageName: const $pb.PackageName('grpc.gateway.protoc_gen_openapiv2.options'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Tag clone() => Tag()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Tag copyWith(void Function(Tag) updates) => super.copyWith((message) => updates(message as Tag)) as Tag;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Tag create() => Tag._();
  Tag createEmptyInstance() => create();
  static $pb.PbList<Tag> createRepeated() => $pb.PbList<Tag>();
  @$core.pragma('dart2js:noInline')
  static Tag getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Tag>(create);
  static Tag? _defaultInstance;

  /// The name of the tag. Use it to allow override of the name of a
  /// global Tag object, then use that name to reference the tag throughout the
  /// OpenAPI file.
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  /// A short description for the tag. GFM syntax can be used for rich text
  /// representation.
  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  /// Additional external documentation for this tag.
  @$pb.TagNumber(3)
  ExternalDocumentation get externalDocs => $_getN(2);
  @$pb.TagNumber(3)
  set externalDocs(ExternalDocumentation v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasExternalDocs() => $_has(2);
  @$pb.TagNumber(3)
  void clearExternalDocs() => clearField(3);
  @$pb.TagNumber(3)
  ExternalDocumentation ensureExternalDocs() => $_ensure(2);

  /// Custom properties that start with "x-" such as "x-foo" used to describe
  /// extra functionality that is not covered by the standard OpenAPI Specification.
  /// See: https://swagger.io/docs/specification/2-0/swagger-extensions/
  @$pb.TagNumber(4)
  $core.Map<$core.String, $0.Value> get extensions => $_getMap(3);
}

///  `SecurityDefinitions` is a representation of OpenAPI v2 specification's
///  Security Definitions object.
///
///  See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#securityDefinitionsObject
///
///  A declaration of the security schemes available to be used in the
///  specification. This does not enforce the security schemes on the operations
///  and only serves to provide the relevant details for each scheme.
class SecurityDefinitions extends $pb.GeneratedMessage {
  factory SecurityDefinitions({
    $core.Map<$core.String, SecurityScheme>? security,
  }) {
    final $result = create();
    if (security != null) {
      $result.security.addAll(security);
    }
    return $result;
  }
  SecurityDefinitions._() : super();
  factory SecurityDefinitions.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SecurityDefinitions.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SecurityDefinitions', package: const $pb.PackageName(_omitMessageNames ? '' : 'grpc.gateway.protoc_gen_openapiv2.options'), createEmptyInstance: create)
    ..m<$core.String, SecurityScheme>(1, _omitFieldNames ? '' : 'security', entryClassName: 'SecurityDefinitions.SecurityEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: SecurityScheme.create, valueDefaultOrMaker: SecurityScheme.getDefault, packageName: const $pb.PackageName('grpc.gateway.protoc_gen_openapiv2.options'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SecurityDefinitions clone() => SecurityDefinitions()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SecurityDefinitions copyWith(void Function(SecurityDefinitions) updates) => super.copyWith((message) => updates(message as SecurityDefinitions)) as SecurityDefinitions;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SecurityDefinitions create() => SecurityDefinitions._();
  SecurityDefinitions createEmptyInstance() => create();
  static $pb.PbList<SecurityDefinitions> createRepeated() => $pb.PbList<SecurityDefinitions>();
  @$core.pragma('dart2js:noInline')
  static SecurityDefinitions getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SecurityDefinitions>(create);
  static SecurityDefinitions? _defaultInstance;

  /// A single security scheme definition, mapping a "name" to the scheme it
  /// defines.
  @$pb.TagNumber(1)
  $core.Map<$core.String, SecurityScheme> get security => $_getMap(0);
}

///  `SecurityScheme` is a representation of OpenAPI v2 specification's
///  Security Scheme object.
///
///  See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#securitySchemeObject
///
///  Allows the definition of a security scheme that can be used by the
///  operations. Supported schemes are basic authentication, an API key (either as
///  a header or as a query parameter) and OAuth2's common flows (implicit,
///  password, application and access code).
class SecurityScheme extends $pb.GeneratedMessage {
  factory SecurityScheme({
    SecurityScheme_Type? type,
    $core.String? description,
    $core.String? name,
    SecurityScheme_In? in_4,
    SecurityScheme_Flow? flow,
    $core.String? authorizationUrl,
    $core.String? tokenUrl,
    Scopes? scopes,
    $core.Map<$core.String, $0.Value>? extensions,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (description != null) {
      $result.description = description;
    }
    if (name != null) {
      $result.name = name;
    }
    if (in_4 != null) {
      $result.in_4 = in_4;
    }
    if (flow != null) {
      $result.flow = flow;
    }
    if (authorizationUrl != null) {
      $result.authorizationUrl = authorizationUrl;
    }
    if (tokenUrl != null) {
      $result.tokenUrl = tokenUrl;
    }
    if (scopes != null) {
      $result.scopes = scopes;
    }
    if (extensions != null) {
      $result.extensions.addAll(extensions);
    }
    return $result;
  }
  SecurityScheme._() : super();
  factory SecurityScheme.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SecurityScheme.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SecurityScheme', package: const $pb.PackageName(_omitMessageNames ? '' : 'grpc.gateway.protoc_gen_openapiv2.options'), createEmptyInstance: create)
    ..e<SecurityScheme_Type>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: SecurityScheme_Type.TYPE_INVALID, valueOf: SecurityScheme_Type.valueOf, enumValues: SecurityScheme_Type.values)
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..e<SecurityScheme_In>(4, _omitFieldNames ? '' : 'in', $pb.PbFieldType.OE, defaultOrMaker: SecurityScheme_In.IN_INVALID, valueOf: SecurityScheme_In.valueOf, enumValues: SecurityScheme_In.values)
    ..e<SecurityScheme_Flow>(5, _omitFieldNames ? '' : 'flow', $pb.PbFieldType.OE, defaultOrMaker: SecurityScheme_Flow.FLOW_INVALID, valueOf: SecurityScheme_Flow.valueOf, enumValues: SecurityScheme_Flow.values)
    ..aOS(6, _omitFieldNames ? '' : 'authorizationUrl')
    ..aOS(7, _omitFieldNames ? '' : 'tokenUrl')
    ..aOM<Scopes>(8, _omitFieldNames ? '' : 'scopes', subBuilder: Scopes.create)
    ..m<$core.String, $0.Value>(9, _omitFieldNames ? '' : 'extensions', entryClassName: 'SecurityScheme.ExtensionsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: $0.Value.create, valueDefaultOrMaker: $0.Value.getDefault, packageName: const $pb.PackageName('grpc.gateway.protoc_gen_openapiv2.options'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SecurityScheme clone() => SecurityScheme()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SecurityScheme copyWith(void Function(SecurityScheme) updates) => super.copyWith((message) => updates(message as SecurityScheme)) as SecurityScheme;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SecurityScheme create() => SecurityScheme._();
  SecurityScheme createEmptyInstance() => create();
  static $pb.PbList<SecurityScheme> createRepeated() => $pb.PbList<SecurityScheme>();
  @$core.pragma('dart2js:noInline')
  static SecurityScheme getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SecurityScheme>(create);
  static SecurityScheme? _defaultInstance;

  /// The type of the security scheme. Valid values are "basic",
  /// "apiKey" or "oauth2".
  @$pb.TagNumber(1)
  SecurityScheme_Type get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(SecurityScheme_Type v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  /// A short description for security scheme.
  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  /// The name of the header or query parameter to be used.
  /// Valid for apiKey.
  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  /// The location of the API key. Valid values are "query" or
  /// "header".
  /// Valid for apiKey.
  @$pb.TagNumber(4)
  SecurityScheme_In get in_4 => $_getN(3);
  @$pb.TagNumber(4)
  set in_4(SecurityScheme_In v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasIn_4() => $_has(3);
  @$pb.TagNumber(4)
  void clearIn_4() => clearField(4);

  /// The flow used by the OAuth2 security scheme. Valid values are
  /// "implicit", "password", "application" or "accessCode".
  /// Valid for oauth2.
  @$pb.TagNumber(5)
  SecurityScheme_Flow get flow => $_getN(4);
  @$pb.TagNumber(5)
  set flow(SecurityScheme_Flow v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasFlow() => $_has(4);
  @$pb.TagNumber(5)
  void clearFlow() => clearField(5);

  /// The authorization URL to be used for this flow. This SHOULD be in
  /// the form of a URL.
  /// Valid for oauth2/implicit and oauth2/accessCode.
  @$pb.TagNumber(6)
  $core.String get authorizationUrl => $_getSZ(5);
  @$pb.TagNumber(6)
  set authorizationUrl($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAuthorizationUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearAuthorizationUrl() => clearField(6);

  /// The token URL to be used for this flow. This SHOULD be in the
  /// form of a URL.
  /// Valid for oauth2/password, oauth2/application and oauth2/accessCode.
  @$pb.TagNumber(7)
  $core.String get tokenUrl => $_getSZ(6);
  @$pb.TagNumber(7)
  set tokenUrl($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTokenUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearTokenUrl() => clearField(7);

  /// The available scopes for the OAuth2 security scheme.
  /// Valid for oauth2.
  @$pb.TagNumber(8)
  Scopes get scopes => $_getN(7);
  @$pb.TagNumber(8)
  set scopes(Scopes v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasScopes() => $_has(7);
  @$pb.TagNumber(8)
  void clearScopes() => clearField(8);
  @$pb.TagNumber(8)
  Scopes ensureScopes() => $_ensure(7);

  /// Custom properties that start with "x-" such as "x-foo" used to describe
  /// extra functionality that is not covered by the standard OpenAPI Specification.
  /// See: https://swagger.io/docs/specification/2-0/swagger-extensions/
  @$pb.TagNumber(9)
  $core.Map<$core.String, $0.Value> get extensions => $_getMap(8);
}

/// If the security scheme is of type "oauth2", then the value is a list of
/// scope names required for the execution. For other security scheme types,
/// the array MUST be empty.
class SecurityRequirement_SecurityRequirementValue extends $pb.GeneratedMessage {
  factory SecurityRequirement_SecurityRequirementValue({
    $core.Iterable<$core.String>? scope,
  }) {
    final $result = create();
    if (scope != null) {
      $result.scope.addAll(scope);
    }
    return $result;
  }
  SecurityRequirement_SecurityRequirementValue._() : super();
  factory SecurityRequirement_SecurityRequirementValue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SecurityRequirement_SecurityRequirementValue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SecurityRequirement.SecurityRequirementValue', package: const $pb.PackageName(_omitMessageNames ? '' : 'grpc.gateway.protoc_gen_openapiv2.options'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'scope')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SecurityRequirement_SecurityRequirementValue clone() => SecurityRequirement_SecurityRequirementValue()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SecurityRequirement_SecurityRequirementValue copyWith(void Function(SecurityRequirement_SecurityRequirementValue) updates) => super.copyWith((message) => updates(message as SecurityRequirement_SecurityRequirementValue)) as SecurityRequirement_SecurityRequirementValue;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SecurityRequirement_SecurityRequirementValue create() => SecurityRequirement_SecurityRequirementValue._();
  SecurityRequirement_SecurityRequirementValue createEmptyInstance() => create();
  static $pb.PbList<SecurityRequirement_SecurityRequirementValue> createRepeated() => $pb.PbList<SecurityRequirement_SecurityRequirementValue>();
  @$core.pragma('dart2js:noInline')
  static SecurityRequirement_SecurityRequirementValue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SecurityRequirement_SecurityRequirementValue>(create);
  static SecurityRequirement_SecurityRequirementValue? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get scope => $_getList(0);
}

///  `SecurityRequirement` is a representation of OpenAPI v2 specification's
///  Security Requirement object.
///
///  See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#securityRequirementObject
///
///  Lists the required security schemes to execute this operation. The object can
///  have multiple security schemes declared in it which are all required (that
///  is, there is a logical AND between the schemes).
///
///  The name used for each property MUST correspond to a security scheme
///  declared in the Security Definitions.
class SecurityRequirement extends $pb.GeneratedMessage {
  factory SecurityRequirement({
    $core.Map<$core.String, SecurityRequirement_SecurityRequirementValue>? securityRequirement,
  }) {
    final $result = create();
    if (securityRequirement != null) {
      $result.securityRequirement.addAll(securityRequirement);
    }
    return $result;
  }
  SecurityRequirement._() : super();
  factory SecurityRequirement.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SecurityRequirement.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SecurityRequirement', package: const $pb.PackageName(_omitMessageNames ? '' : 'grpc.gateway.protoc_gen_openapiv2.options'), createEmptyInstance: create)
    ..m<$core.String, SecurityRequirement_SecurityRequirementValue>(1, _omitFieldNames ? '' : 'securityRequirement', entryClassName: 'SecurityRequirement.SecurityRequirementEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: SecurityRequirement_SecurityRequirementValue.create, valueDefaultOrMaker: SecurityRequirement_SecurityRequirementValue.getDefault, packageName: const $pb.PackageName('grpc.gateway.protoc_gen_openapiv2.options'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SecurityRequirement clone() => SecurityRequirement()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SecurityRequirement copyWith(void Function(SecurityRequirement) updates) => super.copyWith((message) => updates(message as SecurityRequirement)) as SecurityRequirement;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SecurityRequirement create() => SecurityRequirement._();
  SecurityRequirement createEmptyInstance() => create();
  static $pb.PbList<SecurityRequirement> createRepeated() => $pb.PbList<SecurityRequirement>();
  @$core.pragma('dart2js:noInline')
  static SecurityRequirement getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SecurityRequirement>(create);
  static SecurityRequirement? _defaultInstance;

  /// Each name must correspond to a security scheme which is declared in
  /// the Security Definitions. If the security scheme is of type "oauth2",
  /// then the value is a list of scope names required for the execution.
  /// For other security scheme types, the array MUST be empty.
  @$pb.TagNumber(1)
  $core.Map<$core.String, SecurityRequirement_SecurityRequirementValue> get securityRequirement => $_getMap(0);
}

///  `Scopes` is a representation of OpenAPI v2 specification's Scopes object.
///
///  See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#scopesObject
///
///  Lists the available scopes for an OAuth2 security scheme.
class Scopes extends $pb.GeneratedMessage {
  factory Scopes({
    $core.Map<$core.String, $core.String>? scope,
  }) {
    final $result = create();
    if (scope != null) {
      $result.scope.addAll(scope);
    }
    return $result;
  }
  Scopes._() : super();
  factory Scopes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Scopes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Scopes', package: const $pb.PackageName(_omitMessageNames ? '' : 'grpc.gateway.protoc_gen_openapiv2.options'), createEmptyInstance: create)
    ..m<$core.String, $core.String>(1, _omitFieldNames ? '' : 'scope', entryClassName: 'Scopes.ScopeEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('grpc.gateway.protoc_gen_openapiv2.options'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Scopes clone() => Scopes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Scopes copyWith(void Function(Scopes) updates) => super.copyWith((message) => updates(message as Scopes)) as Scopes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Scopes create() => Scopes._();
  Scopes createEmptyInstance() => create();
  static $pb.PbList<Scopes> createRepeated() => $pb.PbList<Scopes>();
  @$core.pragma('dart2js:noInline')
  static Scopes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Scopes>(create);
  static Scopes? _defaultInstance;

  /// Maps between a name of a scope to a short description of it (as the value
  /// of the property).
  @$pb.TagNumber(1)
  $core.Map<$core.String, $core.String> get scope => $_getMap(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
