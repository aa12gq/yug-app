import 'package:get/get.dart';
import 'package:yug_app/common/index.dart';
import 'package:fixnum/fixnum.dart';
import 'package:yug_app/common/api/api_service.dart';

class StylesIndexController extends GetxController {
  StylesIndexController();

  // 添加状态变量
  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final userInfo = ''.obs;

  // 更新getUserInfo方法
  Future<void> getUserInfo() async {
    isLoading.value = true;
    errorMessage.value = '';
    userInfo.value = '';

    try {
      final response = await UserApiService.to.getUserInfo(Int64(1));
      userInfo.value = response.toString();
      print("用户信息: ${userInfo.value}");
    } catch (e) {
      print("获取用户信息失败: $e");
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
    update(["styles_index"]); // 更新UI
  }

  onLanguageSelected() {
    var en = Translation.supportedLocales[0];
    var zh = Translation.supportedLocales[1];

    ConfigService.to.onLocaleUpdate(
        ConfigService.to.locale.toLanguageTag() == en.toLanguageTag()
            ? zh
            : en);
    update(["styles_index"]);
  }

  // 主题
  onThemeSelected(String themeKey) async {
    await ConfigService.to.setThemeMode(themeKey);
    update(["styles_index"]);
  }

  _initData() {
    update(["styles_index"]);
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
