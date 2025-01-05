import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IslandSearchController extends GetxController {
  IslandSearchController();

  final TextEditingController searchController = TextEditingController();
  final RxString searchText = ''.obs;

  void onSearchChanged(String value) {
    searchText.value = value;
    // TODO: 实现搜索逻辑
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
