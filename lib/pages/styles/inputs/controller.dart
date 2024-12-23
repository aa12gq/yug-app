import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputsController extends GetxController {
  InputsController();

  TextEditingController emailController = TextEditingController();

  _initData() {
    update(["inputs"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
