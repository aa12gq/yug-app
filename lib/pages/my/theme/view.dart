import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_app/common/index.dart';

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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80.w,
        height: 90.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? color : Colors.grey.withOpacity(0.2),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: color.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  )
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check,
                      color: Colors.white,
                    )
                  : null,
            ),
            SizedBox(height: 8.h),
            Text(
              AppTheme.themeColorNames[colorKey] ?? '',
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.primaryText,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 主视图
  Widget _buildView() {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '主题模式',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
            ),
          ),
          SizedBox(height: 16.h),
          _buildThemeModeItem(
            title: '浅色模式',
            subtitle: '明亮清新的界面风格',
            icon: Icons.light_mode_outlined,
            isSelected: controller.currentThemeMode == 'light',
            onTap: () => controller.onThemeModeSelected('light'),
          ),
          SizedBox(height: 12.h),
          _buildThemeModeItem(
            title: '深色模式',
            subtitle: '护眼舒适的暗色模式',
            icon: Icons.dark_mode_outlined,
            isSelected: controller.currentThemeMode == 'dark',
            onTap: () => controller.onThemeModeSelected('dark'),
          ),
          SizedBox(height: 12.h),
          _buildThemeModeItem(
            title: '跟随系统',
            subtitle: '自动适应系统主题设置',
            icon: Icons.settings_brightness_outlined,
            isSelected: controller.currentThemeMode == 'system',
            onTap: () => controller.onThemeModeSelected('system'),
          ),
          SizedBox(height: 32.h),
          Text(
            '主题颜色',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
            ),
          ),
          SizedBox(height: 16.h),
          Wrap(
            spacing: 12.w,
            runSpacing: 12.h,
            children: controller.themeColors.entries.map((entry) {
              return _buildColorItem(
                color: entry.value,
                colorKey: entry.key,
                isSelected: controller.currentThemeColor == entry.key,
                onTap: () => controller.onThemeColorSelected(entry.key),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // 构建主题模式选项
  Widget _buildThemeModeItem({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primary.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? AppTheme.primary : Colors.grey.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppTheme.primary
                    : Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                icon,
                color: isSelected ? Colors.white : Colors.grey,
                size: 20.w,
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
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryText,
                    ),
                  ),
                  SizedBox(height: 4.h),
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
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: AppTheme.primary,
                size: 20.w,
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: ThemeController(),
      id: "theme",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("主题设置")),
          body: SafeArea(
            child: SingleChildScrollView(
              child: _buildView(),
            ),
          ),
        );
      },
    );
  }
}
