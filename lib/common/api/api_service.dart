import 'package:get/get.dart';
import 'package:fixnum/fixnum.dart';
import 'package:yug_app/common/net/grpcs/api/client.dart';
import 'package:yug_app/common/net/grpcs/proto/user/frontend/v1/auth.pbgrpc.dart';
import 'package:yug_app/common/net/grpcs/proto/user/frontend/v1/user.pbgrpc.dart';
import 'package:yug_app/common/net/grpcs/proto/user/shared/v1/user.pb.dart';

class AuthApiService extends GetxService {
  static AuthApiService get to => Get.find();

  // 注册
  Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      final client = await GrpcClientUtil.createClient(AuthClient.new);
      return await client.register(request);
    } catch (e) {
      print("注册失败: $e");
      rethrow;
    }
  }

  // 登录
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final client = await GrpcClientUtil.createClient(AuthClient.new);
      return await client.login(request);
    } catch (e) {
      print("登录失败: $e");
      rethrow;
    }
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
      print("获取用户信息失败: $e");
      rethrow;
    }
  }
}
