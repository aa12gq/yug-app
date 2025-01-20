import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_app/common/index.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class ColorPreviewCard extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final String colorKey;
  final VoidCallback onTap;

  const ColorPreviewCard({
    Key? key,
    required this.color,
    required this.isSelected,
    required this.colorKey,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 100.w,
        height: 120.h,
        margin: EdgeInsets.only(right: 12.w),
        decoration: BoxDecoration(
          color: isDark ? Colors.black.withOpacity(0.3) : Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? color : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? color.withOpacity(0.3)
                  : Colors.black.withOpacity(isDark ? 0.3 : 0.05),
              blurRadius: isSelected ? 12 : 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 颜色展示
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [color, color.withOpacity(0.8)],
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: isSelected
                  ? Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 24.w,
                    )
                  : null,
            ),
            SizedBox(height: 12.h),
            // 颜色名称
            Text(
              AppTheme.themeColorNames[colorKey] ?? '',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isDark ? Colors.white : AppColors.primaryText,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4.h),
            // 提示文本
            Text(
              '点击预览',
              style: TextStyle(
                fontSize: 11.sp,
                color: isDark
                    ? Colors.white.withOpacity(0.5)
                    : AppColors.secondaryText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
