import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_app/common/index.dart';

import 'index.dart';

class ListenPage extends GetView<ListenController> {
  const ListenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '听一听',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          '听一听功能开发中...',
          style: TextStyle(
            fontSize: 16.sp,
            color: AppColors.secondaryText,
          ),
        ),
      ),
    );
  }
}
