import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_app/common/index.dart';

import 'index.dart';

class IslandCreativeIslandPage extends GetView<IslandCreativeIslandController> {
  const IslandCreativeIslandPage({super.key});

  // 主视图
  Widget _buildView() {
    return Container(
      margin: EdgeInsets.all(15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '创意岛屿',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
            ),
          ),
          SizedBox(height: 20.h),
          // TODO: 添加创意岛屿的具体内容
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('创意岛屿'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: _buildView(),
      ),
    );
  }
}
