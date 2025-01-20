import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_app/common/index.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

import 'index.dart';

class ThemePage extends GetView<ThemeController> {
  const ThemePage({super.key});

  // 构建颜色选择项
  Widget _buildColorItem({
    required Color color,
    required bool isSelected,
    required VoidCallback onTap,
    required String colorKey,
  }) {
    return Builder(builder: (context) {
      final isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
      return GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 75.w,
          height: 110.h,
          decoration: BoxDecoration(
            color: isDark ? Colors.black.withValues(alpha: 0.3) : Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: isSelected ? color : Colors.transparent,
              width: isSelected ? 2 : 0,
            ),
            boxShadow: [
              BoxShadow(
                color: isSelected
                    ? color.withValues(alpha: 0.2)
                    : Colors.black.withValues(alpha: isDark ? 0.3 : 0.05),
                blurRadius: isSelected ? 12 : 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            children: [
              if (isSelected)
                Positioned(
                  right: 8.w,
                  top: 8.h,
                  child: Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 12.w,
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 16.h, 0, 8.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 36.w,
                      height: 36.w,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isDark
                              ? Colors.black.withValues(alpha: 0.3)
                              : Colors.white,
                          width: 3,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: color.withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      AppTheme.themeColorNames[colorKey] ?? '',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: isDark
                            ? Colors.white.withValues(alpha: 0.9)
                            : AppColors.primaryText,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  // 构建主题模式项
  Widget _buildThemeModeItem({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isSelected
              ? (isDark
                  ? AppTheme.primary.withValues(alpha: 0.15)
                  : AppTheme.primary.withValues(alpha: 0.08))
              : (isDark ? Colors.black.withValues(alpha: 0.3) : Colors.white),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? AppTheme.primary : Colors.transparent,
            width: isSelected ? 2 : 0,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? AppTheme.primary.withValues(alpha: 0.2)
                  : Colors.black.withValues(alpha: isDark ? 0.3 : 0.05),
              blurRadius: isSelected ? 12 : 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppTheme.primary
                    : (isDark
                        ? Colors.white.withValues(alpha: 0.1)
                        : AppTheme.primary.withValues(alpha: 0.1)),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                icon,
                color: isSelected
                    ? Colors.white
                    : (isDark
                        ? Colors.white.withValues(alpha: 0.9)
                        : AppTheme.primary),
                size: 20.w,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white : AppColors.primaryText,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: isDark
                          ? Colors.white.withValues(alpha: 0.7)
                          : AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Container(
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  color: AppTheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                  size: 14.w,
                ),
              ),
          ],
        ),
      ),
    );
  }

  // 构建颜色分类
  Widget _buildColorSection(
      String title, List<MapEntry<String, Color>> colors) {
    return Builder(builder: (context) {
      final isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isDark ? Colors.black.withValues(alpha: 0.3) : Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(6.w),
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withOpacity(isDark ? 0.2 : 0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    title == '经典色系'
                        ? Icons.palette_outlined
                        : Icons.brush_outlined,
                    color: AppTheme.primary,
                    size: 16.w,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.9)
                        : AppColors.primaryText,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: colors.map((entry) {
                  return Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: _buildColorItem(
                      color: entry.value,
                      colorKey: entry.key,
                      isSelected: controller.currentThemeColor == entry.key,
                      onTap: () => controller.onThemeColorSelected(entry.key),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
    return GetBuilder<ThemeController>(
      init: ThemeController(),
      id: "theme",
      builder: (_) {
        // 将颜色分类为经典色系和莫兰迪色系
        final classicColors = controller.themeColors.entries
            .where((e) => !e.key.startsWith('morandi_'))
            .toList();
        final morandiColors = controller.themeColors.entries
            .where((e) => e.key.startsWith('morandi_'))
            .toList();

        return Scaffold(
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                expandedHeight: 200.h,
                pinned: true,
                stretch: true,
                backgroundColor: isDark
                    ? AppTheme.primary.withValues(alpha: 0.6)
                    : AppTheme.primary,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppTheme.primary,
                          AppTheme.primary.withValues(alpha: 0.8),
                        ],
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: -30.w,
                          top: -30.h,
                          child: Container(
                            width: 150.w,
                            height: 150.w,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Positioned(
                          left: -20.w,
                          bottom: -40.h,
                          child: Container(
                            width: 120.w,
                            height: 120.w,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.palette_outlined,
                                color: Colors.white,
                                size: 40.w,
                              ),
                              SizedBox(height: 16.h),
                              Text(
                                "个性化您的应用主题",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                "选择适合您的显示模式和主题颜色",
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.8),
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              color: AppTheme.primary
                                  .withOpacity(isDark ? 0.2 : 0.1),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Icon(
                              Icons.brightness_4_outlined,
                              color: AppTheme.primary,
                              size: 20.w,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            '主题模式',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color:
                                  isDark ? Colors.white : AppColors.primaryText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    _buildThemeModeItem(
                      title: '浅色模式',
                      subtitle: '明亮清新的界面风格',
                      icon: Icons.light_mode_outlined,
                      isSelected: controller.currentThemeMode == 'light',
                      onTap: () => controller.onThemeModeSelected('light'),
                      isDark: isDark,
                    ),
                    SizedBox(height: 12.h),
                    _buildThemeModeItem(
                      title: '深色模式',
                      subtitle: '护眼舒适的暗色模式',
                      icon: Icons.dark_mode_outlined,
                      isSelected: controller.currentThemeMode == 'dark',
                      onTap: () => controller.onThemeModeSelected('dark'),
                      isDark: isDark,
                    ),
                    SizedBox(height: 12.h),
                    _buildThemeModeItem(
                      title: '跟随系统',
                      subtitle: '自动适应系统主题设置',
                      icon: Icons.settings_brightness_outlined,
                      isSelected: controller.currentThemeMode == 'system',
                      onTap: () => controller.onThemeModeSelected('system'),
                      isDark: isDark,
                    ),
                    SizedBox(height: 32.h),
                    _buildColorSection('经典色系', classicColors),
                    SizedBox(height: 16.h),
                    _buildColorSection('莫兰迪色系', morandiColors),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
