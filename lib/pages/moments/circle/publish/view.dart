import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_app/common/index.dart';

import 'index.dart';

class PublishPage extends GetView<PublishController> {
  const PublishPage({super.key});

  // 构建内容输入框
  Widget _buildContentInput() {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: TextField(
        controller: controller.contentController,
        maxLines: 5,
        maxLength: 500,
        decoration: InputDecoration(
          hintText: '分享你的学习心得和生活点滴...',
          hintStyle: TextStyle(
            color: AppColors.secondaryText,
            fontSize: 14.sp,
          ),
          border: InputBorder.none,
        ),
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 14.sp,
          height: 1.5,
        ),
      ),
    );
  }

  // 构建图片网格
  Widget _buildImageGrid() {
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8.w,
            crossAxisSpacing: 8.w,
          ),
          itemCount:
              controller.images.length + (controller.images.length < 9 ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == controller.images.length) {
              return GestureDetector(
                onTap: () => controller.onPickImage(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    Icons.add_photo_alternate_outlined,
                    color: AppColors.secondaryText,
                    size: 32.w,
                  ),
                ),
              );
            }
            return Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.file(
                    controller.images[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Positioned(
                  top: 4.w,
                  right: 4.w,
                  child: GestureDetector(
                    onTap: () => controller.onRemoveImage(index),
                    child: Container(
                      padding: EdgeInsets.all(4.w),
                      decoration: const BoxDecoration(
                        color: Colors.black38,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 16.w,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
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
          '发布动态',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryText,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () => controller.onPublish(),
            child: Text(
              '发布',
              style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xFF6C5CE7),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildContentInput(),
          _buildImageGrid(),
        ],
      ),
    );
  }
}
