import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:yug_app/common/index.dart';
import 'package:yug_app/common/net/grpcs/proto/user/shared/v1/user.pb.dart';
import 'dart:ui';

import 'index.dart';

class ProfileEditPage extends GetView<ProfileEditController> {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.grey[100],
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                iconSize: 18.w,
                onPressed: () => Get.back(),
              ),
              title: Text(
                '编辑资料',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              actions: [
                TextButton(
                  onPressed: controller.saveProfile,
                  child: Text(
                    '保存',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: GetBuilder<ProfileEditController>(
        builder: (_) {
          return Form(
            key: controller.formKey,
            child: Stack(
              children: [
                // 背景装饰
                Positioned(
                  top: -100.h,
                  right: -50.w,
                  child: Container(
                    width: 200.w,
                    height: 200.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          AppTheme.primary.withValues(alpha: .5),
                          AppTheme.primary.withValues(alpha: .2),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 50.h,
                  left: -80.w,
                  child: Container(
                    width: 150.w,
                    height: 150.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          AppTheme.secondary.withValues(alpha: .3),
                          AppTheme.secondary.withValues(alpha: .1),
                        ],
                      ),
                    ),
                  ),
                ),
                // 主要内容
                SafeArea(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          SizedBox(height: 20.h),
                          // 头像部分
                          _buildAvatarSection(),
                          SizedBox(height: 30.h),
                          // 信息卡片
                          _buildInfoCard(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // 头像部分
  Widget _buildAvatarSection() {
    return Container(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 外层装饰
          Container(
            width: 90.w,
            height: 90.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppTheme.primary.withValues(alpha: .15),
                  AppTheme.secondary.withValues(alpha: .05),
                ],
              ),
            ),
          ),
          // 中层装饰
          Container(
            width: 82.w,
            height: 82.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: .1),
              border: Border.all(
                color: Colors.white.withValues(alpha: .2),
                width: 0.5.w,
              ),
            ),
          ),
          // 头像容器
          Container(
            width: 70.w,
            height: 70.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppTheme.primary,
                  AppTheme.secondary,
                ],
                stops: const [0.3, 0.9],
              ),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primary.withValues(alpha: .2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
                BoxShadow(
                  color: Colors.white.withValues(alpha: .15),
                  blurRadius: 5,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: GestureDetector(
              onTap: controller.pickImage,
              child: Container(
                margin: EdgeInsets.all(1.2.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .05),
                      blurRadius: 3,
                      spreadRadius: 1,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: controller.avatarUrl != null &&
                          controller.avatarUrl!.isNotEmpty
                      ? Image.network(
                          controller.avatarUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              _buildDefaultAvatar(),
                        )
                      : _buildDefaultAvatar(),
                ),
              ),
            ),
          ),
          // 编辑按钮
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppTheme.primary.withValues(alpha: .9),
                    AppTheme.secondary.withValues(alpha: .9),
                  ],
                ),
                borderRadius: BorderRadius.circular(14.r),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primary.withValues(alpha: .15),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
                border: Border.all(
                  color: Colors.white.withValues(alpha: .2),
                  width: 0.5.w,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.camera_alt,
                    color: Colors.white.withValues(alpha: .95),
                    size: 11.w,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    '更换头像',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: .95),
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDefaultAvatar() {
    return Container(
      color: AppTheme.primary.withValues(alpha: .05),
      child: Icon(
        Icons.person,
        color: AppTheme.primary.withValues(alpha: .6),
        size: 35.w,
      ),
    );
  }

  // 信息卡片
  Widget _buildInfoCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: .9),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('基本信息'),
                SizedBox(height: 20.h),
                _buildInputField(
                  label: '昵称',
                  hint: '请输入昵称',
                  controller: controller.nickNameController,
                  prefixIcon: Icons.person_outline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '请输入昵称';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                _buildInputField(
                  label: '个人简介',
                  hint: '介绍一下自己吧',
                  controller: controller.bioController,
                  prefixIcon: Icons.description_outlined,
                  maxLines: 3,
                ),
                SizedBox(height: 16.h),
                _buildGenderSelector(),
                SizedBox(height: 16.h),
                _buildBirthdaySelector(),
                SizedBox(height: 24.h),
                _buildSectionTitle('联系方式'),
                SizedBox(height: 20.h),
                _buildInputField(
                  label: '邮箱',
                  hint: '请输入邮箱',
                  controller: controller.emailController,
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      if (!GetUtils.isEmail(value)) {
                        return '请输入正确的邮箱格式';
                      }
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                _buildInputField(
                  label: '手机号',
                  hint: '请输入手机号',
                  controller: controller.phoneController,
                  prefixIcon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      if (!GetUtils.isPhoneNumber(value)) {
                        return '请输入正确的手机号格式';
                      }
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 通用输入框
  Widget _buildInputField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required IconData prefixIcon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: 6.h),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          validator: validator,
          style: TextStyle(fontSize: 14.sp),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 13.sp,
            ),
            prefixIcon: Icon(
              prefixIcon,
              color: AppTheme.primary,
              size: 18.w,
            ),
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 12.h,
            ),
          ),
        ),
      ],
    );
  }

  // 性别选择器
  Widget _buildGenderSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '性别',
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: 6.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Icon(
                Icons.wc_outlined,
                color: AppTheme.primary,
                size: 18.w,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Row(
                  children: [
                    _buildGenderOption(
                      label: '男',
                      value: Gender.GENDER_MALE,
                      icon: Icons.male,
                    ),
                    SizedBox(width: 12.w),
                    _buildGenderOption(
                      label: '女',
                      value: Gender.GENDER_FEMALE,
                      icon: Icons.female,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 性别选项
  Widget _buildGenderOption({
    required String label,
    required Gender value,
    required IconData icon,
  }) {
    final isSelected = controller.gender == value;
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.setGender(value),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.white : Colors.grey,
                size: 16.w,
              ),
              SizedBox(width: 4.w),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey,
                  fontSize: 14.sp,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 生日选择器
  Widget _buildBirthdaySelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '生日',
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: 6.h),
        InkWell(
          onTap: () => controller.selectBirthday(Get.context!),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.cake_outlined,
                  color: AppTheme.primary,
                  size: 18.w,
                ),
                SizedBox(width: 12.w),
                Text(
                  controller.birthday != null
                      ? DateFormat('yyyy-MM-dd').format(controller.birthday!)
                      : '请选择生日',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: controller.birthday != null
                        ? Colors.black87
                        : Colors.grey[400],
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey[400],
                  size: 14.w,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // 区块标题
  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Container(
          width: 3.w,
          height: 14.h,
          decoration: BoxDecoration(
            color: AppTheme.primary,
            borderRadius: BorderRadius.circular(1.5.r),
          ),
        ),
        SizedBox(width: 6.w),
        Text(
          title,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
