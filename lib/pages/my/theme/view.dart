import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_app/common/index.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'widgets/color_preview_card.dart';
import 'widgets/theme_mode_item.dart';

import 'index.dart';

class ThemePage extends GetView<ThemeController> {
  const ThemePage({super.key});

  Widget _buildColorSection(
      String title, List<MapEntry<String, Color>> colors) {
    return Builder(builder: (context) {
      final isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withOpacity(isDark ? 0.2 : 0.1),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Icon(
                    title == '经典色系'
                        ? Icons.palette_outlined
                        : Icons.brush_outlined,
                    color: AppTheme.primary,
                    size: 20.w,
                  ),
                ),
                SizedBox(width: 12.w),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.white : AppColors.primaryText,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 120.h,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: colors.length,
              itemBuilder: (context, index) {
                final entry = colors[index];
                return ColorPreviewCard(
                  color: entry.value,
                  colorKey: entry.key,
                  isSelected: controller.currentThemeColor == entry.key,
                  onTap: () => controller.onThemeColorSelected(entry.key),
                );
              },
            ),
          ),
        ],
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
                expandedHeight: 100.h,
                pinned: true,
                stretch: true,
                elevation: 0,
                backgroundColor: isDark
                    ? AppTheme.primary.withValues(alpha: 0.6)
                    : AppTheme.primary,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppTheme.primary,
                          AppTheme.primary.withValues(alpha: 0.85),
                        ],
                      ),
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Positioned(
                          right: -15.w,
                          top: -15.h,
                          child: Container(
                            width: 80.w,
                            height: 80.w,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.08),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8.w),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Icon(
                                  Icons.palette_outlined,
                                  color: Colors.white,
                                  size: 24.w,
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "个性化",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      "打造专属于您的界面风格",
                                      style: TextStyle(
                                        color: Colors.white
                                            .withValues(alpha: 0.85),
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                  ],
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
                                  .withValues(alpha: isDark ? 0.2 : 0.1),
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
                    ThemeModeItem(
                      title: '浅色模式',
                      subtitle: '明亮清新的界面风格',
                      icon: Icons.light_mode_outlined,
                      isSelected: controller.currentThemeMode == 'light',
                      onTap: () => controller.onThemeModeSelected('light'),
                      isDark: isDark,
                    ),
                    SizedBox(height: 12.h),
                    ThemeModeItem(
                      title: '深色模式',
                      subtitle: '护眼舒适的暗色模式',
                      icon: Icons.dark_mode_outlined,
                      isSelected: controller.currentThemeMode == 'dark',
                      onTap: () => controller.onThemeModeSelected('dark'),
                      isDark: isDark,
                    ),
                    SizedBox(height: 12.h),
                    ThemeModeItem(
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
