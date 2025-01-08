import 'package:get/get.dart';
import '../api/api_service.dart';
import '../net/grpcs/proto/captcha/v1/captcha.pbgrpc.dart';

class CaptchaService extends GetxService {
  final CaptchaApiService _apiService = Get.find<CaptchaApiService>();

  // 获取图片验证码
  Future<FetchImageCaptchaResponse> fetchImageCaptcha({
    required String identityKey,
    ImageCaptchaType captchaType = ImageCaptchaType.STRING,
    String businessScenario = 'default',
  }) async {
    final request = FetchImageCaptchaRequest(
      identityKey: identityKey,
      captchaType: captchaType,
      businessScenario: businessScenario,
    );
    return await _apiService.fetchImageCaptcha(request);
  }

  // 获取滑块验证码
  Future<FetchSlideCaptchaResponse> fetchSlideCaptcha({
    required String identityKey,
    String businessScenario = 'default',
  }) async {
    final request = FetchSlideCaptchaRequest(
      identityKey: identityKey,
      businessScenario: businessScenario,
    );
    return await _apiService.fetchSlideCaptcha(request);
  }

  // 验证图片验证码
  Future<ValidateImageCaptchaResponse> validateImageCaptcha({
    required String identityKey,
    required String answer,
  }) async {
    final request = ValidateImageCaptchaRequest(
      identityKey: identityKey,
      answer: answer,
    );
    return await _apiService.validateImageCaptcha(request);
  }

  // 验证滑块验证码
  Future<ValidateSlideCaptchaResponse> validateSlideCaptcha({
    required String identityKey,
    required int tileY,
  }) async {
    final request = ValidateSlideCaptchaRequest(
      identityKey: identityKey,
      tileY: tileY,
    );
    return await _apiService.validateSlideCaptcha(request);
  }

  // 清除验证码痕迹
  Future<ClearCaptchaIdentityTraceResponse> clearCaptchaIdentityTrace({
    required String identityKey,
  }) async {
    final request = ClearCaptchaIdentityTraceRequest(
      identityKey: identityKey,
    );
    return await _apiService.clearCaptchaIdentityTrace(request);
  }
}
