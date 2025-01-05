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
      backgroundColor: const Color(0xFFF5F7FF),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(52.h),
        child: _buildAppBar(),
      ),
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        '语乐岛',
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryText,
          letterSpacing: 0.5,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search, color: AppColors.primaryText, size: 22.w),
          onPressed: () => controller.onSearch(),
        ),
        IconButton(
          icon: Icon(Icons.notifications_outlined,
              color: AppColors.primaryText, size: 22.w),
          onPressed: () => controller.onNotification(),
        ),
      ],
    );
  }

  Widget _buildFeatureItem(
    String title,
    String subtitle,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              right: -10.w,
              top: -10.h,
              child: Container(
                width: 60.w,
                height: 60.w,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 45.w,
                    height: 45.w,
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Icon(
                      icon,
                      color: color,
                      size: 24.w,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryText,
                          letterSpacing: 0.3,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.secondaryText,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, String subtitle) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 15.h),
      child: Row(
        children: [
          Container(
            width: 4.w,
            height: 20.h,
            decoration: BoxDecoration(
              color: const Color(0xFF6B8EFF),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryText,
                  letterSpacing: 0.3,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.secondaryText,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('今日心情', '探索和分享你的情绪世界'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 15.h,
              crossAxisSpacing: 15.w,
              childAspectRatio: 0.85,
              children: [
                _buildFeatureItem(
                  '情绪地图',
                  '探索你的情绪世界',
                  Icons.mood,
                  const Color(0xFF5B7FFF),
                  () => controller.onEmotionMap(),
                ),
                _buildFeatureItem(
                  '心情天气',
                  '分享此刻的感受',
                  Icons.cloud,
                  const Color(0xFFFF7E65),
                  () => controller.onMoodWeather(),
                ),
              ],
            ),
          ),
          _buildSectionTitle('创意空间', '展现你的独特创意'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 15.h,
              crossAxisSpacing: 15.w,
              childAspectRatio: 0.85,
              children: [
                _buildFeatureItem(
                  '创意岛屿',
                  '展现你的创意天地',
                  Icons.palette,
                  const Color(0xFF9B6DFF),
                  () => controller.onCreativeIsland(),
                ),
                _buildFeatureItem(
                  '主题空间',
                  '发现精彩主题活动',
                  Icons.category,
                  const Color(0xFF4CD080),
                  () => controller.onThemeSpace(),
                ),
              ],
            ),
          ),
          _buildSectionTitle('互动天地', '趣味互动，展示才艺'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 15.h,
              crossAxisSpacing: 15.w,
              childAspectRatio: 0.85,
              children: [
                _buildFeatureItem(
                  '互动游戏',
                  '趣味情绪互动',
                  Icons.games,
                  const Color(0xFFFF6B8E),
                  () => controller.onInteractiveGames(),
                ),
                _buildFeatureItem(
                  '创意展示',
                  '展示你的才艺',
                  Icons.star,
                  const Color(0xFFFFB347),
                  () => controller.onCreativeShowcase(),
                ),
              ],
            ),
          ),
          _buildSectionTitle('岛民社区', '共建美好社区'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 15.h,
              crossAxisSpacing: 15.w,
              childAspectRatio: 0.85,
              children: [
                _buildFeatureItem(
                  '岛民活动',
                  '参与精彩社区活动',
                  Icons.people,
                  const Color(0xFF3ECBB0),
                  () => controller.onIslandActivities(),
                ),
                _buildFeatureItem(
                  '岛屿共创',
                  '共建美好社区',
                  Icons.handshake,
                  const Color(0xFF5B7FFF),
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
