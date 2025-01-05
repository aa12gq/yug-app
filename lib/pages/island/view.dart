import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_app/common/index.dart';

import 'index.dart';

class IslandPage extends GetView<IslandController> {
  const IslandPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 确保 ScreenUtil 已初始化
    ScreenUtil.init(context);

    return Scaffold(
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
      backgroundColor: Colors.transparent,
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

  // 构建功能模块卡片
  Widget _buildFeatureCard(
    String title,
    String subtitle,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        child: Container(
          padding: EdgeInsets.all(12.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 28.w, color: color),
              SizedBox(height: 8.h),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryText,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 11.sp,
                  color: AppColors.secondaryText,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 构建网格布局
  Widget _buildFeatureGrid(String title, List<Widget> children) {
    return Column(
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
        SizedBox(height: 8.h),
        GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12.w,
            crossAxisSpacing: 12.w,
            mainAxisExtent: 110.h, // 固定高度
          ),
          children: children,
        ),
      ],
    );
  }

  // 构建主要内容
  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 情绪板块
            _buildFeatureGrid(
              '今日心情',
              [
                _buildFeatureCard(
                  '情绪地图',
                  '探索你的情绪世界',
                  Icons.mood,
                  Colors.blue,
                  () => controller.onEmotionMap(),
                ),
                _buildFeatureCard(
                  '心情天气',
                  '分享此刻的感受',
                  Icons.cloud,
                  Colors.orange,
                  () => controller.onMoodWeather(),
                ),
              ],
            ),

            SizedBox(height: 16.h),

            // 创意空间
            _buildFeatureGrid(
              '创意空间',
              [
                _buildFeatureCard(
                  '创意岛屿',
                  '展现你的创意天地',
                  Icons.palette,
                  Colors.purple,
                  () => controller.onCreativeIsland(),
                ),
                _buildFeatureCard(
                  '主题空间',
                  '发现精彩主题活动',
                  Icons.category,
                  Colors.green,
                  () => controller.onThemeSpace(),
                ),
              ],
            ),

            SizedBox(height: 16.h),

            // 互动板块
            _buildFeatureGrid(
              '互动天地',
              [
                _buildFeatureCard(
                  '互动游戏',
                  '趣味情绪互动',
                  Icons.games,
                  Colors.red,
                  () => controller.onInteractiveGames(),
                ),
                _buildFeatureCard(
                  '创意展示',
                  '展示你的才艺',
                  Icons.star,
                  Colors.amber,
                  () => controller.onCreativeShowcase(),
                ),
              ],
            ),

            SizedBox(height: 16.h),

            // 社区板块
            _buildFeatureGrid(
              '岛民社区',
              [
                _buildFeatureCard(
                  '岛民活动',
                  '参与精彩社区活动',
                  Icons.people,
                  Colors.teal,
                  () => controller.onIslandActivities(),
                ),
                _buildFeatureCard(
                  '岛屿共创',
                  '共建美好社区',
                  Icons.handshake,
                  Colors.indigo,
                  () => controller.onIslandCoCreation(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
