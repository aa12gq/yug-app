import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  final loginType = 'username'.obs;

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
    _checkCaptchaCondition();
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

      needCaptcha.value = response.conditions.isNotEmpty;
      if (needCaptcha.value) {
        _fetchCaptcha();
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
          businessScenario: 'login',
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
  void switchLoginType(String type) {
    loginType.value = type;
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
                          const Text(
                            '服务协议和隐私政策',
                            style: TextStyle(
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
                                  '用户协议',
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
                                  '隐私政策',
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

              // 协议内容（可滚动）
              Flexible(
                child: Obx(
                  () => SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.1),
                        ),
                      ),
                      child: Text(
                        selectedIndex.value == 0
                            ? '1. 服务条款的确认和接纳\n'
                                '当您注册成为用户时，即表示您已充分阅读、理解并接受本协议的全部内容。\n\n'
                                '2. 服务内容\n'
                                '本应用为用户提供以下服务：信息发布、交流互动、内容分享等。\n\n'
                                '3. 用户个人信息保护\n'
                                '我们将按照法律法规要求，采取安全保护措施，保护您的个人信息安全。\n\n'
                                '4. 用户行为规范\n'
                                '您在使用本服务时需遵守法律法规，不得发布违法违规内容。'
                            : '1. 信息收集\n'
                                '我们可能收集您的以下信息：账号信息、设备信息、位置信息等。\n\n'
                                '2. 信息使用\n'
                                '我们收集的信息将用于：提供服务、改善体验、安全防护等。\n\n'
                                '3. 信息共享\n'
                                '未经您同意，我们不会与第三方分享您的个人信息。\n\n'
                                '4. 信息安全\n'
                                '我们采用业界标准的安全技术和程序来保护您的个人信息。',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black87,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // 按钮组
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    // 取消按钮
                    Expanded(
                      child: TextButton(
                        onPressed: () => Get.back(),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ),
                        ),
                        child: const Text(
                          '暂不同意',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // 确认按钮
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                          isAgreementChecked.value = true;
                          handleLogin();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text(
                          '同意并继续',
                          style: TextStyle(
                            fontSize: 15,
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

      final contact = loginType.value == 'phone'
          ? phoneController.text
          : emailController.text;

      if (contact.isEmpty) {
        Loading.error(loginType.value == 'phone' ? '请输入手机号' : '请输入邮箱');
        return;
      }

      // // 构建验证码请求
      // final request = SendVerifyCodeRequest(
      //   contact: contact,
      //   type:
      //       loginType.value == 'phone' ? ContactType.PHONE : ContactType.EMAIL,
      //   usage: VerifyCodeUsage.LOGIN,
      // );

      // // 调用发送验证码API
      // await AuthApiService.to.sendVerifyCode(request);
      Loading.success('验证码已发送');
    } catch (e) {
      Loading.error('发送失败：${e.toString()}');
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

      // 如果需要验证码，先验证验证码
      if (needCaptcha.value) {
        final client = await GrpcClientUtil.createClient(CaptchaClient.new);
        final validateCaptchaResponse = await client.validateImageCaptcha(
          ValidateImageCaptchaRequest(
            identityKey: deviceId.value,
            answer: captchaController.text,
          ),
        );

        if (!validateCaptchaResponse.isValid) {
          Get.snackbar('错误', '验证码错误');
          refreshCaptcha();
          return;
        }
      }

      // 登录
      final request = LoginRequest(
        usernamePassword: LoginRequest_UsernamePasswordLogin(
          username: userNameController.text,
          password: passwordController.text,
          imageCaptchaAnswer: captchaController.text,
        ),
        appId: "com.vtyug.yugapp",
      );

      final response = await AuthApiService.to.login(request);
      await UserService.to.setToken(response.accessToken);
      await UserService.to.getMyProfile();
      Get.offAllNamed(RouteNames.systemMain);
    } catch (e) {
      Get.snackbar('错误', e.toString());

      // 登录失败后重新检查验证码条件
      await _checkCaptchaCondition();

      // 如果需要验证码，清空验证码输入框并获取新的验证码
      if (needCaptcha.value) {
        captchaController.clear();
        // 显示提示信息
        Get.snackbar(
          '提示',
          '需要输入图片验证码',
          duration: const Duration(seconds: 2),
        );
        // 立即获取新的验证码
        _fetchCaptcha();
      }
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
    super.onClose();
  }
}
