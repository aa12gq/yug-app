import 'package:get/get.dart';
import 'package:fixnum/fixnum.dart';
import 'package:yug_app/common/net/grpcs/api/client.dart';
import 'package:yug_app/common/net/grpcs/proto/user/frontend/v1/auth.pbgrpc.dart';
import 'package:yug_app/common/net/grpcs/proto/user/frontend/v1/user.pbgrpc.dart';
import 'package:yug_app/common/net/grpcs/proto/user/shared/v1/user.pb.dart';
import 'package:yug_app/common/net/grpcs/proto/captcha/v1/captcha.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class AuthApiService extends GetxService {
  static AuthApiService get to => Get.find();

  // 注册
  Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      final client = await GrpcClientUtil.createClient(AuthClient.new);
      return await client.register(request);
    } catch (e) {
      if (e is GrpcError) {
        throw e.message ?? '未知错误';
      }
      throw e.toString();
    }
  }

  // 登录
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final client = await GrpcClientUtil.createClient(AuthClient.new);
      return await client.login(request);
    } catch (e) {
      if (e is GrpcError) {
        throw e.message ?? '未知错误';
      }
      throw e.toString();
    }
  }

  Future<CheckVerificationConditionResponse> checkVerificationCondition(
      String identity, VerificationContext context) async {
    try {
      final client = await GrpcClientUtil.createClient(AuthClient.new);
      final response = await client.checkVerificationCondition(
        CheckVerificationConditionRequest(
          identity: identity,
          context: context,
        ),
      );
      return response;
    } catch (e) {
      if (e is GrpcError) {
        throw e.message ?? '未知错误';
      }
      throw e.toString();
    }
  }

  // 验证码相关API
  Future<FetchImageCaptchaResponse> fetchImageCaptcha(
      FetchImageCaptchaRequest request) async {
    final client = await GrpcClientUtil.createClient(CaptchaClient.new);
    final response = await client.fetchImageCaptcha(request);
    return response;
  }

  Future<FetchSlideCaptchaResponse> fetchSlideCaptcha(
      FetchSlideCaptchaRequest request) async {
    final client = await GrpcClientUtil.createClient(CaptchaClient.new);
    final response = await client.fetchSlideCaptcha(request);
    return response;
  }

  Future<ValidateImageCaptchaResponse> validateImageCaptcha(
      ValidateImageCaptchaRequest request) async {
    final client = await GrpcClientUtil.createClient(CaptchaClient.new);
    final response = await client.validateImageCaptcha(request);
    return response;
  }

  Future<ValidateSlideCaptchaResponse> validateSlideCaptcha(
      ValidateSlideCaptchaRequest request) async {
    final client = await GrpcClientUtil.createClient(CaptchaClient.new);
    final response = await client.validateSlideCaptcha(request);
    return response;
  }

  Future<ClearCaptchaIdentityTraceResponse> clearCaptchaIdentityTrace(
      ClearCaptchaIdentityTraceRequest request) async {
    final client = await GrpcClientUtil.createClient(CaptchaClient.new);
    final response = await client.clearCaptchaIdentityTrace(request);
    return response;
  }
}

class UserApiService extends GetxService {
  static UserApiService get to => Get.find();

  Future<GetUserInfoResponse> getUserInfo(Int64 userId) async {
    try {
      final client = await GrpcClientUtil.createClient(UserClient.new);
      final response =
          await client.getUserInfo(GetUserInfoRequest(userId: userId));
      return response;
    } catch (e) {
      if (e is GrpcError) {
        throw e.message ?? '未知错误';
      }
      throw e.toString();
    }
  }

  Future<GetMyProfileResponse> getMyProfile() async {
    try {
      final client = await GrpcClientUtil.createClient(UserClient.new);
      final response = await client.getMyProfile(GetMyProfileRequest());
      return response;
    } catch (e) {
      if (e is GrpcError) {
        throw e.message ?? '未知错误';
      }
      throw e.toString();
    }
  }
}

class CaptchaApiService extends GetxService {
  static CaptchaApiService get to => Get.find();

  // 获取图片验证码
  Future<FetchImageCaptchaResponse> fetchImageCaptcha(
      FetchImageCaptchaRequest request) async {
    try {
      final client = await GrpcClientUtil.createClient(CaptchaClient.new);
      return await client.fetchImageCaptcha(request);
    } catch (e) {
      if (e is GrpcError) {
        throw e.message ?? '未知错误';
      }
      throw e.toString();
    }
  }

  // 获取滑块验证码
  Future<FetchSlideCaptchaResponse> fetchSlideCaptcha(
      FetchSlideCaptchaRequest request) async {
    try {
      final client = await GrpcClientUtil.createClient(CaptchaClient.new);
      return await client.fetchSlideCaptcha(request);
    } catch (e) {
      if (e is GrpcError) {
        throw e.message ?? '未知错误';
      }
      throw e.toString();
    }
  }

  // 验证图片验证码
  Future<ValidateImageCaptchaResponse> validateImageCaptcha(
      ValidateImageCaptchaRequest request) async {
    try {
      final client = await GrpcClientUtil.createClient(CaptchaClient.new);
      return await client.validateImageCaptcha(request);
    } catch (e) {
      if (e is GrpcError) {
        throw e.message ?? '未知错误';
      }
      throw e.toString();
    }
  }

  // 验证滑块验证码
  Future<ValidateSlideCaptchaResponse> validateSlideCaptcha(
      ValidateSlideCaptchaRequest request) async {
    try {
      final client = await GrpcClientUtil.createClient(CaptchaClient.new);
      return await client.validateSlideCaptcha(request);
    } catch (e) {
      if (e is GrpcError) {
        throw e.message ?? '未知错误';
      }
      throw e.toString();
    }
  }

  // 清除验证码痕迹
  Future<ClearCaptchaIdentityTraceResponse> clearCaptchaIdentityTrace(
      ClearCaptchaIdentityTraceRequest request) async {
    try {
      final client = await GrpcClientUtil.createClient(CaptchaClient.new);
      return await client.clearCaptchaIdentityTrace(request);
    } catch (e) {
      if (e is GrpcError) {
        throw e.message ?? '未知错误';
      }
      throw e.toString();
    }
  }
}
