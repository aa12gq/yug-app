import 'package:get/get.dart';
import 'package:yug_app/common/index.dart';
import 'package:fixnum/fixnum.dart';
import 'package:yug_app/common/net/grpcs/proto/system/v1/user_frontend.pbgrpc.dart';
import 'package:yug_app/common/net/grpcs/api/client.dart';
import 'package:yug_app/common/net/grpcs/proto/system/v1/user_bo.pb.dart';

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
      final client = await GrpcClientUtil.createClient(UserFrontendClient.new);

      print("正在连接gRPC服务器...");
      print("Channel options: ${client}");
      final response =
          await client.getUserInfo(GetUserInfoRequest(userId: Int64(1)));
      print("RPC调用成功: $response");
      userInfo.value = response.toString();
      print("用户信息: ${userInfo.value}");
    } catch (e) {
      print("RPC调用失败: $e");
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
