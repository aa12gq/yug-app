import 'package:get/get.dart';

class MyIndexController extends GetxController {
  MyIndexController();

  _initData() {
    update(["my_index"]);
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // 编辑个人资料
  void onEditProfile() {
    Get.toNamed('/my/profile/edit');
  }

  // 收藏
  void onFavorites() {
    Get.toNamed('/my/favorites');
  }

  // 历史记录
  void onHistory() {
    Get.toNamed('/my/history');
  }

  // 我的作品
  void onWorks() {
    Get.toNamed('/my/works');
  }

  // 主题设置
  void onTheme() {
    Get.toNamed('/my/theme');
  }

  // 语言设置
  void onLanguage() {
    Get.toNamed('/my/language');
  }

  // 消息通知
  void onNotifications() {
    Get.toNamed('/my/notifications');
  }

  // 隐私设置
  void onPrivacy() {
    Get.toNamed('/my/privacy');
  }

  // 关于我们
  void onAbout() {
    Get.toNamed('/about');
  }

  // 用户协议
  void onTerms() {
    Get.toNamed('/terms');
  }

  // 隐私政策
  void onPrivacyPolicy() {
    Get.toNamed('/privacy-policy');
  }

  // 查看所有活动
  void onViewAllActivities() {
    Get.toNamed('/my/activities');
  }
}
