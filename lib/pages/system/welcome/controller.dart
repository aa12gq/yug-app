import 'package:get/get.dart';
import 'package:yug_app/common/index.dart';
import 'package:yug_app/common/models/welcome_model.dart';

class WelcomeController extends GetxController {
  WelcomeController();

  List<WelcomeModel>? items;
  int currentPage = 0;

  /// 当前页码发生变化
  void onPageChanged(int index) {
    currentPage = index;
    update(["slider"]);
  }

  /// 初始化数据
  _initData() {
    items = [
      WelcomeModel(
        image: AssetsImages.welcome_1Png,
        title: LocaleKeys.welcomeOneTitle.tr,
        desc: LocaleKeys.welcomeOneDesc.tr,
      ),
      WelcomeModel(
        image: AssetsImages.welcome_2Png,
        title: LocaleKeys.welcomeTwoTitle.tr,
        desc: LocaleKeys.welcomeTwoDesc.tr,
      ),
      WelcomeModel(
        image: AssetsImages.welcome_3Png,
        title: LocaleKeys.welcomeThreeTitle.tr,
        desc: LocaleKeys.welcomeThreeDesc.tr,
      ),
    ];

    update(["slider"]);
  }

  void onTap() {}

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
