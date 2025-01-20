import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yug_app/common/i18n/locale_keys.dart';
import 'package:yug_app/common/net/grpcs/api/client.dart';
import 'package:yug_app/common/routers/name.dart';
import 'package:yug_app/common/utils/loading.dart';
import 'package:yug_app/common/api/api_service.dart';
import 'package:yug_app/common/services/user.dart';
import 'package:yug_app/common/net/grpcs/proto/user/shared/v1/user.pb.dart';
import 'package:yug_app/common/net/grpcs/proto/captcha/v1/captcha.pbgrpc.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

class LoginController extends GetxController {
  LoginController();

  // 表单key
  final formKey = GlobalKey<FormState>();

  // 登录类型
  final loginType = LocaleKeys.loginTypeUsernameValue.tr.obs;

  // 用户协议勾选状态
  final isAgreementChecked = false.obs;

  // 用户名
  final userNameController = TextEditingController();

  // 邮箱
  final emailController = TextEditingController();

  // 手机号
  final phoneController = TextEditingController();

  // 密码
  final passwordController = TextEditingController();

  // 验证码
  final captchaController = TextEditingController();

  // 短信/邮箱验证码
  final verifyCodeController = TextEditingController();

  // 设备标识符
  final deviceId = ''.obs;

  // 图片验证码base64
  final captchaImage = ''.obs;

  // 是否需要验证码
  final needCaptcha = false.obs;

  @override
  void onInit() {
    super.onInit();
    _generateDeviceId();
  }

  @override
  void onReady() {
    super.onReady();
    // 初始化时不需要立即检查,等到登录失败时再检查
    needCaptcha.value = false;
  }

  // 生成设备标识符
  Future<void> _generateDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      deviceId.value = iosInfo.identifierForVendor ?? '';
    } else if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      deviceId.value = androidInfo.id;
    }
    // 打印设备ID
    print('deviceId: $deviceId');
  }

  // 检查是否需要验证码
  Future<void> _checkCaptchaCondition() async {
    try {
      final response = await AuthApiService.to.checkVerificationCondition(
        deviceId.value,
        VerificationContext.LOGIN_ATTEMPT,
      );

      // 检查返回的条件中是否包含需要图片验证码的条件
      needCaptcha.value = response.conditions
          .any((condition) => condition == VerificationCondition.CAPTCHA_IMAGE);

      if (needCaptcha.value) {
        _fetchCaptcha();
        // 清空之前的验证码输入
        captchaController.clear();
        update(['login']); // 更新UI以显示验证码输入框
      }
    } catch (e) {
      Get.snackbar('提示', '验证码检查失败：${e.toString()}');
    }
  }

  // 获取图片验证码
  Future<void> _fetchCaptcha() async {
    try {
      final client = await GrpcClientUtil.createClient(CaptchaClient.new);
      final response = await client.fetchImageCaptcha(
        FetchImageCaptchaRequest(
          identityKey: deviceId.value,
          captchaType: ImageCaptchaType.DIGIT,
          businessScenario: BusinessScenario.LOGIN.name,
        ),
      );
      captchaImage.value = response.base64Image;
      update(['captcha']);
    } catch (e) {
      Get.snackbar('错误', '获取验证码失败：${e.toString()}');
    }
  }

  // 刷新验证码
  void refreshCaptcha() {
    _fetchCaptcha();
  }

  // 切换登录类型
  Future<void> switchLoginType(String type) async {
    loginType.value = type;

    // 如果是用户名密码登录，检查是否需要验证码
    if (type == LocaleKeys.loginTypeUsernameValue.tr) {
      await _checkCaptchaCondition();
    } else {
      // 非用户名密码登录，清空验证码相关状态
      captchaController.clear();
      captchaImage.value = '';
      needCaptcha.value = false;
    }

    update(["login"]);
  }

  // 切换用户协议勾选状态
  void toggleAgreement() {
    isAgreementChecked.value = !isAgreementChecked.value;
    update(["login"]);
  }

  // 打开用户协议
  void openUserAgreement() {
    Get.toNamed('/terms');
  }

  // 打开隐私政策
  void openPrivacyPolicy() {
    Get.toNamed('/privacy-policy');
  }

  // 显示协议提示对话框
  void showAgreementDialog() {
    final selectedIndex = 0.obs;

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          width: Get.width * 0.85,
          constraints: BoxConstraints(
            maxHeight: Get.height * 0.6,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 顶部背景和图标
              Container(
                height: 120,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blue.withOpacity(0.8),
                      Colors.blue.withOpacity(0.6),
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Stack(
                  children: [
                    // 装饰圆圈
                    Positioned(
                      top: -20,
                      right: -20,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.1),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -30,
                      left: -30,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.1),
                        ),
                      ),
                    ),
                    // 内容
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.verified_user_rounded,
                              color: Colors.blue,
                              size: 28,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            LocaleKeys.loginAgreementTitle.tr,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // 标签选择器
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Container(
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Obx(
                    () => Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => selectedIndex.value = 0,
                            child: Container(
                              margin: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: selectedIndex.value == 0
                                    ? Colors.white
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: selectedIndex.value == 0
                                    ? [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.05),
                                          blurRadius: 4,
                                          offset: const Offset(0, 2),
                                        ),
                                      ]
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  LocaleKeys.loginUserAgreement.tr,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: selectedIndex.value == 0
                                        ? FontWeight.w600
                                        : FontWeight.normal,
                                    color: selectedIndex.value == 0
                                        ? Colors.blue
                                        : Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => selectedIndex.value = 1,
                            child: Container(
                              margin: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: selectedIndex.value == 1
                                    ? Colors.white
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: selectedIndex.value == 1
                                    ? [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.05),
                                          blurRadius: 4,
                                          offset: const Offset(0, 2),
                                        ),
                                      ]
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  LocaleKeys.loginPrivacyPolicy.tr,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: selectedIndex.value == 1
                                        ? FontWeight.w600
                                        : FontWeight.normal,
                                    color: selectedIndex.value == 1
                                        ? Colors.blue
                                        : Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // 协议内容
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Obx(
                    () => SingleChildScrollView(
                      child: Text(
                        selectedIndex.value == 0
                            ? LocaleKeys.loginUserAgreementContent.tr
                            : LocaleKeys.loginPrivacyPolicyContent.tr,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // 按钮组
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    // 取消按钮
                    SizedBox(
                      width: 100,
                      child: TextButton(
                        onPressed: () => Get.back(),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ),
                        ),
                        child: Text(
                          LocaleKeys.loginDisagreeButton.tr,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    // 确认按钮
                    SizedBox(
                      width: 100,
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                          isAgreementChecked.value = true;
                          handleLogin();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          LocaleKeys.loginAgreementButton.tr,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  // 获取验证码
  Future<void> getVerifyCode() async {
    try {
      Loading.show();

      final contact = loginType.value == LocaleKeys.loginTypePhoneValue.tr
          ? phoneController.text
          : emailController.text;

      if (contact.isEmpty) {
        Loading.error(LocaleKeys.loginErrorContactRequired.tr);
        return;
      }

      Loading.success(LocaleKeys.loginSuccessVerifyCode.tr);
    } catch (e) {
      Loading.error('${LocaleKeys.loginErrorGeneral.tr}: ${e.toString()}');
    }
  }

  // 登录
  Future<void> handleLogin() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (!isAgreementChecked.value) {
      showAgreementDialog();
      return;
    }

    try {
      Loading.show();

      // 登录
      final request = LoginRequest(
        identity: deviceId.value,
        usernamePassword: LoginRequest_UsernamePasswordLogin(
          username: userNameController.text,
          password: passwordController.text,
          imageCaptchaAnswer: captchaController.text, // 直接发送验证码答案，由服务端验证
        ),
        appId: "com.vtyug.ygApp",
      );

      // 打印请求
      print('request: $request');
      print(
          '验证码状态: needCaptcha=${needCaptcha.value}, captchaText=${captchaController.text}');

      final response = await AuthApiService.to.login(request);
      await UserService.to.setToken(response.accessToken);
      await UserService.to.getMyProfile();
      Get.offAllNamed(RouteNames.systemMain);
    } catch (e) {
      Get.snackbar(LocaleKeys.loginErrorTip.tr, e.toString());

      // 登录失败后立即调用检查条件接口
      await _checkCaptchaCondition();
    } finally {
      Loading.dismiss();
    }
  }

  // 跳转到注册页
  void goToRegister() {
    Get.toNamed(RouteNames.systemRegister);
  }

  @override
  void onClose() {
    userNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    captchaController.dispose();
    verifyCodeController.dispose();
    super.onClose();
  }
}
