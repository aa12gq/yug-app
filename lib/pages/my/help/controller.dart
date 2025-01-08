import 'package:get/get.dart';
import 'package:yug_app/common/routers/name.dart';

class HelpController extends GetxController {
  HelpController();

  _initData() {
    update(["help"]);
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // 搜索帮助文档
  void searchHelp(String keyword) {
    // TODO: 实现搜索功能
  }

  // 查看分类详情
  void viewCategory(String category) {
    // TODO: 实现分类详情页面
  }

  // 查看问题详情
  void viewQuestion(String questionId) {
    // TODO: 实现问题详情页面
  }

  // 跳转到帮助详情页
  void onHelpDetail(String title, String type) {
    Get.toNamed(
      RouteNames.myHelpDetail,
      arguments: {
        'title': title,
        'type': type,
      },
    );
  }
}
