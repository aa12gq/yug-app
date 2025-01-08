import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_app/common/index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'index.dart';
import 'widgets/comment_input.dart';
import 'widgets/comment_list.dart';
import 'widgets/image_preview.dart';

class CirclePage extends GetView<CircleController> {
  const CirclePage({super.key});

  // 构建封面
  Widget _buildCover() {
    return Container(
      height: 200.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const NetworkImage(
            'https://images.unsplash.com/photo-1522441815192-d9f04eb0615c',
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3),
            BlendMode.darken,
          ),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 20.w,
            bottom: 20.h,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24.r,
                  backgroundImage: const NetworkImage(
                    'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde',
                  ),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '语友圈',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '分享你的学习心得',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
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
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundImage: NetworkImage(moment['userAvatar']),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    moment['userName'],
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryText,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    moment['timeAgo'],
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            moment['content'],
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.primaryText,
              height: 1.5,
            ),
          ),
          if (moment['images'] != null && moment['images'].isNotEmpty) ...[
            SizedBox(height: 12.h),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8.w,
                crossAxisSpacing: 8.w,
              ),
              itemCount: moment['images'].length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(
                      () => ImagePreview(
                        imageUrls: moment['images'],
                        initialIndex: index,
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.network(
                      moment['images'][index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ],
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => controller.onLike(moment['id']),
                    child: Row(
                      children: [
                        Icon(
                          moment['isLiked']
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 20.w,
                          color: moment['isLiked']
                              ? Colors.red
                              : AppColors.secondaryText,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          moment['likes'].toString(),
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.secondaryText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.w),
                  GestureDetector(
                    onTap: () => controller.onComment(moment['id']),
                    child: Row(
                      children: [
                        Icon(
                          Icons.comment_outlined,
                          size: 20.w,
                          color: AppColors.secondaryText,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          moment['comments'].length.toString(),
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.secondaryText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => controller.onShare(moment['id']),
                child: Icon(
                  Icons.share_outlined,
                  size: 20.w,
                  color: AppColors.secondaryText,
                ),
              ),
            ],
          ),
          if (moment['comments'].isNotEmpty) ...[
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: CommentList(
                comments: moment['comments'],
                onReply: (userName, parent) =>
                    controller.onReply(moment['id'], userName, parent!),
              ),
            ),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          SmartRefresher(
            controller: controller.refreshController,
            onRefresh: controller.onRefresh,
            onLoading: controller.onLoading,
            enablePullUp: true,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 200.h,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: _buildCover(),
                  ),
                  actions: [
                    IconButton(
                      onPressed: controller.onPublish,
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                        size: 24.w,
                      ),
                    ),
                  ],
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Obx(
                          () => _buildMomentItem(controller.moments[index]));
                    },
                    childCount: controller.moments.length,
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => Visibility(
              visible: controller.showCommentInput.value,
              child: Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: CommentInput(
                  controller: controller.commentController,
                  onSubmit: (content) => controller.submitComment(content),
                  hintText:
                      '回复 ${controller.replyToUserName.value.isEmpty ? '' : controller.replyToUserName.value}',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
