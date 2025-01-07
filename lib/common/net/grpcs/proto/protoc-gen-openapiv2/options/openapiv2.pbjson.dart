//
//  Generated code. Do not modify.
//  source: protoc-gen-openapiv2/options/openapiv2.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use schemeDescriptor instead')
const Scheme$json = {
  '1': 'Scheme',
  '2': [
    {'1': 'UNKNOWN', '2': 0},
    {'1': 'HTTP', '2': 1},
    {'1': 'HTTPS', '2': 2},
    {'1': 'WS', '2': 3},
    {'1': 'WSS', '2': 4},
  ],
};

/// Descriptor for `Scheme`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List schemeDescriptor = $convert.base64Decode(
    'CgZTY2hlbWUSCwoHVU5LTk9XThAAEggKBEhUVFAQARIJCgVIVFRQUxACEgYKAldTEAMSBwoDV1'
    'NTEAQ=');

@$core.Deprecated('Use swaggerDescriptor instead')
const Swagger$json = {
  '1': 'Swagger',
  '2': [
    {'1': 'swagger', '3': 1, '4': 1, '5': 9, '10': 'swagger'},
    {'1': 'info', '3': 2, '4': 1, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.Info', '10': 'info'},
    {'1': 'host', '3': 3, '4': 1, '5': 9, '10': 'host'},
    {'1': 'base_path', '3': 4, '4': 1, '5': 9, '10': 'basePath'},
    {'1': 'schemes', '3': 5, '4': 3, '5': 14, '6': '.grpc.gateway.protoc_gen_openapiv2.options.Scheme', '10': 'schemes'},
    {'1': 'consumes', '3': 6, '4': 3, '5': 9, '10': 'consumes'},
    {'1': 'produces', '3': 7, '4': 3, '5': 9, '10': 'produces'},
    {'1': 'responses', '3': 10, '4': 3, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.Swagger.ResponsesEntry', '10': 'responses'},
    {'1': 'security_definitions', '3': 11, '4': 1, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.SecurityDefinitions', '10': 'securityDefinitions'},
    {'1': 'security', '3': 12, '4': 3, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.SecurityRequirement', '10': 'security'},
    {'1': 'tags', '3': 13, '4': 3, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.Tag', '10': 'tags'},
    {'1': 'external_docs', '3': 14, '4': 1, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.ExternalDocumentation', '10': 'externalDocs'},
    {'1': 'extensions', '3': 15, '4': 3, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.Swagger.ExtensionsEntry', '10': 'extensions'},
  ],
  '3': [Swagger_ResponsesEntry$json, Swagger_ExtensionsEntry$json],
  '9': [
    {'1': 8, '2': 9},
    {'1': 9, '2': 10},
  ],
};

@$core.Deprecated('Use swaggerDescriptor instead')
const Swagger_ResponsesEntry$json = {
  '1': 'ResponsesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.Response', '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use swaggerDescriptor instead')
const Swagger_ExtensionsEntry$json = {
  '1': 'ExtensionsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Value', '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `Swagger`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List swaggerDescriptor = $convert.base64Decode(
    'CgdTd2FnZ2VyEhgKB3N3YWdnZXIYASABKAlSB3N3YWdnZXISQwoEaW5mbxgCIAEoCzIvLmdycG'
    'MuZ2F0ZXdheS5wcm90b2NfZ2VuX29wZW5hcGl2Mi5vcHRpb25zLkluZm9SBGluZm8SEgoEaG9z'
    'dBgDIAEoCVIEaG9zdBIbCgliYXNlX3BhdGgYBCABKAlSCGJhc2VQYXRoEksKB3NjaGVtZXMYBS'
    'ADKA4yMS5ncnBjLmdhdGV3YXkucHJvdG9jX2dlbl9vcGVuYXBpdjIub3B0aW9ucy5TY2hlbWVS'
    'B3NjaGVtZXMSGgoIY29uc3VtZXMYBiADKAlSCGNvbnN1bWVzEhoKCHByb2R1Y2VzGAcgAygJUg'
    'hwcm9kdWNlcxJfCglyZXNwb25zZXMYCiADKAsyQS5ncnBjLmdhdGV3YXkucHJvdG9jX2dlbl9v'
    'cGVuYXBpdjIub3B0aW9ucy5Td2FnZ2VyLlJlc3BvbnNlc0VudHJ5UglyZXNwb25zZXMScQoUc2'
    'VjdXJpdHlfZGVmaW5pdGlvbnMYCyABKAsyPi5ncnBjLmdhdGV3YXkucHJvdG9jX2dlbl9vcGVu'
    'YXBpdjIub3B0aW9ucy5TZWN1cml0eURlZmluaXRpb25zUhNzZWN1cml0eURlZmluaXRpb25zEl'
    'oKCHNlY3VyaXR5GAwgAygLMj4uZ3JwYy5nYXRld2F5LnByb3RvY19nZW5fb3BlbmFwaXYyLm9w'
    'dGlvbnMuU2VjdXJpdHlSZXF1aXJlbWVudFIIc2VjdXJpdHkSQgoEdGFncxgNIAMoCzIuLmdycG'
    'MuZ2F0ZXdheS5wcm90b2NfZ2VuX29wZW5hcGl2Mi5vcHRpb25zLlRhZ1IEdGFncxJlCg1leHRl'
    'cm5hbF9kb2NzGA4gASgLMkAuZ3JwYy5nYXRld2F5LnByb3RvY19nZW5fb3BlbmFwaXYyLm9wdG'
    'lvbnMuRXh0ZXJuYWxEb2N1bWVudGF0aW9uUgxleHRlcm5hbERvY3MSYgoKZXh0ZW5zaW9ucxgP'
    'IAMoCzJCLmdycGMuZ2F0ZXdheS5wcm90b2NfZ2VuX29wZW5hcGl2Mi5vcHRpb25zLlN3YWdnZX'
    'IuRXh0ZW5zaW9uc0VudHJ5UgpleHRlbnNpb25zGnEKDlJlc3BvbnNlc0VudHJ5EhAKA2tleRgB'
    'IAEoCVIDa2V5EkkKBXZhbHVlGAIgASgLMjMuZ3JwYy5nYXRld2F5LnByb3RvY19nZW5fb3Blbm'
    'FwaXYyLm9wdGlvbnMuUmVzcG9uc2VSBXZhbHVlOgI4ARpVCg9FeHRlbnNpb25zRW50cnkSEAoD'
    'a2V5GAEgASgJUgNrZXkSLAoFdmFsdWUYAiABKAsyFi5nb29nbGUucHJvdG9idWYuVmFsdWVSBX'
    'ZhbHVlOgI4AUoECAgQCUoECAkQCg==');

@$core.Deprecated('Use operationDescriptor instead')
const Operation$json = {
  '1': 'Operation',
  '2': [
    {'1': 'tags', '3': 1, '4': 3, '5': 9, '10': 'tags'},
    {'1': 'summary', '3': 2, '4': 1, '5': 9, '10': 'summary'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'external_docs', '3': 4, '4': 1, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.ExternalDocumentation', '10': 'externalDocs'},
    {'1': 'operation_id', '3': 5, '4': 1, '5': 9, '10': 'operationId'},
    {'1': 'consumes', '3': 6, '4': 3, '5': 9, '10': 'consumes'},
    {'1': 'produces', '3': 7, '4': 3, '5': 9, '10': 'produces'},
    {'1': 'responses', '3': 9, '4': 3, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.Operation.ResponsesEntry', '10': 'responses'},
    {'1': 'schemes', '3': 10, '4': 3, '5': 14, '6': '.grpc.gateway.protoc_gen_openapiv2.options.Scheme', '10': 'schemes'},
    {'1': 'deprecated', '3': 11, '4': 1, '5': 8, '10': 'deprecated'},
    {'1': 'security', '3': 12, '4': 3, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.SecurityRequirement', '10': 'security'},
    {'1': 'extensions', '3': 13, '4': 3, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.Operation.ExtensionsEntry', '10': 'extensions'},
    {'1': 'parameters', '3': 14, '4': 1, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.Parameters', '10': 'parameters'},
  ],
  '3': [Operation_ResponsesEntry$json, Operation_ExtensionsEntry$json],
  '9': [
    {'1': 8, '2': 9},
  ],
};

@$core.Deprecated('Use operationDescriptor instead')
const Operation_ResponsesEntry$json = {
  '1': 'ResponsesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.Response', '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use operationDescriptor instead')
const Operation_ExtensionsEntry$json = {
  '1': 'ExtensionsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Value', '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `Operation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List operationDescriptor = $convert.base64Decode(
    'CglPcGVyYXRpb24SEgoEdGFncxgBIAMoCVIEdGFncxIYCgdzdW1tYXJ5GAIgASgJUgdzdW1tYX'
    'J5EiAKC2Rlc2NyaXB0aW9uGAMgASgJUgtkZXNjcmlwdGlvbhJlCg1leHRlcm5hbF9kb2NzGAQg'
    'ASgLMkAuZ3JwYy5nYXRld2F5LnByb3RvY19nZW5fb3BlbmFwaXYyLm9wdGlvbnMuRXh0ZXJuYW'
    'xEb2N1bWVudGF0aW9uUgxleHRlcm5hbERvY3MSIQoMb3BlcmF0aW9uX2lkGAUgASgJUgtvcGVy'
    'YXRpb25JZBIaCghjb25zdW1lcxgGIAMoCVIIY29uc3VtZXMSGgoIcHJvZHVjZXMYByADKAlSCH'
    'Byb2R1Y2VzEmEKCXJlc3BvbnNlcxgJIAMoCzJDLmdycGMuZ2F0ZXdheS5wcm90b2NfZ2VuX29w'
    'ZW5hcGl2Mi5vcHRpb25zLk9wZXJhdGlvbi5SZXNwb25zZXNFbnRyeVIJcmVzcG9uc2VzEksKB3'
    'NjaGVtZXMYCiADKA4yMS5ncnBjLmdhdGV3YXkucHJvdG9jX2dlbl9vcGVuYXBpdjIub3B0aW9u'
    'cy5TY2hlbWVSB3NjaGVtZXMSHgoKZGVwcmVjYXRlZBgLIAEoCFIKZGVwcmVjYXRlZBJaCghzZW'
    'N1cml0eRgMIAMoCzI+LmdycGMuZ2F0ZXdheS5wcm90b2NfZ2VuX29wZW5hcGl2Mi5vcHRpb25z'
    'LlNlY3VyaXR5UmVxdWlyZW1lbnRSCHNlY3VyaXR5EmQKCmV4dGVuc2lvbnMYDSADKAsyRC5ncn'
    'BjLmdhdGV3YXkucHJvdG9jX2dlbl9vcGVuYXBpdjIub3B0aW9ucy5PcGVyYXRpb24uRXh0ZW5z'
    'aW9uc0VudHJ5UgpleHRlbnNpb25zElUKCnBhcmFtZXRlcnMYDiABKAsyNS5ncnBjLmdhdGV3YX'
    'kucHJvdG9jX2dlbl9vcGVuYXBpdjIub3B0aW9ucy5QYXJhbWV0ZXJzUgpwYXJhbWV0ZXJzGnEK'
    'DlJlc3BvbnNlc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EkkKBXZhbHVlGAIgASgLMjMuZ3JwYy'
    '5nYXRld2F5LnByb3RvY19nZW5fb3BlbmFwaXYyLm9wdGlvbnMuUmVzcG9uc2VSBXZhbHVlOgI4'
    'ARpVCg9FeHRlbnNpb25zRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSLAoFdmFsdWUYAiABKAsyFi'
    '5nb29nbGUucHJvdG9idWYuVmFsdWVSBXZhbHVlOgI4AUoECAgQCQ==');

@$core.Deprecated('Use parametersDescriptor instead')
const Parameters$json = {
  '1': 'Parameters',
  '2': [
    {'1': 'headers', '3': 1, '4': 3, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.HeaderParameter', '10': 'headers'},
  ],
};

/// Descriptor for `Parameters`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List parametersDescriptor = $convert.base64Decode(
    'CgpQYXJhbWV0ZXJzElQKB2hlYWRlcnMYASADKAsyOi5ncnBjLmdhdGV3YXkucHJvdG9jX2dlbl'
    '9vcGVuYXBpdjIub3B0aW9ucy5IZWFkZXJQYXJhbWV0ZXJSB2hlYWRlcnM=');

@$core.Deprecated('Use headerParameterDescriptor instead')
const HeaderParameter$json = {
  '1': 'HeaderParameter',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.grpc.gateway.protoc_gen_openapiv2.options.HeaderParameter.Type', '10': 'type'},
    {'1': 'format', '3': 4, '4': 1, '5': 9, '10': 'format'},
    {'1': 'required', '3': 5, '4': 1, '5': 8, '10': 'required'},
  ],
  '4': [HeaderParameter_Type$json],
  '9': [
    {'1': 6, '2': 7},
    {'1': 7, '2': 8},
  ],
};

@$core.Deprecated('Use headerParameterDescriptor instead')
const HeaderParameter_Type$json = {
  '1': 'Type',
  '2': [
    {'1': 'UNKNOWN', '2': 0},
    {'1': 'STRING', '2': 1},
    {'1': 'NUMBER', '2': 2},
    {'1': 'INTEGER', '2': 3},
    {'1': 'BOOLEAN', '2': 4},
  ],
};

/// Descriptor for `HeaderParameter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List headerParameterDescriptor = $convert.base64Decode(
    'Cg9IZWFkZXJQYXJhbWV0ZXISEgoEbmFtZRgBIAEoCVIEbmFtZRIgCgtkZXNjcmlwdGlvbhgCIA'
    'EoCVILZGVzY3JpcHRpb24SUwoEdHlwZRgDIAEoDjI/LmdycGMuZ2F0ZXdheS5wcm90b2NfZ2Vu'
    'X29wZW5hcGl2Mi5vcHRpb25zLkhlYWRlclBhcmFtZXRlci5UeXBlUgR0eXBlEhYKBmZvcm1hdB'
    'gEIAEoCVIGZm9ybWF0EhoKCHJlcXVpcmVkGAUgASgIUghyZXF1aXJlZCJFCgRUeXBlEgsKB1VO'
    'S05PV04QABIKCgZTVFJJTkcQARIKCgZOVU1CRVIQAhILCgdJTlRFR0VSEAMSCwoHQk9PTEVBTh'
    'AESgQIBhAHSgQIBxAI');

@$core.Deprecated('Use headerDescriptor instead')
const Header$json = {
  '1': 'Header',
  '2': [
    {'1': 'description', '3': 1, '4': 1, '5': 9, '10': 'description'},
    {'1': 'type', '3': 2, '4': 1, '5': 9, '10': 'type'},
    {'1': 'format', '3': 3, '4': 1, '5': 9, '10': 'format'},
    {'1': 'default', '3': 6, '4': 1, '5': 9, '10': 'default'},
    {'1': 'pattern', '3': 13, '4': 1, '5': 9, '10': 'pattern'},
  ],
  '9': [
    {'1': 4, '2': 5},
    {'1': 5, '2': 6},
    {'1': 7, '2': 8},
    {'1': 8, '2': 9},
    {'1': 9, '2': 10},
    {'1': 10, '2': 11},
    {'1': 11, '2': 12},
    {'1': 12, '2': 13},
    {'1': 14, '2': 15},
    {'1': 15, '2': 16},
    {'1': 16, '2': 17},
    {'1': 17, '2': 18},
    {'1': 18, '2': 19},
  ],
};

/// Descriptor for `Header`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List headerDescriptor = $convert.base64Decode(
    'CgZIZWFkZXISIAoLZGVzY3JpcHRpb24YASABKAlSC2Rlc2NyaXB0aW9uEhIKBHR5cGUYAiABKA'
    'lSBHR5cGUSFgoGZm9ybWF0GAMgASgJUgZmb3JtYXQSGAoHZGVmYXVsdBgGIAEoCVIHZGVmYXVs'
    'dBIYCgdwYXR0ZXJuGA0gASgJUgdwYXR0ZXJuSgQIBBAFSgQIBRAGSgQIBxAISgQICBAJSgQICR'
    'AKSgQIChALSgQICxAMSgQIDBANSgQIDhAPSgQIDxAQSgQIEBARSgQIERASSgQIEhAT');

@$core.Deprecated('Use responseDescriptor instead')
const Response$json = {
  '1': 'Response',
  '2': [
    {'1': 'description', '3': 1, '4': 1, '5': 9, '10': 'description'},
    {'1': 'schema', '3': 2, '4': 1, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.Schema', '10': 'schema'},
    {'1': 'headers', '3': 3, '4': 3, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.Response.HeadersEntry', '10': 'headers'},
    {'1': 'examples', '3': 4, '4': 3, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.Response.ExamplesEntry', '10': 'examples'},
    {'1': 'extensions', '3': 5, '4': 3, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.Response.ExtensionsEntry', '10': 'extensions'},
  ],
  '3': [Response_HeadersEntry$json, Response_ExamplesEntry$json, Response_ExtensionsEntry$json],
};

@$core.Deprecated('Use responseDescriptor instead')
const Response_HeadersEntry$json = {
  '1': 'HeadersEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.Header', '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use responseDescriptor instead')
const Response_ExamplesEntry$json = {
  '1': 'ExamplesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use responseDescriptor instead')
const Response_ExtensionsEntry$json = {
  '1': 'ExtensionsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Value', '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseDescriptor = $convert.base64Decode(
    'CghSZXNwb25zZRIgCgtkZXNjcmlwdGlvbhgBIAEoCVILZGVzY3JpcHRpb24SSQoGc2NoZW1hGA'
    'IgASgLMjEuZ3JwYy5nYXRld2F5LnByb3RvY19nZW5fb3BlbmFwaXYyLm9wdGlvbnMuU2NoZW1h'
    'UgZzY2hlbWESWgoHaGVhZGVycxgDIAMoCzJALmdycGMuZ2F0ZXdheS5wcm90b2NfZ2VuX29wZW'
    '5hcGl2Mi5vcHRpb25zLlJlc3BvbnNlLkhlYWRlcnNFbnRyeVIHaGVhZGVycxJdCghleGFtcGxl'
    'cxgEIAMoCzJBLmdycGMuZ2F0ZXdheS5wcm90b2NfZ2VuX29wZW5hcGl2Mi5vcHRpb25zLlJlc3'
    'BvbnNlLkV4YW1wbGVzRW50cnlSCGV4YW1wbGVzEmMKCmV4dGVuc2lvbnMYBSADKAsyQy5ncnBj'
    'LmdhdGV3YXkucHJvdG9jX2dlbl9vcGVuYXBpdjIub3B0aW9ucy5SZXNwb25zZS5FeHRlbnNpb2'
    '5zRW50cnlSCmV4dGVuc2lvbnMabQoMSGVhZGVyc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EkcK'
    'BXZhbHVlGAIgASgLMjEuZ3JwYy5nYXRld2F5LnByb3RvY19nZW5fb3BlbmFwaXYyLm9wdGlvbn'
    'MuSGVhZGVyUgV2YWx1ZToCOAEaOwoNRXhhbXBsZXNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIU'
    'CgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgBGlUKD0V4dGVuc2lvbnNFbnRyeRIQCgNrZXkYASABKA'
    'lSA2tleRIsCgV2YWx1ZRgCIAEoCzIWLmdvb2dsZS5wcm90b2J1Zi5WYWx1ZVIFdmFsdWU6AjgB');

@$core.Deprecated('Use infoDescriptor instead')
const Info$json = {
  '1': 'Info',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    {'1': 'terms_of_service', '3': 3, '4': 1, '5': 9, '10': 'termsOfService'},
    {'1': 'contact', '3': 4, '4': 1, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.Contact', '10': 'contact'},
    {'1': 'license', '3': 5, '4': 1, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.License', '10': 'license'},
    {'1': 'version', '3': 6, '4': 1, '5': 9, '10': 'version'},
    {'1': 'extensions', '3': 7, '4': 3, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.Info.ExtensionsEntry', '10': 'extensions'},
  ],
  '3': [Info_ExtensionsEntry$json],
};

@$core.Deprecated('Use infoDescriptor instead')
const Info_ExtensionsEntry$json = {
  '1': 'ExtensionsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Value', '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `Info`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List infoDescriptor = $convert.base64Decode(
    'CgRJbmZvEhQKBXRpdGxlGAEgASgJUgV0aXRsZRIgCgtkZXNjcmlwdGlvbhgCIAEoCVILZGVzY3'
    'JpcHRpb24SKAoQdGVybXNfb2Zfc2VydmljZRgDIAEoCVIOdGVybXNPZlNlcnZpY2USTAoHY29u'
    'dGFjdBgEIAEoCzIyLmdycGMuZ2F0ZXdheS5wcm90b2NfZ2VuX29wZW5hcGl2Mi5vcHRpb25zLk'
    'NvbnRhY3RSB2NvbnRhY3QSTAoHbGljZW5zZRgFIAEoCzIyLmdycGMuZ2F0ZXdheS5wcm90b2Nf'
    'Z2VuX29wZW5hcGl2Mi5vcHRpb25zLkxpY2Vuc2VSB2xpY2Vuc2USGAoHdmVyc2lvbhgGIAEoCV'
    'IHdmVyc2lvbhJfCgpleHRlbnNpb25zGAcgAygLMj8uZ3JwYy5nYXRld2F5LnByb3RvY19nZW5f'
    'b3BlbmFwaXYyLm9wdGlvbnMuSW5mby5FeHRlbnNpb25zRW50cnlSCmV4dGVuc2lvbnMaVQoPRX'
    'h0ZW5zaW9uc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EiwKBXZhbHVlGAIgASgLMhYuZ29vZ2xl'
    'LnByb3RvYnVmLlZhbHVlUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use contactDescriptor instead')
const Contact$json = {
  '1': 'Contact',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'url', '3': 2, '4': 1, '5': 9, '10': 'url'},
    {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `Contact`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contactDescriptor = $convert.base64Decode(
    'CgdDb250YWN0EhIKBG5hbWUYASABKAlSBG5hbWUSEAoDdXJsGAIgASgJUgN1cmwSFAoFZW1haW'
    'wYAyABKAlSBWVtYWls');

@$core.Deprecated('Use licenseDescriptor instead')
const License$json = {
  '1': 'License',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'url', '3': 2, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `License`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List licenseDescriptor = $convert.base64Decode(
    'CgdMaWNlbnNlEhIKBG5hbWUYASABKAlSBG5hbWUSEAoDdXJsGAIgASgJUgN1cmw=');

@$core.Deprecated('Use externalDocumentationDescriptor instead')
const ExternalDocumentation$json = {
  '1': 'ExternalDocumentation',
  '2': [
    {'1': 'description', '3': 1, '4': 1, '5': 9, '10': 'description'},
    {'1': 'url', '3': 2, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `ExternalDocumentation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List externalDocumentationDescriptor = $convert.base64Decode(
    'ChVFeHRlcm5hbERvY3VtZW50YXRpb24SIAoLZGVzY3JpcHRpb24YASABKAlSC2Rlc2NyaXB0aW'
    '9uEhAKA3VybBgCIAEoCVIDdXJs');

@$core.Deprecated('Use schemaDescriptor instead')
const Schema$json = {
  '1': 'Schema',
  '2': [
    {'1': 'json_schema', '3': 1, '4': 1, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.JSONSchema', '10': 'jsonSchema'},
    {'1': 'discriminator', '3': 2, '4': 1, '5': 9, '10': 'discriminator'},
    {'1': 'read_only', '3': 3, '4': 1, '5': 8, '10': 'readOnly'},
    {'1': 'external_docs', '3': 5, '4': 1, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.ExternalDocumentation', '10': 'externalDocs'},
    {'1': 'example', '3': 6, '4': 1, '5': 9, '10': 'example'},
  ],
  '9': [
    {'1': 4, '2': 5},
  ],
};

/// Descriptor for `Schema`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List schemaDescriptor = $convert.base64Decode(
    'CgZTY2hlbWESVgoLanNvbl9zY2hlbWEYASABKAsyNS5ncnBjLmdhdGV3YXkucHJvdG9jX2dlbl'
    '9vcGVuYXBpdjIub3B0aW9ucy5KU09OU2NoZW1hUgpqc29uU2NoZW1hEiQKDWRpc2NyaW1pbmF0'
    'b3IYAiABKAlSDWRpc2NyaW1pbmF0b3ISGwoJcmVhZF9vbmx5GAMgASgIUghyZWFkT25seRJlCg'
    '1leHRlcm5hbF9kb2NzGAUgASgLMkAuZ3JwYy5nYXRld2F5LnByb3RvY19nZW5fb3BlbmFwaXYy'
    'Lm9wdGlvbnMuRXh0ZXJuYWxEb2N1bWVudGF0aW9uUgxleHRlcm5hbERvY3MSGAoHZXhhbXBsZR'
    'gGIAEoCVIHZXhhbXBsZUoECAQQBQ==');

@$core.Deprecated('Use enumSchemaDescriptor instead')
const EnumSchema$json = {
  '1': 'EnumSchema',
  '2': [
    {'1': 'description', '3': 1, '4': 1, '5': 9, '10': 'description'},
    {'1': 'default', '3': 2, '4': 1, '5': 9, '10': 'default'},
    {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    {'1': 'required', '3': 4, '4': 1, '5': 8, '10': 'required'},
    {'1': 'read_only', '3': 5, '4': 1, '5': 8, '10': 'readOnly'},
    {'1': 'external_docs', '3': 6, '4': 1, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.ExternalDocumentation', '10': 'externalDocs'},
    {'1': 'example', '3': 7, '4': 1, '5': 9, '10': 'example'},
    {'1': 'ref', '3': 8, '4': 1, '5': 9, '10': 'ref'},
    {'1': 'extensions', '3': 9, '4': 3, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.EnumSchema.ExtensionsEntry', '10': 'extensions'},
  ],
  '3': [EnumSchema_ExtensionsEntry$json],
};

@$core.Deprecated('Use enumSchemaDescriptor instead')
const EnumSchema_ExtensionsEntry$json = {
  '1': 'ExtensionsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Value', '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `EnumSchema`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List enumSchemaDescriptor = $convert.base64Decode(
    'CgpFbnVtU2NoZW1hEiAKC2Rlc2NyaXB0aW9uGAEgASgJUgtkZXNjcmlwdGlvbhIYCgdkZWZhdW'
    'x0GAIgASgJUgdkZWZhdWx0EhQKBXRpdGxlGAMgASgJUgV0aXRsZRIaCghyZXF1aXJlZBgEIAEo'
    'CFIIcmVxdWlyZWQSGwoJcmVhZF9vbmx5GAUgASgIUghyZWFkT25seRJlCg1leHRlcm5hbF9kb2'
    'NzGAYgASgLMkAuZ3JwYy5nYXRld2F5LnByb3RvY19nZW5fb3BlbmFwaXYyLm9wdGlvbnMuRXh0'
    'ZXJuYWxEb2N1bWVudGF0aW9uUgxleHRlcm5hbERvY3MSGAoHZXhhbXBsZRgHIAEoCVIHZXhhbX'
    'BsZRIQCgNyZWYYCCABKAlSA3JlZhJlCgpleHRlbnNpb25zGAkgAygLMkUuZ3JwYy5nYXRld2F5'
    'LnByb3RvY19nZW5fb3BlbmFwaXYyLm9wdGlvbnMuRW51bVNjaGVtYS5FeHRlbnNpb25zRW50cn'
    'lSCmV4dGVuc2lvbnMaVQoPRXh0ZW5zaW9uc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EiwKBXZh'
    'bHVlGAIgASgLMhYuZ29vZ2xlLnByb3RvYnVmLlZhbHVlUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use jSONSchemaDescriptor instead')
const JSONSchema$json = {
  '1': 'JSONSchema',
  '2': [
    {'1': 'ref', '3': 3, '4': 1, '5': 9, '10': 'ref'},
    {'1': 'title', '3': 5, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 6, '4': 1, '5': 9, '10': 'description'},
    {'1': 'default', '3': 7, '4': 1, '5': 9, '10': 'default'},
    {'1': 'read_only', '3': 8, '4': 1, '5': 8, '10': 'readOnly'},
    {'1': 'example', '3': 9, '4': 1, '5': 9, '10': 'example'},
    {'1': 'multiple_of', '3': 10, '4': 1, '5': 1, '10': 'multipleOf'},
    {'1': 'maximum', '3': 11, '4': 1, '5': 1, '10': 'maximum'},
    {'1': 'exclusive_maximum', '3': 12, '4': 1, '5': 8, '10': 'exclusiveMaximum'},
    {'1': 'minimum', '3': 13, '4': 1, '5': 1, '10': 'minimum'},
    {'1': 'exclusive_minimum', '3': 14, '4': 1, '5': 8, '10': 'exclusiveMinimum'},
    {'1': 'max_length', '3': 15, '4': 1, '5': 4, '10': 'maxLength'},
    {'1': 'min_length', '3': 16, '4': 1, '5': 4, '10': 'minLength'},
    {'1': 'pattern', '3': 17, '4': 1, '5': 9, '10': 'pattern'},
    {'1': 'max_items', '3': 20, '4': 1, '5': 4, '10': 'maxItems'},
    {'1': 'min_items', '3': 21, '4': 1, '5': 4, '10': 'minItems'},
    {'1': 'unique_items', '3': 22, '4': 1, '5': 8, '10': 'uniqueItems'},
    {'1': 'max_properties', '3': 24, '4': 1, '5': 4, '10': 'maxProperties'},
    {'1': 'min_properties', '3': 25, '4': 1, '5': 4, '10': 'minProperties'},
    {'1': 'required', '3': 26, '4': 3, '5': 9, '10': 'required'},
    {'1': 'array', '3': 34, '4': 3, '5': 9, '10': 'array'},
    {'1': 'type', '3': 35, '4': 3, '5': 14, '6': '.grpc.gateway.protoc_gen_openapiv2.options.JSONSchema.JSONSchemaSimpleTypes', '10': 'type'},
    {'1': 'format', '3': 36, '4': 1, '5': 9, '10': 'format'},
    {'1': 'enum', '3': 46, '4': 3, '5': 9, '10': 'enum'},
    {'1': 'field_configuration', '3': 1001, '4': 1, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.JSONSchema.FieldConfiguration', '10': 'fieldConfiguration'},
    {'1': 'extensions', '3': 48, '4': 3, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.JSONSchema.ExtensionsEntry', '10': 'extensions'},
  ],
  '3': [JSONSchema_FieldConfiguration$json, JSONSchema_ExtensionsEntry$json],
  '4': [JSONSchema_JSONSchemaSimpleTypes$json],
  '9': [
    {'1': 1, '2': 2},
    {'1': 2, '2': 3},
    {'1': 4, '2': 5},
    {'1': 18, '2': 19},
    {'1': 19, '2': 20},
    {'1': 23, '2': 24},
    {'1': 27, '2': 28},
    {'1': 28, '2': 29},
    {'1': 29, '2': 30},
    {'1': 30, '2': 34},
    {'1': 37, '2': 42},
    {'1': 42, '2': 43},
    {'1': 43, '2': 46},
  ],
};

@$core.Deprecated('Use jSONSchemaDescriptor instead')
const JSONSchema_FieldConfiguration$json = {
  '1': 'FieldConfiguration',
  '2': [
    {'1': 'path_param_name', '3': 47, '4': 1, '5': 9, '10': 'pathParamName'},
  ],
};

@$core.Deprecated('Use jSONSchemaDescriptor instead')
const JSONSchema_ExtensionsEntry$json = {
  '1': 'ExtensionsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Value', '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use jSONSchemaDescriptor instead')
const JSONSchema_JSONSchemaSimpleTypes$json = {
  '1': 'JSONSchemaSimpleTypes',
  '2': [
    {'1': 'UNKNOWN', '2': 0},
    {'1': 'ARRAY', '2': 1},
    {'1': 'BOOLEAN', '2': 2},
    {'1': 'INTEGER', '2': 3},
    {'1': 'NULL', '2': 4},
    {'1': 'NUMBER', '2': 5},
    {'1': 'OBJECT', '2': 6},
    {'1': 'STRING', '2': 7},
  ],
};

/// Descriptor for `JSONSchema`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List jSONSchemaDescriptor = $convert.base64Decode(
    'CgpKU09OU2NoZW1hEhAKA3JlZhgDIAEoCVIDcmVmEhQKBXRpdGxlGAUgASgJUgV0aXRsZRIgCg'
    'tkZXNjcmlwdGlvbhgGIAEoCVILZGVzY3JpcHRpb24SGAoHZGVmYXVsdBgHIAEoCVIHZGVmYXVs'
    'dBIbCglyZWFkX29ubHkYCCABKAhSCHJlYWRPbmx5EhgKB2V4YW1wbGUYCSABKAlSB2V4YW1wbG'
    'USHwoLbXVsdGlwbGVfb2YYCiABKAFSCm11bHRpcGxlT2YSGAoHbWF4aW11bRgLIAEoAVIHbWF4'
    'aW11bRIrChFleGNsdXNpdmVfbWF4aW11bRgMIAEoCFIQZXhjbHVzaXZlTWF4aW11bRIYCgdtaW'
    '5pbXVtGA0gASgBUgdtaW5pbXVtEisKEWV4Y2x1c2l2ZV9taW5pbXVtGA4gASgIUhBleGNsdXNp'
    'dmVNaW5pbXVtEh0KCm1heF9sZW5ndGgYDyABKARSCW1heExlbmd0aBIdCgptaW5fbGVuZ3RoGB'
    'AgASgEUgltaW5MZW5ndGgSGAoHcGF0dGVybhgRIAEoCVIHcGF0dGVybhIbCgltYXhfaXRlbXMY'
    'FCABKARSCG1heEl0ZW1zEhsKCW1pbl9pdGVtcxgVIAEoBFIIbWluSXRlbXMSIQoMdW5pcXVlX2'
    'l0ZW1zGBYgASgIUgt1bmlxdWVJdGVtcxIlCg5tYXhfcHJvcGVydGllcxgYIAEoBFINbWF4UHJv'
    'cGVydGllcxIlCg5taW5fcHJvcGVydGllcxgZIAEoBFINbWluUHJvcGVydGllcxIaCghyZXF1aX'
    'JlZBgaIAMoCVIIcmVxdWlyZWQSFAoFYXJyYXkYIiADKAlSBWFycmF5El8KBHR5cGUYIyADKA4y'
    'Sy5ncnBjLmdhdGV3YXkucHJvdG9jX2dlbl9vcGVuYXBpdjIub3B0aW9ucy5KU09OU2NoZW1hLk'
    'pTT05TY2hlbWFTaW1wbGVUeXBlc1IEdHlwZRIWCgZmb3JtYXQYJCABKAlSBmZvcm1hdBISCgRl'
    'bnVtGC4gAygJUgRlbnVtEnoKE2ZpZWxkX2NvbmZpZ3VyYXRpb24Y6QcgASgLMkguZ3JwYy5nYX'
    'Rld2F5LnByb3RvY19nZW5fb3BlbmFwaXYyLm9wdGlvbnMuSlNPTlNjaGVtYS5GaWVsZENvbmZp'
    'Z3VyYXRpb25SEmZpZWxkQ29uZmlndXJhdGlvbhJlCgpleHRlbnNpb25zGDAgAygLMkUuZ3JwYy'
    '5nYXRld2F5LnByb3RvY19nZW5fb3BlbmFwaXYyLm9wdGlvbnMuSlNPTlNjaGVtYS5FeHRlbnNp'
    'b25zRW50cnlSCmV4dGVuc2lvbnMaPAoSRmllbGRDb25maWd1cmF0aW9uEiYKD3BhdGhfcGFyYW'
    '1fbmFtZRgvIAEoCVINcGF0aFBhcmFtTmFtZRpVCg9FeHRlbnNpb25zRW50cnkSEAoDa2V5GAEg'
    'ASgJUgNrZXkSLAoFdmFsdWUYAiABKAsyFi5nb29nbGUucHJvdG9idWYuVmFsdWVSBXZhbHVlOg'
    'I4ASJ3ChVKU09OU2NoZW1hU2ltcGxlVHlwZXMSCwoHVU5LTk9XThAAEgkKBUFSUkFZEAESCwoH'
    'Qk9PTEVBThACEgsKB0lOVEVHRVIQAxIICgROVUxMEAQSCgoGTlVNQkVSEAUSCgoGT0JKRUNUEA'
    'YSCgoGU1RSSU5HEAdKBAgBEAJKBAgCEANKBAgEEAVKBAgSEBNKBAgTEBRKBAgXEBhKBAgbEBxK'
    'BAgcEB1KBAgdEB5KBAgeECJKBAglECpKBAgqECtKBAgrEC4=');

@$core.Deprecated('Use tagDescriptor instead')
const Tag$json = {
  '1': 'Tag',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    {'1': 'external_docs', '3': 3, '4': 1, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.ExternalDocumentation', '10': 'externalDocs'},
    {'1': 'extensions', '3': 4, '4': 3, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.Tag.ExtensionsEntry', '10': 'extensions'},
  ],
  '3': [Tag_ExtensionsEntry$json],
};

@$core.Deprecated('Use tagDescriptor instead')
const Tag_ExtensionsEntry$json = {
  '1': 'ExtensionsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Value', '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `Tag`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tagDescriptor = $convert.base64Decode(
    'CgNUYWcSEgoEbmFtZRgBIAEoCVIEbmFtZRIgCgtkZXNjcmlwdGlvbhgCIAEoCVILZGVzY3JpcH'
    'Rpb24SZQoNZXh0ZXJuYWxfZG9jcxgDIAEoCzJALmdycGMuZ2F0ZXdheS5wcm90b2NfZ2VuX29w'
    'ZW5hcGl2Mi5vcHRpb25zLkV4dGVybmFsRG9jdW1lbnRhdGlvblIMZXh0ZXJuYWxEb2NzEl4KCm'
    'V4dGVuc2lvbnMYBCADKAsyPi5ncnBjLmdhdGV3YXkucHJvdG9jX2dlbl9vcGVuYXBpdjIub3B0'
    'aW9ucy5UYWcuRXh0ZW5zaW9uc0VudHJ5UgpleHRlbnNpb25zGlUKD0V4dGVuc2lvbnNFbnRyeR'
    'IQCgNrZXkYASABKAlSA2tleRIsCgV2YWx1ZRgCIAEoCzIWLmdvb2dsZS5wcm90b2J1Zi5WYWx1'
    'ZVIFdmFsdWU6AjgB');

@$core.Deprecated('Use securityDefinitionsDescriptor instead')
const SecurityDefinitions$json = {
  '1': 'SecurityDefinitions',
  '2': [
    {'1': 'security', '3': 1, '4': 3, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.SecurityDefinitions.SecurityEntry', '10': 'security'},
  ],
  '3': [SecurityDefinitions_SecurityEntry$json],
};

@$core.Deprecated('Use securityDefinitionsDescriptor instead')
const SecurityDefinitions_SecurityEntry$json = {
  '1': 'SecurityEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.SecurityScheme', '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `SecurityDefinitions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List securityDefinitionsDescriptor = $convert.base64Decode(
    'ChNTZWN1cml0eURlZmluaXRpb25zEmgKCHNlY3VyaXR5GAEgAygLMkwuZ3JwYy5nYXRld2F5Ln'
    'Byb3RvY19nZW5fb3BlbmFwaXYyLm9wdGlvbnMuU2VjdXJpdHlEZWZpbml0aW9ucy5TZWN1cml0'
    'eUVudHJ5UghzZWN1cml0eRp2Cg1TZWN1cml0eUVudHJ5EhAKA2tleRgBIAEoCVIDa2V5Ek8KBX'
    'ZhbHVlGAIgASgLMjkuZ3JwYy5nYXRld2F5LnByb3RvY19nZW5fb3BlbmFwaXYyLm9wdGlvbnMu'
    'U2VjdXJpdHlTY2hlbWVSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use securitySchemeDescriptor instead')
const SecurityScheme$json = {
  '1': 'SecurityScheme',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.grpc.gateway.protoc_gen_openapiv2.options.SecurityScheme.Type', '10': 'type'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'in', '3': 4, '4': 1, '5': 14, '6': '.grpc.gateway.protoc_gen_openapiv2.options.SecurityScheme.In', '10': 'in'},
    {'1': 'flow', '3': 5, '4': 1, '5': 14, '6': '.grpc.gateway.protoc_gen_openapiv2.options.SecurityScheme.Flow', '10': 'flow'},
    {'1': 'authorization_url', '3': 6, '4': 1, '5': 9, '10': 'authorizationUrl'},
    {'1': 'token_url', '3': 7, '4': 1, '5': 9, '10': 'tokenUrl'},
    {'1': 'scopes', '3': 8, '4': 1, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.Scopes', '10': 'scopes'},
    {'1': 'extensions', '3': 9, '4': 3, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.SecurityScheme.ExtensionsEntry', '10': 'extensions'},
  ],
  '3': [SecurityScheme_ExtensionsEntry$json],
  '4': [SecurityScheme_Type$json, SecurityScheme_In$json, SecurityScheme_Flow$json],
};

@$core.Deprecated('Use securitySchemeDescriptor instead')
const SecurityScheme_ExtensionsEntry$json = {
  '1': 'ExtensionsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Value', '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use securitySchemeDescriptor instead')
const SecurityScheme_Type$json = {
  '1': 'Type',
  '2': [
    {'1': 'TYPE_INVALID', '2': 0},
    {'1': 'TYPE_BASIC', '2': 1},
    {'1': 'TYPE_API_KEY', '2': 2},
    {'1': 'TYPE_OAUTH2', '2': 3},
  ],
};

@$core.Deprecated('Use securitySchemeDescriptor instead')
const SecurityScheme_In$json = {
  '1': 'In',
  '2': [
    {'1': 'IN_INVALID', '2': 0},
    {'1': 'IN_QUERY', '2': 1},
    {'1': 'IN_HEADER', '2': 2},
  ],
};

@$core.Deprecated('Use securitySchemeDescriptor instead')
const SecurityScheme_Flow$json = {
  '1': 'Flow',
  '2': [
    {'1': 'FLOW_INVALID', '2': 0},
    {'1': 'FLOW_IMPLICIT', '2': 1},
    {'1': 'FLOW_PASSWORD', '2': 2},
    {'1': 'FLOW_APPLICATION', '2': 3},
    {'1': 'FLOW_ACCESS_CODE', '2': 4},
  ],
};

/// Descriptor for `SecurityScheme`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List securitySchemeDescriptor = $convert.base64Decode(
    'Cg5TZWN1cml0eVNjaGVtZRJSCgR0eXBlGAEgASgOMj4uZ3JwYy5nYXRld2F5LnByb3RvY19nZW'
    '5fb3BlbmFwaXYyLm9wdGlvbnMuU2VjdXJpdHlTY2hlbWUuVHlwZVIEdHlwZRIgCgtkZXNjcmlw'
    'dGlvbhgCIAEoCVILZGVzY3JpcHRpb24SEgoEbmFtZRgDIAEoCVIEbmFtZRJMCgJpbhgEIAEoDj'
    'I8LmdycGMuZ2F0ZXdheS5wcm90b2NfZ2VuX29wZW5hcGl2Mi5vcHRpb25zLlNlY3VyaXR5U2No'
    'ZW1lLkluUgJpbhJSCgRmbG93GAUgASgOMj4uZ3JwYy5nYXRld2F5LnByb3RvY19nZW5fb3Blbm'
    'FwaXYyLm9wdGlvbnMuU2VjdXJpdHlTY2hlbWUuRmxvd1IEZmxvdxIrChFhdXRob3JpemF0aW9u'
    'X3VybBgGIAEoCVIQYXV0aG9yaXphdGlvblVybBIbCgl0b2tlbl91cmwYByABKAlSCHRva2VuVX'
    'JsEkkKBnNjb3BlcxgIIAEoCzIxLmdycGMuZ2F0ZXdheS5wcm90b2NfZ2VuX29wZW5hcGl2Mi5v'
    'cHRpb25zLlNjb3Blc1IGc2NvcGVzEmkKCmV4dGVuc2lvbnMYCSADKAsySS5ncnBjLmdhdGV3YX'
    'kucHJvdG9jX2dlbl9vcGVuYXBpdjIub3B0aW9ucy5TZWN1cml0eVNjaGVtZS5FeHRlbnNpb25z'
    'RW50cnlSCmV4dGVuc2lvbnMaVQoPRXh0ZW5zaW9uc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5Ei'
    'wKBXZhbHVlGAIgASgLMhYuZ29vZ2xlLnByb3RvYnVmLlZhbHVlUgV2YWx1ZToCOAEiSwoEVHlw'
    'ZRIQCgxUWVBFX0lOVkFMSUQQABIOCgpUWVBFX0JBU0lDEAESEAoMVFlQRV9BUElfS0VZEAISDw'
    'oLVFlQRV9PQVVUSDIQAyIxCgJJbhIOCgpJTl9JTlZBTElEEAASDAoISU5fUVVFUlkQARINCglJ'
    'Tl9IRUFERVIQAiJqCgRGbG93EhAKDEZMT1dfSU5WQUxJRBAAEhEKDUZMT1dfSU1QTElDSVQQAR'
    'IRCg1GTE9XX1BBU1NXT1JEEAISFAoQRkxPV19BUFBMSUNBVElPThADEhQKEEZMT1dfQUNDRVNT'
    'X0NPREUQBA==');

@$core.Deprecated('Use securityRequirementDescriptor instead')
const SecurityRequirement$json = {
  '1': 'SecurityRequirement',
  '2': [
    {'1': 'security_requirement', '3': 1, '4': 3, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.SecurityRequirement.SecurityRequirementEntry', '10': 'securityRequirement'},
  ],
  '3': [SecurityRequirement_SecurityRequirementValue$json, SecurityRequirement_SecurityRequirementEntry$json],
};

@$core.Deprecated('Use securityRequirementDescriptor instead')
const SecurityRequirement_SecurityRequirementValue$json = {
  '1': 'SecurityRequirementValue',
  '2': [
    {'1': 'scope', '3': 1, '4': 3, '5': 9, '10': 'scope'},
  ],
};

@$core.Deprecated('Use securityRequirementDescriptor instead')
const SecurityRequirement_SecurityRequirementEntry$json = {
  '1': 'SecurityRequirementEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.SecurityRequirement.SecurityRequirementValue', '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `SecurityRequirement`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List securityRequirementDescriptor = $convert.base64Decode(
    'ChNTZWN1cml0eVJlcXVpcmVtZW50EooBChRzZWN1cml0eV9yZXF1aXJlbWVudBgBIAMoCzJXLm'
    'dycGMuZ2F0ZXdheS5wcm90b2NfZ2VuX29wZW5hcGl2Mi5vcHRpb25zLlNlY3VyaXR5UmVxdWly'
    'ZW1lbnQuU2VjdXJpdHlSZXF1aXJlbWVudEVudHJ5UhNzZWN1cml0eVJlcXVpcmVtZW50GjAKGF'
    'NlY3VyaXR5UmVxdWlyZW1lbnRWYWx1ZRIUCgVzY29wZRgBIAMoCVIFc2NvcGUanwEKGFNlY3Vy'
    'aXR5UmVxdWlyZW1lbnRFbnRyeRIQCgNrZXkYASABKAlSA2tleRJtCgV2YWx1ZRgCIAEoCzJXLm'
    'dycGMuZ2F0ZXdheS5wcm90b2NfZ2VuX29wZW5hcGl2Mi5vcHRpb25zLlNlY3VyaXR5UmVxdWly'
    'ZW1lbnQuU2VjdXJpdHlSZXF1aXJlbWVudFZhbHVlUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use scopesDescriptor instead')
const Scopes$json = {
  '1': 'Scopes',
  '2': [
    {'1': 'scope', '3': 1, '4': 3, '5': 11, '6': '.grpc.gateway.protoc_gen_openapiv2.options.Scopes.ScopeEntry', '10': 'scope'},
  ],
  '3': [Scopes_ScopeEntry$json],
};

@$core.Deprecated('Use scopesDescriptor instead')
const Scopes_ScopeEntry$json = {
  '1': 'ScopeEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `Scopes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List scopesDescriptor = $convert.base64Decode(
    'CgZTY29wZXMSUgoFc2NvcGUYASADKAsyPC5ncnBjLmdhdGV3YXkucHJvdG9jX2dlbl9vcGVuYX'
    'BpdjIub3B0aW9ucy5TY29wZXMuU2NvcGVFbnRyeVIFc2NvcGUaOAoKU2NvcGVFbnRyeRIQCgNr'
    'ZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgB');

