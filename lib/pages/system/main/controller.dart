import 'package:get/get.dart';
import 'package:yug_app/common/routers/name.dart';
import 'package:yug_app/common/services/user.dart';

class MainController extends GetxController {
  MainController();

  /// 初始化数据
  _initData() async {
    // 读取用户 profile
    await UserService.to.getMyProfile();

    update(["main"]);
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
