import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:yug_app/common/utils/loading.dart';

class FeedbackController extends GetxController {
  FeedbackController();

  // 问题类型列表
  final List<String> problemTypes = [
    '功能异常',
    '产品建议',
    '账号问题',
    '其他问题',
  ];

  // 选中的问题类型
  final selectedType = '功能异常'.obs;

  // 问题描述控制器
  final descriptionController = TextEditingController();

  // 联系方式控制器
  final contactController = TextEditingController();

  // 图片列表
  final imageList = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  // 初始化数据
  void _initData() {
    update(["feedback"]);
  }

  // 选择问题类型
  void selectType(String type) {
    selectedType.value = type;
    update(["feedback"]);
  }

  // 添加图片
  void addImage() {
    // TODO: 实现图片选择和上传功能
    update(["feedback"]);
  }

  // 删除图片
  void removeImage(int index) {
    imageList.removeAt(index);
    update(["feedback"]);
  }

  // 提交反馈
  Future<void> submitFeedback() async {
    if (descriptionController.text.isEmpty) {
      Get.snackbar('提示', '请输入问题描述');
      return;
    }

    try {
      Loading.show();
      // TODO: 实现反馈提交接口
      await Future.delayed(const Duration(seconds: 1)); // 模拟网络请求
      Loading.success('提交成功');
      Get.back();
    } catch (e) {
      Loading.error('提交失败：${e.toString()}');
    }
  }

  @override
  void onClose() {
    descriptionController.dispose();
    contactController.dispose();
    super.onClose();
  }
}
