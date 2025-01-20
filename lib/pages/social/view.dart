import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_app/common/index.dart';

import 'index.dart';

class SocialPage extends GetView<SocialController> {
  const SocialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SocialController>(
      init: SocialController(),
      id: "social",
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: _buildTitle(),
            actions: [
              IconButton(
                onPressed: () => controller.onSearch(),
                icon: Container(
                  padding: EdgeInsets.all(6.w),
                  decoration: BoxDecoration(
                    color: AppTheme.secondary.withValues(alpha: 0.06),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    Icons.search_rounded,
                    color: AppTheme.secondary,
                    size: 16.w,
                  ),
                ),
              ),
            ],
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0, 0.3],
                colors: [
                  Colors.white,
                  AppColors.background.withValues(alpha: 0.5),
                ],
              ),
            ),
            child: Column(
              children: [
                // 消息分类标签
                _buildTabs(),
                // 内容区域
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 8.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.r),
                        topRight: Radius.circular(24.r),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.02),
                          offset: const Offset(0, -2),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.r),
                        topRight: Radius.circular(24.r),
                      ),
                      child: GestureDetector(
                        onHorizontalDragEnd: (details) {
                          if (details.primaryVelocity == 0) return;
                          if (details.primaryVelocity! > 0) {
                            // 向右滑动
                            if (controller.currentTab == 0) {
                              controller.onPrevious(); // 切换到上一个导航项
                            }
                          } else {
                            // 向左滑动
                            if (controller.currentTab == 1) {
                              controller.onNext(); // 切换到下一个导航项
                            }
                          }
                        },
                        child: PageView(
                          controller: controller.pageController,
                          onPageChanged: controller.switchTab,
                          children: [
                            _buildMessageList(),
                            _buildNotificationList(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // 构建标题
  Widget _buildTitle() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppTheme.secondary.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "社交",
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryText,
            ),
          ),
          SizedBox(width: 4.w),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
            decoration: BoxDecoration(
              color: AppTheme.secondary,
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Text(
              "99+",
              style: TextStyle(
                fontSize: 9.sp,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 构建分类标签
  Widget _buildTabs() {
    return Container(
      height: 32.h,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            offset: const Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        children: [
          _buildTabItem(0, Icons.chat_bubble_outline_rounded, "私信"),
          _buildTabItem(1, Icons.notifications_none_rounded, "通知"),
        ],
      ),
    );
  }

  // 构建标签项
  Widget _buildTabItem(int index, IconData icon, String label) {
    bool isSelected = controller.currentTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.switchTab(index),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.secondary : null,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 13.w,
                color: isSelected ? Colors.white : AppColors.secondaryText,
              ),
              SizedBox(width: 3.w),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? Colors.white : AppColors.secondaryText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 构建消息列表
  Widget _buildMessageList() {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
      itemCount: controller.messageList.length,
      itemBuilder: (context, index) {
        final message = controller.messageList[index];
        return _buildMessageItem(message);
      },
    );
  }

  // 构建消息项
  Widget _buildMessageItem(MessageModel message) {
    return GestureDetector(
      onTap: () => controller.onMessageDetail(message),
      child: Container(
        margin: EdgeInsets.only(bottom: 8.h),
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: AppColors.background,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // 头像
            Stack(
              children: [
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    color: AppTheme.secondary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10.r),
                    image: message.avatar != null
                        ? DecorationImage(
                            image: NetworkImage(message.avatar!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: message.avatar == null
                      ? Icon(
                          Icons.person_outline,
                          color: AppTheme.secondary,
                          size: 20.w,
                        )
                      : null,
                ),
                if (message.unreadCount > 0)
                  Positioned(
                    right: -2.w,
                    top: -2.h,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 3.w,
                        vertical: 1.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF6B6B),
                        borderRadius: BorderRadius.circular(6.r),
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        message.unreadCount.toString(),
                        style: TextStyle(
                          fontSize: 8.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(width: 10.w),
            // 消息内容
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        message.name,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryText,
                        ),
                      ),
                      Text(
                        message.lastTime,
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: AppColors.secondaryText,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    message.lastMessage,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.secondaryText,
                      height: 1.2,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 构建通知列表
  Widget _buildNotificationList() {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
      itemCount: controller.notificationList.length,
      itemBuilder: (context, index) {
        final notification = controller.notificationList[index];
        return _buildNotificationItem(notification);
      },
    );
  }

  // 构建通知项
  Widget _buildNotificationItem(NotificationModel notification) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.background,
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 图标
          Container(
            width: 32.w,
            height: 32.w,
            decoration: BoxDecoration(
              color: notification.color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              notification.icon,
              color: notification.color,
              size: 14.w,
            ),
          ),
          SizedBox(width: 10.w),
          // 通知内容
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      notification.title,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryText,
                      ),
                    ),
                    Text(
                      notification.time,
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
                Text(
                  notification.content,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: AppColors.secondaryText,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
