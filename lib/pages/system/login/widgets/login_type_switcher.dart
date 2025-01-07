import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yug_app/common/style/space.dart';
import 'package:yug_app/pages/system/login/controller.dart';

class LoginTypeSwitcher extends GetView<LoginController> {
  const LoginTypeSwitcher({super.key});

  void _handleSwipe(DragEndDetails details, List<Map<String, dynamic>> items,
      String currentType) {
    final currentIndex =
        items.indexWhere((item) => item['type'] == currentType);
    if (details.primaryVelocity! < 0 && currentIndex < items.length - 1) {
      // 向左滑动，切换到下一个
      controller.switchLoginType(items[currentIndex + 1]['type'] as String);
    } else if (details.primaryVelocity! > 0 && currentIndex > 0) {
      // 向右滑动，切换到上一个
      controller.switchLoginType(items[currentIndex - 1]['type'] as String);
    }
  }

  Widget _buildLoginTypeButton(
      BuildContext context, Map<String, dynamic> item, bool isSelected) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => controller.switchLoginType(item['type'] as String),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12.w),
            decoration: BoxDecoration(
              color: isSelected
                  ? context.theme.primaryColor.withOpacity(0.08)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12.w),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  item['icon'] as IconData,
                  size: 24.w,
                  color: isSelected ? context.theme.primaryColor : Colors.grey,
                ),
                SizedBox(height: 4.w),
                Text(
                  item['text'] as String,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color:
                        isSelected ? context.theme.primaryColor : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'type': 'username',
        'text': '账号密码',
        'icon': Icons.person_outline_rounded,
      },
      {
        'type': 'phone',
        'text': '手机号',
        'icon': Icons.phone_android_rounded,
      },
      {
        'type': 'email',
        'text': '邮箱',
        'icon': Icons.email_outlined,
      },
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Obx(() {
        final currentType = controller.loginType.value;

        return GestureDetector(
          onHorizontalDragEnd: (details) =>
              _handleSwipe(details, items, currentType),
          child: Row(
            children: items.map((item) {
              final isSelected = item['type'] == currentType;
              return _buildLoginTypeButton(context, item, isSelected);
            }).toList(),
          ),
        );
      }),
    ).paddingBottom(AppSpace.listRow);
  }
}
