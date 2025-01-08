import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_app/common/index.dart';

import 'index.dart';

class MomentsIndexPage extends GetView<MomentsIndexController> {
  const MomentsIndexPage({super.key});

  Widget _buildFeatureItem({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: Colors.black.withOpacity(0.05),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                icon,
                color: color,
                size: 20.w,
              ),
            ),
            SizedBox(width: 12.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryText,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.secondaryText,
              size: 14.w,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "动态",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryText,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildFeatureItem(
              title: "语友圈",
              icon: Icons.people_outline,
              color: const Color(0xFF6C5CE7),
              onTap: () => Get.toNamed(RouteNames.momentsCircle),
            ),
            _buildFeatureItem(
              title: "扫一扫",
              icon: Icons.qr_code_scanner_outlined,
              color: const Color(0xFF00B894),
              onTap: () => Get.toNamed(RouteNames.momentsScan),
            ),
            _buildFeatureItem(
              title: "听一听",
              icon: Icons.headphones_outlined,
              color: const Color(0xFFFF7675),
              onTap: () => Get.toNamed(RouteNames.momentsListen),
            ),
          ],
        ),
      ),
    );
  }
}
