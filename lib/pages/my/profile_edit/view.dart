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
                '个人资料',
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
                // 背景渐变
                Container(
                  height: 280.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppTheme.primary, // 使用主题色
                        AppTheme.secondary,
                      ],
                    ),
                  ),
                ),
                // 装饰圆形
                Positioned(
                  top: -50.h,
                  right: -30.w,
                  child: Container(
                    width: 160.w,
                    height: 160.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                ),
                Positioned(
                  top: 100.h,
                  left: -60.w,
                  child: Container(
                    width: 120.w,
                    height: 120.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                ),
                // 主要内容
                SafeArea(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),
                        // 头像部分
                        _buildAvatarSection(),
                        SizedBox(height: 30.h),
                        // 信息卡片
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16.w),
                          decoration: BoxDecoration(
                            color: isDark ? Colors.grey[900] : Colors.white,
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              _buildInfoItem(
                                icon: Icons.person_outline,
                                title: '昵称',
                                child: TextFormField(
                                  controller: controller.nickNameController,
                                  decoration: InputDecoration(
                                    hintText: '设置昵称',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color:
                                        isDark ? Colors.white : Colors.black87,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '请输入昵称';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              _buildDivider(),
                              _buildInfoItem(
                                icon: Icons.description_outlined,
                                title: '个性签名',
                                child: TextFormField(
                                  controller: controller.bioController,
                                  maxLines: 3,
                                  minLines: 1,
                                  decoration: InputDecoration(
                                    hintText: '写点什么介绍一下自己吧',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color:
                                        isDark ? Colors.white : Colors.black87,
                                  ),
                                ),
                              ),
                              _buildDivider(),
                              _buildInfoItem(
                                icon: Icons.wc_outlined,
                                title: '性别',
                                child: Row(
                                  children: [
                                    _buildGenderOption(
                                      icon: Icons.male,
                                      label: '男',
                                      value: Gender.GENDER_MALE,
                                      groupValue: controller.gender,
                                      onChanged: controller.setGender,
                                    ),
                                    SizedBox(width: 20.w),
                                    _buildGenderOption(
                                      icon: Icons.female,
                                      label: '女',
                                      value: Gender.GENDER_FEMALE,
                                      groupValue: controller.gender,
                                      onChanged: controller.setGender,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
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
    return Stack(
      alignment: Alignment.center,
      children: [
        // 外层光晕
        Container(
          width: 120.w,
          height: 120.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.2),
                Colors.white.withOpacity(0.1),
              ],
            ),
          ),
        ),
        // 头像容器
        GestureDetector(
          onTap: controller.pickImage,
          child: Container(
            width: 100.w,
            height: 100.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Colors.white.withOpacity(0.9),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Container(
              margin: EdgeInsets.all(3.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: controller.avatarUrl != null &&
                        controller.avatarUrl!.isNotEmpty
                    ? DecorationImage(
                        image: NetworkImage(controller.avatarUrl!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child:
                  controller.avatarUrl == null || controller.avatarUrl!.isEmpty
                      ? Icon(
                          Icons.person_outline,
                          size: 40.w,
                          color: Colors.grey[400],
                        )
                      : null,
            ),
          ),
        ),
        // 编辑按钮
        Positioned(
          bottom: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppTheme.primary.withOpacity(0.9),
                  AppTheme.secondary.withOpacity(0.9),
                ],
              ),
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.edit_outlined,
                  color: Colors.white,
                  size: 16.w,
                ),
                SizedBox(width: 4.w),
                Text(
                  '编辑头像',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // 信息项
  Widget _buildInfoItem({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32.w,
            height: 32.w,
            decoration: BoxDecoration(
              color: AppTheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(
              icon,
              color: AppTheme.primary,
              size: 18.w,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[500],
                  ),
                ),
                SizedBox(height: 4.h),
                child,
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 分隔线
  Widget _buildDivider() {
    return Container(
      height: 0.5,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      color: Colors.grey[300],
    );
  }

  // 性别选项
  Widget _buildGenderOption({
    required IconData icon,
    required String label,
    required Gender value,
    required Gender groupValue,
    required ValueChanged<Gender> onChanged,
  }) {
    final isSelected = value == groupValue;
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected
              ? AppTheme.primary.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected ? AppTheme.primary : Colors.grey[300]!,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? AppTheme.primary : Colors.grey[400],
              size: 16.w,
            ),
            SizedBox(width: 4.w),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? AppTheme.primary : Colors.grey[400],
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
