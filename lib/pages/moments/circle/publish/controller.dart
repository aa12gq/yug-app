import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yug_app/common/index.dart';

class PublishController extends GetxController {
  static PublishController get to => Get.find();

  // 文本编辑控制器
  final TextEditingController contentController = TextEditingController();

  // 图片列表
  final RxList<File> _images = <File>[].obs;
  List<File> get images => _images;

  // 选择图片
  Future<void> onPickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1080,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (image != null) {
        _images.add(File(image.path));
      }
    } catch (e) {
      print(e.toString());
      Loading.error('选择图片失败');
    }
  }

  // 移除图片
  void onRemoveImage(int index) {
    _images.removeAt(index);
  }

  // 发布动态
  Future<void> onPublish() async {
    if (contentController.text.trim().isEmpty) {
      Loading.error('请输入内容');
      return;
    }

    try {
      Loading.show();

      // TODO: 上传图片到服务器
      // TODO: 发布动态到服务器

      await Future.delayed(const Duration(seconds: 2)); // 模拟网络请求

      Loading.success('发布成功');
      Get.back(result: true);
    } catch (e) {
      print(e.toString());
      Loading.error('发布失败');
    }
  }

  @override
  void onClose() {
    contentController.dispose();
    super.onClose();
  }
}
