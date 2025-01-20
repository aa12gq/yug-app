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
      backgroundColor: const Color(0xFFF8FBFB),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          _buildAppBar(),
          _buildDailyMood(),
          _buildFeatureGrid(),
          _buildTrendingTopics(),
          _buildRecommendedActivities(),
          _buildCommunityHighlights(),
          SliverToBoxAdapter(child: SizedBox(height: 20.h)),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 120.h,
      floating: false,
      pinned: true,
      backgroundColor: const Color(0xFF88D4D4),
      elevation: 0,
      stretch: true,
      stretchTriggerOffset: 100.h,
      centerTitle: false,
      titleSpacing: 0,
      title: Row(
        children: [
          SizedBox(width: 20.w),
          Text(
            '语乐岛',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 4.w),
          Icon(
            Icons.flutter_dash,
            color: Colors.white,
            size: 16.w,
          ),
        ],
      ),
      onStretchTrigger: () async {
        // 下拉刷新的触发逻辑
        return;
      },
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double percent = ((constraints.maxHeight - kToolbarHeight) /
                  (120.h - kToolbarHeight))
              .clamp(0.0, 1.0);
          return FlexibleSpaceBar(
            background: Stack(
              children: [
                // 背景渐变
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFF88C9C9),
                        const Color(0xFF7BAFAF),
                      ],
                    ),
                  ),
                ),
                // 左上角的太阳装饰
                Positioned(
                  left: -20.w,
                  top: -20.h,
                  child: Container(
                    width: 100.w,
                    height: 100.w,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                // 右侧的云朵装饰1
                Positioned(
                  right: 40.w,
                  top: 30.h,
                  child: Container(
                    width: 60.w,
                    height: 25.h,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                ),
                // 右侧的云朵装饰2
                Positioned(
                  right: 80.w,
                  top: 50.h,
                  child: Container(
                    width: 40.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                ),
                // 小岛装饰
                Positioned(
                  right: 20.w,
                  bottom: 20.h,
                  child: Container(
                    width: 80.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.r),
                        topRight: Radius.circular(40.r),
                        bottomLeft: Radius.circular(10.r),
                        bottomRight: Radius.circular(10.r),
                      ),
                    ),
                    child: Stack(
                      children: [
                        // 小树1
                        Positioned(
                          left: 20.w,
                          top: 5.h,
                          child: Container(
                            width: 10.w,
                            height: 15.h,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                          ),
                        ),
                        // 小树2
                        Positioned(
                          left: 35.w,
                          top: 8.h,
                          child: Container(
                            width: 8.w,
                            height: 12.h,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // 波浪装饰
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 20.h,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.r),
                        topRight: Radius.circular(30.r),
                      ),
                    ),
                  ),
                ),
                // 内容区域
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 32.h),
                                Opacity(
                                  opacity: percent,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.w, vertical: 6.h),
                                    decoration: BoxDecoration(
                                      color:
                                          Colors.white.withValues(alpha: 0.2),
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: Text(
                                      '探索你的情绪世界，创造独特的心灵空间',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.white,
                                        height: 1.2,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Opacity(
                            opacity: percent,
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.search,
                                      color: Colors.white, size: 24.w),
                                  onPressed: () => controller.onSearch(),
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints.tightFor(
                                    width: 40.w,
                                    height: 40.w,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.notifications_outlined,
                                      color: Colors.white, size: 24.w),
                                  onPressed: () => controller.onNotification(),
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints.tightFor(
                                    width: 40.w,
                                    height: 40.w,
                                  ),
                                ),
                              ],
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
        },
      ),
    );
  }

  Widget _buildDailyMood() {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 10.h),
        padding: EdgeInsets.all(15.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '今日心情',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF333333),
                  ),
                ),
                TextButton(
                  onPressed: () => controller.onEmotionMap(),
                  child: Text(
                    '查看更多',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xFF88D4D4),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildMoodItem('开心', Icons.sentiment_very_satisfied,
                    const Color(0xFF88C9C9)),
                _buildMoodItem(
                    '平静', Icons.sentiment_neutral, const Color(0xFF88C9C9)),
                _buildMoodItem('疲惫', Icons.sentiment_dissatisfied,
                    const Color(0xFFB4ACCD)),
                _buildMoodItem('焦虑', Icons.sentiment_very_dissatisfied,
                    const Color(0xFFE2B1B1)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoodItem(String label, IconData icon, Color color) {
    return GestureDetector(
      onTap: () => controller.onMoodWeather(),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              // 主圆形容器
              Container(
                width: 50.w,
                height: 50.w,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: color.withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 28.w,
                ),
              ),
              // 右上装饰
              Positioned(
                right: -2.w,
                top: -2.h,
                child: Container(
                  width: 12.w,
                  height: 12.w,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: color.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                ),
              ),
              // 左下装饰
              Positioned(
                left: -4.w,
                bottom: -4.h,
                child: Container(
                  width: 16.w,
                  height: 16.w,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: color.withValues(alpha: 0.2),
                      width: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureGrid() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15.h,
          crossAxisSpacing: 15.w,
          childAspectRatio: 1.2,
        ),
        delegate: SliverChildListDelegate([
          _buildFeatureItem(
            '创意岛屿',
            '展现你的创意天地',
            Icons.palette,
            const Color(0xFF88C9C9),
            () => controller.onCreativeIsland(),
          ),
          _buildFeatureItem(
            '主题空间',
            '发现精彩主题活动',
            Icons.category,
            const Color(0xFF88C9C9),
            () => controller.onThemeSpace(),
          ),
          _buildFeatureItem(
            '互动游戏',
            '趣味情绪互动',
            Icons.games,
            const Color(0xFFB4ACCD),
            () => controller.onInteractiveGames(),
          ),
          _buildFeatureItem(
            '创意展示',
            '展示你的才艺',
            Icons.star,
            const Color(0xFFE8B87B),
            () => controller.onCreativeShowcase(),
          ),
        ]),
      ),
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
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.1),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // 背景装饰1
            Positioned(
              right: -15.w,
              top: -15.h,
              child: Container(
                width: 80.w,
                height: 80.w,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.05),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // 背景装饰2
            Positioned(
              left: -10.w,
              bottom: -10.h,
              child: Container(
                width: 50.w,
                height: 50.w,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.05),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // 内容
            Padding(
              padding: EdgeInsets.all(15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.w,
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: color.withValues(alpha: 0.2),
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          icon,
                          color: color,
                          size: 20.w,
                        ),
                      ),
                      // 图标装饰
                      Positioned(
                        right: -6.w,
                        bottom: -6.h,
                        child: Container(
                          width: 16.w,
                          height: 16.w,
                          decoration: BoxDecoration(
                            color: color.withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: color.withValues(alpha: 0.2),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: color,
                      ),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: color.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrendingTopics() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '热门话题',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    '更多',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xFF6B8EFF),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 120.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  width: 200.w,
                  margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: -20.w,
                        bottom: -20.h,
                        child: Container(
                          width: 100.w,
                          height: 100.w,
                          decoration: BoxDecoration(
                            color:
                                const Color(0xFF94A6B7).withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '#今日心情#',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: const Color(0xFF94A6B7),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              '分享你的每日心情，发现更多同频好友',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColors.secondaryText,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              '1.2k 参与',
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendedActivities() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '推荐活动',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText,
                  ),
                ),
                TextButton(
                  onPressed: () => controller.onIslandActivities(),
                  child: Text(
                    '更多',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xFF6B8EFF),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 180.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  width: 280.w,
                  margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFF94A6B7).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.r),
                            topRight: Radius.circular(15.r),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.image,
                            size: 40.w,
                            color: const Color(0xFF94A6B7),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '情绪艺术创作工作坊',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryText,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              '通过艺术创作表达内心情感',
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommunityHighlights() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '社区精选',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText,
                  ),
                ),
                TextButton(
                  onPressed: () => controller.onIslandCoCreation(),
                  child: Text(
                    '更多',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xFF6B8EFF),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 15.h),
                padding: EdgeInsets.all(15.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 50.w,
                      height: 50.w,
                      decoration: const BoxDecoration(
                        color: Color(0xFF94A6B7),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          'YL',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '语乐岛用户',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryText,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            '分享了一篇关于情绪管理的心得...',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.secondaryText,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
