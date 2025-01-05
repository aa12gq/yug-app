import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_app/common/index.dart';

import 'index.dart';

class IslandActivitiesPage extends GetView<IslandActivitiesController> {
  const IslandActivitiesPage({super.key});

  // 主视图
  Widget _buildView() {
    return Container(
      margin: EdgeInsets.all(15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '岛民活动',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
            ),
          ),
          SizedBox(height: 20.h),
          // TODO: 添加岛民活动的具体内容
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('岛民活动'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: _buildView(),
      ),
    );
  }
}
