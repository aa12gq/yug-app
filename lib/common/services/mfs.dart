import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:yug_app/config/mfs.dart';
import '../index.dart';

/// 文件引用信息
class FileReference {
  final String fsoId;
  final String path;
  final String filename;
  final int size;
  final String? mimeType;
  final DateTime createdAt;

  FileReference({
    required this.fsoId,
    required this.path,
    required this.filename,
    required this.size,
    this.mimeType,
    required this.createdAt,
  });

  factory FileReference.fromJson(Map<String, dynamic> json) {
    if (json is! Map<String, dynamic>) {
      throw Exception('Invalid JSON format');
    }

    // 处理 protobuf timestamp 格式
    DateTime parseTimestamp(Map<String, dynamic>? timestamp) {
      if (timestamp == null) return DateTime.now();
      final seconds = timestamp['seconds'] as int? ?? 0;
      final nanos = timestamp['nanos'] as int? ?? 0;
      return DateTime.fromMillisecondsSinceEpoch(
        seconds * 1000 + (nanos / 1000000).round(),
      );
    }

    return FileReference(
      fsoId: json['fso_id']?.toString() ?? '',
      path: json['path']?.toString() ?? '',
      filename: json['filename']?.toString() ?? '',
      size: json['size'] is int ? json['size'] : 0,
      mimeType: json['mime_type']?.toString(),
      createdAt: parseTimestamp(json['created_at'] as Map<String, dynamic>?),
    );
  }

  Map<String, dynamic> toJson() => {
        'fso_id': fsoId,
        'path': path,
        'filename': filename,
        'size': size,
        'mime_type': mimeType,
        'created_at': createdAt.toIso8601String(),
      };
}

class MfsService {
  static final MfsService _instance = MfsService._internal();
  factory MfsService() => _instance;
  MfsService._internal() {
    if (kDebugMode) {
      print('初始化 MFS 服务');
      MfsConfig.printUrls();
    }
  }

  final _dio = Dio(BaseOptions(
    baseUrl: MfsConfig.mfsBaseUrl,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  ));

  /// 单文件上传
  Future<FileReference> uploadFile({
    required File file,
    required String bucket,
    String? dir,
    String? uid,
    String permission = 'PUBLIC',
  }) async {
    try {
      final filename = file.path.split('/').last;
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(file.path, filename: filename),
      });

      if (kDebugMode) {
        print('开始上传文件');
        print('baseUrl: ${_dio.options.baseUrl}');
        print('完整请求URL: ${_dio.options.baseUrl}/v1/mfs/upload');
        print('实际使用的URL: http://vtyug.cn:3002/v1/mfs/upload');
        print(
            '参数: bucket=$bucket, dir=$dir, uid=$uid, permission=$permission, filename=$filename');
      }

      final response = await _dio.post(
        '/v1/mfs/upload',
        data: formData,
        queryParameters: {
          'bucket': bucket,
          if (dir != null) 'dir': dir,
          if (uid != null) 'uid': uid,
          'permission': permission,
          'filename': filename,
        },
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
          followRedirects: false,
          validateStatus: (status) => true,
        ),
      );

      if (kDebugMode) {
        print('服务器返回数据: ${response.data}');
      }

      if (response.data['code'] == 0) {
        return FileReference.fromJson(response.data['data']);
      } else {
        throw Exception(response.data['message'] ?? '上传失败');
      }
    } catch (e) {
      if (kDebugMode) {
        print('文件上传失败: $e');
      }
      rethrow;
    }
  }

  /// 批量文件上传
  Future<List<FileReference>> uploadFiles({
    required List<File> files,
    required String bucket,
    String? dir,
    String? uid,
    String permission = 'PUBLIC',
  }) async {
    if (files.isEmpty) {
      return [];
    }

    if (files.length > 5) {
      throw Exception('一次最多只能上传5个文件');
    }

    try {
      final formData = FormData();

      for (var file in files) {
        final filename = file.path.split('/').last;
        formData.files.addAll([
          MapEntry('files',
              await MultipartFile.fromFile(file.path, filename: filename)),
        ]);
      }

      final response = await _dio.post(
        '/v1/mfs/batch-upload',
        data: formData,
        queryParameters: {
          'bucket': bucket,
          if (dir != null) 'dir': dir,
          if (uid != null) 'uid': uid,
          'permission': permission,
        },
      );

      if (response.data['code'] == 0) {
        final results = response.data['data']['results'] as List;
        return results
            .where((result) => result['success'] == true)
            .map((result) => FileReference.fromJson(result['fso_info']))
            .toList();
      } else {
        throw Exception(response.data['message'] ?? '批量上传失败');
      }
    } catch (e) {
      if (kDebugMode) {
        print('批量文件上传失败: $e');
      }
      rethrow;
    }
  }
}
