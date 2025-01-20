import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_app/common/index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'dart:ui';

import 'index.dart';
import 'widgets/comment_input.dart';
import 'widgets/comment_list.dart';
import 'widgets/image_preview.dart';

class CirclePage extends GetView<CircleController> {
  const CirclePage({super.key});

  // 构建顶部个人信息区域
  Widget _buildHeader() {
    return SizedBox(
      height: 280.h,
      child: Stack(
        children: [
          // 背景图和毛玻璃效果
          ClipRect(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    'https://images.unsplash.com/photo-1522441815192-d9f04eb0615c',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.1),
                            Colors.black.withValues(alpha: 0.7),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 用户信息
          Positioned(
            left: 20.w,
            bottom: 40.h,
            right: 20.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 头像和编辑按钮
                Row(
                  children: [
                    Container(
                      width: 75.w,
                      height: 75.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(75.w),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                            color: Colors.white.withValues(alpha: 0.3)),
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
                            '编辑资料',
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                // 用户名和签名
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black.withValues(alpha: 0.3),
                        offset: const Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  '这里是个性签名',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.white.withValues(alpha: 0.9),
                    shadows: [
                      Shadow(
                        color: Colors.black.withValues(alpha: 0.3),
                        offset: const Offset(0, 1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 构建动态项
  Widget _buildMomentItem(dynamic moment) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 用户信息
          Padding(
            padding: EdgeInsets.fromLTRB(10.w, 10.w, 10.w, 6.w),
            child: Row(
              children: [
                Container(
                  width: 32.w,
                  height: 32.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 1.5,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(32.w),
                    child: Image.network(
                      moment['userAvatar'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        moment['userName'],
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryText,
                        ),
                      ),
                      Text(
                        moment['timeAgo'],
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: AppColors.secondaryText,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.more_horiz,
                  size: 18.w,
                  color: AppColors.secondaryText,
                ),
              ],
            ),
          ),

          // 内容
          if (moment['content'].isNotEmpty)
            Padding(
              padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 6.w),
              child: Text(
                moment['content'],
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.primaryText,
                  height: 1.3,
                ),
              ),
            ),

          // 图片
          if (moment['images'] != null && moment['images'].isNotEmpty)
            Padding(
              padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 6.w),
              child: _buildImageGrid(moment['images']),
            ),

          // 互动栏
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Row(
              children: [
                _buildInteractionButton(
                  icon: moment['isLiked']
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color:
                      moment['isLiked'] ? Colors.red : AppColors.secondaryText,
                  count: moment['likes'],
                  onTap: () => controller.onLike(moment['id']),
                ),
                SizedBox(width: 12.w),
                _buildInteractionButton(
                  icon: Icons.chat_bubble_outline,
                  color: AppColors.secondaryText,
                  count: moment['comments'].length,
                  onTap: () => controller.onComment(moment['id']),
                ),
              ],
            ),
          ),

          // 评论区
          if (moment['comments'].isNotEmpty)
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FA),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.r),
                  bottomRight: Radius.circular(8.r),
                ),
              ),
              child: CommentList(
                comments: moment['comments'],
                onReply: (userName, parent) =>
                    controller.onReply(moment['id'], userName, parent!),
              ),
            ),
        ],
      ),
    );
  }

  // 构建图片网格
  Widget _buildImageGrid(List<String> images) {
    if (images.length == 1) {
      return GestureDetector(
        onTap: () =>
            Get.to(() => ImagePreview(imageUrls: images, initialIndex: 0)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6.r),
          child: Image.network(
            images[0],
            width: 160.w,
            height: 160.w,
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: images.length >= 3 ? 3 : 2,
        mainAxisSpacing: 3.w,
        crossAxisSpacing: 3.w,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Get.to(
            () => ImagePreview(
              imageUrls: images,
              initialIndex: index,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: Image.network(
              images[index],
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  // 构建互动按钮
  Widget _buildInteractionButton({
    required IconData icon,
    required Color color,
    required int count,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 15.w,
              color: color,
            ),
            SizedBox(width: 3.w),
            Text(
              count.toString(),
              style: TextStyle(
                fontSize: 12.sp,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "语友圈",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(RouteNames.momentsPublish),
            icon: Icon(
              Icons.add_circle_outline,
              size: 24.w,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // 顶部封面
          SliverToBoxAdapter(
            child: _buildHeader(),
          ),
          // 动态列表
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 6.h),
            sliver: GetBuilder<CircleController>(
              builder: (_) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return _buildMomentItem(controller.moments[index]);
                    },
                    childCount: controller.moments.length,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
