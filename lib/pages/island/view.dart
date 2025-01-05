import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_app/common/index.dart';

import 'index.dart';

class IslandPage extends GetView<IslandController> {
  const IslandPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: _buildAppBar(),
      ),
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  // 构建顶部导航栏
  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        '语乐岛',
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryText,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: AppColors.primaryText),
          onPressed: () => controller.onSearch(),
        ),
        IconButton(
          icon: const Icon(Icons.notifications_outlined,
              color: AppColors.primaryText),
          onPressed: () => controller.onNotification(),
        ),
      ],
    );
  }

  // 构建功能模块项
  Widget _buildFeatureItem(
    String title,
    String subtitle,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: color.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                icon,
                color: color,
                size: 24.w,
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
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryText,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: color,
              size: 16.w,
            ),
          ],
        ),
      ),
    );
  }

  // 构建分区标题
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        children: [
          Container(
            width: 4.w,
            height: 16.h,
            decoration: BoxDecoration(
              color: const Color(0xFF5C78FF),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryText,
            ),
          ),
        ],
      ),
    );
  }

  // 构建主要内容
  Widget _buildBody() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 情绪板块
          _buildSectionTitle('今日心情'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                _buildFeatureItem(
                  '情绪地图',
                  '探索你的情绪世界',
                  Icons.mood,
                  Colors.blue,
                  () => controller.onEmotionMap(),
                ),
                SizedBox(height: 12.h),
                _buildFeatureItem(
                  '心情天气',
                  '分享此刻的感受',
                  Icons.cloud,
                  Colors.orange,
                  () => controller.onMoodWeather(),
                ),
              ],
            ),
          ),

          // 创意空间
          _buildSectionTitle('创意空间'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                _buildFeatureItem(
                  '创意岛屿',
                  '展现你的创意天地',
                  Icons.palette,
                  Colors.purple,
                  () => controller.onCreativeIsland(),
                ),
                SizedBox(height: 12.h),
                _buildFeatureItem(
                  '主题空间',
                  '发现精彩主题活动',
                  Icons.category,
                  Colors.green,
                  () => controller.onThemeSpace(),
                ),
              ],
            ),
          ),

          // 互动板块
          _buildSectionTitle('互动天地'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                _buildFeatureItem(
                  '互动游戏',
                  '趣味情绪互动',
                  Icons.games,
                  Colors.red,
                  () => controller.onInteractiveGames(),
                ),
                SizedBox(height: 12.h),
                _buildFeatureItem(
                  '创意展示',
                  '展示你的才艺',
                  Icons.star,
                  Colors.amber,
                  () => controller.onCreativeShowcase(),
                ),
              ],
            ),
          ),

          // 社区板块
          _buildSectionTitle('岛民社区'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                _buildFeatureItem(
                  '岛民活动',
                  '参与精彩社区活动',
                  Icons.people,
                  Colors.teal,
                  () => controller.onIslandActivities(),
                ),
                SizedBox(height: 12.h),
                _buildFeatureItem(
                  '岛屿共创',
                  '共建美好社区',
                  Icons.handshake,
                  Colors.indigo,
                  () => controller.onIslandCoCreation(),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
