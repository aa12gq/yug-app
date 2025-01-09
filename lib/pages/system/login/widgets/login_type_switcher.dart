import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yug_app/common/i18n/locale_keys.dart';
import 'package:yug_app/common/style/space.dart';
import 'package:yug_app/pages/system/login/controller.dart';

class LoginTypeSwitcher extends GetView<LoginController> {
  const LoginTypeSwitcher({super.key});

  void _handleSwipe(DragEndDetails details, List<Map<String, dynamic>> items,
      String currentType) {
    final currentIndex =
        items.indexWhere((item) => item['type'] == currentType);
    if (details.primaryVelocity! < 0 && currentIndex < items.length - 1) {
      controller.switchLoginType(items[currentIndex + 1]['type'] as String);
    } else if (details.primaryVelocity! > 0 && currentIndex > 0) {
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
            padding: EdgeInsets.symmetric(vertical: 6.w),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: isSelected
                      ? context.theme.primaryColor
                      : Colors.transparent,
                  width: 2,
                ),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item['icon'] as IconData,
                  size: 16.w,
                  color:
                      isSelected ? context.theme.primaryColor : Colors.black54,
                ),
                SizedBox(width: 4.w),
                Text(
                  item['text'] as String,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight:
                        isSelected ? FontWeight.w500 : FontWeight.normal,
                    color: isSelected
                        ? context.theme.primaryColor
                        : Colors.black54,
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
        'type': LocaleKeys.loginTypeUsernameValue.tr,
        'text': LocaleKeys.loginTypeUsername.tr,
        'icon': Icons.person_outline_rounded,
      },
      {
        'type': LocaleKeys.loginTypePhoneValue.tr,
        'text': LocaleKeys.loginTypePhone.tr,
        'icon': Icons.phone_android_rounded,
      },
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w),
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
    ).paddingBottom(AppSpace.listRow * 0.5);
  }
}
