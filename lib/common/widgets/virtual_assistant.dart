import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yug_app/common/widgets/virtual_assistant/anime_painter.dart';

class VirtualAssistant extends StatelessWidget {
  final double? size;
  final VoidCallback? onTap;
  final bool showOptions;

  const VirtualAssistant({
    super.key,
    this.size,
    this.onTap,
    this.showOptions = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: showOptions ? () => _showOptions() : onTap,
      child: SizedBox(
        width: size ?? 80.w,
        height: size ?? 80.w,
        child: CustomPaint(
          painter: AnimePainter(),
        ),
      ),
    );
  }

  void _showOptions() {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "虚拟助手设置",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.h),
            _buildOption(
              "更换形象",
              Icons.style,
              () => Get.toNamed('/avatar/customize'),
            ),
            _buildOption(
              "个性设置",
              Icons.psychology,
              () => Get.toNamed('/avatar/personality'),
            ),
            _buildOption(
              "互动记录",
              Icons.history,
              () => Get.toNamed('/avatar/interactions'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(Get.context!).primaryColor),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
