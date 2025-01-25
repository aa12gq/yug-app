import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yug_app/common/services/user.dart';
import 'package:yug_app/common/utils/loading.dart';
import 'package:yug_app/common/net/grpcs/proto/user/shared/v1/user.pb.dart';
import 'package:yug_app/common/api/api_service.dart';
import 'package:yug_app/config/mfs.dart';
import 'package:intl/intl.dart';

class ProfileEditController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nickNameController = TextEditingController();
  final bioController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  String? avatarUrl;
  Gender gender = Gender.GENDER_MALE;
  DateTime? birthday;

  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    // 初始化用户数据
    _initUserData();
  }

  // 初始化用户数据
  void _initUserData() {
    final user = UserService.to.profile;
    if (user != null) {
      nickNameController.text = user.nickname;
      bioController.text = user.bio;
      emailController.text = user.email;
      phoneController.text = user.phone;
      avatarUrl = user.avatarPath.isNotEmpty
          ? "${MfsConfig.previewFileUrl}/${user.avatarPath}"
          : null;
      gender = user.gender;
      if (user.birthday.isNotEmpty) {
        try {
          birthday = DateTime.parse(user.birthday);
        } catch (e) {
          print('解析生日失败: ${e.toString()}');
        }
      }
      update();
    }
  }

  // 选择头像
  Future<void> pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );
      if (image != null) {
        // TODO: 上传头像到服务器
        final request = UpdateAvatarRequest()..path = image.path;
        await UserApiService.to.updateAvatar(request);

        // 刷新用户信息以获取新的头像URL
        await UserService.to.getMyProfile();
        final newAvatarPath = UserService.to.profile.avatarPath;
        avatarUrl = newAvatarPath.isNotEmpty
            ? "${MfsConfig.previewFileUrl}/${newAvatarPath}"
            : null;
        update();
        Loading.success('头像更新成功');
      }
    } catch (e) {
      Loading.error('更新头像失败：${e.toString()}');
    }
  }

  // 选择性别
  void setGender(Gender value) {
    gender = value;
    update();
  }

  // 选择生日
  Future<void> selectBirthday(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: birthday ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != birthday) {
      birthday = picked;
      update();
    }
  }

  // 保存资料
  Future<void> saveProfile() async {
    if (!formKey.currentState!.validate()) return;

    try {
      Loading.show('保存中...');

      // 更新昵称
      if (nickNameController.text != UserService.to.profile.nickname) {
        final nicknameRequest = UpdateNicknameRequest()
          ..nickname = nickNameController.text;
        await UserApiService.to.updateNickname(nicknameRequest);
      }

      // 更新性别
      if (gender != UserService.to.profile.gender) {
        final genderRequest = UpdateGenderRequest()..gender = gender;
        await UserApiService.to.updateGender(genderRequest);
      }

      // 刷新用户信息
      await UserService.to.getMyProfile();

      Loading.success('保存成功');
      Get.back();
    } catch (e) {
      Loading.error('保存失败：${e.toString()}');
    }
  }

  @override
  void onClose() {
    nickNameController.dispose();
    bioController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
