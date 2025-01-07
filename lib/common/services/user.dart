import 'dart:convert';
import 'package:get/get.dart';
import 'package:fixnum/fixnum.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:uuid/uuid.dart';
import 'package:yug_app/common/net/grpcs/proto/user/shared/v1/user.pb.dart';
import 'package:yug_app/common/net/grpcs/proto/user/frontend/v1/user.pb.dart';
import 'package:yug_app/common/api/api_service.dart';

import '../index.dart';

/// 用户服务
class UserService extends GetxService {
  static UserService get to => Get.find();

  // 是否登录
  final _isLogin = false.obs;

  // 用户令牌
  String token = '';

  // 设备码
  String _deviceId = '';

  // 用户的资料
  final _profile = UserInfo().obs;

  // 用户ID
  Int64 get userId => _profile.value.userId;

  /// 是否登录
  bool get isLogin => _isLogin.value;

  /// 用户 profile
  UserInfo get profile => _profile.value;

  /// 是否有令牌 token
  bool get hasToken => token.isNotEmpty;

  /// 获取设备码
  String get deviceId => _deviceId;

  /// 检查验证条件
  Future<CheckVerificationConditionResponse> checkVerificationCondition(
      VerificationContext context) async {
    if (_deviceId.isEmpty) {
      await _initDeviceId();
    }
    return await AuthApiService.to
        .checkVerificationCondition(_deviceId, context);
  }

  /// 初始化设备码
  Future<void> _initDeviceId() async {
    // 先从本地存储获取
    _deviceId = Storage().getString(Constants.storageDeviceId);
    if (_deviceId.isNotEmpty) return;

    // 如果本地没有，则生成新的设备码
    final deviceInfo = DeviceInfoPlugin();
    String deviceIdentifier = '';

    if (GetPlatform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      deviceIdentifier = iosInfo.identifierForVendor ?? '';
    } else if (GetPlatform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      deviceIdentifier = androidInfo.id;
    }

    // 如果无法获取设备标识符，则生成一个UUID
    if (deviceIdentifier.isEmpty) {
      deviceIdentifier = const Uuid().v4();
    }

    _deviceId = deviceIdentifier;
    await Storage().setString(Constants.storageDeviceId, _deviceId);
  }

  @override
  void onInit() {
    super.onInit();
    // 读 token
    token = Storage().getString(Constants.storageToken);
    // 读 profile
    var profileOffline = Storage().getString(Constants.storageProfile);
    if (profileOffline.isNotEmpty) {
      _profile(UserInfo.fromBuffer(profileOffline.codeUnits));
      _isLogin.value = true;
    }
  }

  /// 设置令牌
  Future<void> setToken(String value) async {
    await Storage().setString(Constants.storageToken, value);
    token = value;
    if (value.isNotEmpty) {
      _isLogin.value = true;
    }
  }

  /// 获取用户 profile
  Future<void> getMyProfile() async {
    if (token.isEmpty) {
      print('获取用户信息失败: token为空');
      return;
    }
    try {
      print('开始获取用户信息...');
      final response = await UserApiService.to.getMyProfile();
      print('获取用户信息响应: $response');

      if (response.hasUserInfo()) {
        print('用户信息不为空，开始处理...');
        print('用户信息内容: ${response.userInfo}');
        _profile(response.userInfo);
        _isLogin.value = true;
        final buffer = response.userInfo.writeToBuffer();
        print('用户信息序列化成功，长度: ${buffer.length}');
        await Storage()
            .setString(Constants.storageProfile, String.fromCharCodes(buffer));
        print('用户信息保存成功');
      } else {
        print('获取用户信息失败: 用户信息为空');
        _isLogin.value = false;
        token = '';
        await Storage().remove(Constants.storageToken);
        await Storage().remove(Constants.storageProfile);
        Get.offAllNamed(RouteNames.systemLogin);
      }
    } catch (e, stackTrace) {
      print('获取用户信息失败: $e');
      print('错误堆栈: $stackTrace');
      _isLogin.value = false;
      token = '';
      await Storage().remove(Constants.storageToken);
      await Storage().remove(Constants.storageProfile);
      Get.offAllNamed(RouteNames.systemLogin);
    }
  }

  /// 设置用户 profile
  Future<void> setProfile(UserInfo profile) async {
    if (token.isEmpty) return;
    _isLogin.value = true;
    _profile(profile);
    await Storage().setString(Constants.storageProfile,
        String.fromCharCodes(profile.writeToBuffer()));
  }

  /// 注销
  Future<void> logout() async {
    await Storage().remove(Constants.storageToken);
    await Storage().remove(Constants.storageProfile);
    _profile(UserInfo());
    _isLogin.value = false;
    token = '';
  }

  /// 检查是否登录
  Future<bool> checkIsLogin() async {
    if (_isLogin.value == false) {
      await Get.toNamed(RouteNames.systemLogin);
      return false;
    }
    return true;
  }
}
