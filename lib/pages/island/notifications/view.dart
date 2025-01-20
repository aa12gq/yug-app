import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_app/common/index.dart';

import 'index.dart';

class IslandNotificationsPage extends GetView<IslandNotificationsController> {
  const IslandNotificationsPage({super.key});

  // 构建通知项
  Widget _buildNotificationItem(String title, String content, String time) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            content,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.secondaryText,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            time,
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.hintText,
            ),
          ),
        ],
      ),
    );
  }

  // 主视图
  Widget _buildView() {
    return ListView(
      children: [
        _buildNotificationItem(
          '系统通知',
          '欢迎来到语乐岛！',
          '刚刚',
        ),
        // TODO: 添加更多通知项
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('通知'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: _buildView(),
      ),
    );
  }
}
