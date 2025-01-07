import 'package:get/get.dart';
import 'package:yug_app/common/services/user.dart';
import 'package:yug_app/common/utils/loading.dart';
import 'package:yug_app/common/routers/name.dart';

class SettingsController extends GetxController {
  SettingsController();

  _initData() {
    update(["settings"]);
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // 账号安全
  void onAccountSecurity() {
    Get.toNamed('/my/account/security');
  }

  // 通知设置
  void onNotifications() {
    Get.toNamed('/my/notifications');
  }

  // 隐私设置
  void onPrivacy() {
    Get.toNamed('/my/privacy');
  }

  // 清除缓存
  void onClearCache() async {
    try {
      Loading.show();
      await Future.delayed(const Duration(seconds: 1)); // 模拟清除缓存
      Loading.success('清除成功');
    } catch (e) {
      Loading.error('清除失败');
    }
  }

  // 退出登录
  void onLogout() async {
    try {
      Loading.show();
      await UserService.to.logout();
      Loading.success('退出成功');
      Get.offAllNamed(RouteNames.systemLogin);
    } catch (e) {
      Loading.error('退出失败：${e.toString()}');
    }
  }
}
