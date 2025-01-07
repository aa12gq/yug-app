import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yug_app/common/style/space.dart';
import 'package:yug_app/pages/system/login/controller.dart';

class LoginTypeSwitcher extends GetView<LoginController> {
  const LoginTypeSwitcher({super.key});

  Widget _buildLoginTypeButton(
    BuildContext context,
    String type,
    String text,
    String currentType,
    VoidCallback onTap,
  ) {
    final isSelected = currentType == type;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.w),
          decoration: BoxDecoration(
            color: isSelected ? context.theme.primaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(16.w),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              color: isSelected
                  ? Colors.white
                  : context.theme.colorScheme.onSurface.withOpacity(0.6),
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20.w),
        border: Border.all(
          color: context.theme.primaryColor.withOpacity(0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Obx(
        () => <Widget>[
          _buildLoginTypeButton(
            context,
            'username',
            '用户名密码',
            controller.loginType.value,
            () => controller.switchLoginType('username'),
          ),
          _buildLoginTypeButton(
            context,
            'phone',
            '手机号',
            controller.loginType.value,
            () => controller.switchLoginType('phone'),
          ),
          _buildLoginTypeButton(
            context,
            'email',
            '邮箱',
            controller.loginType.value,
            () => controller.switchLoginType('email'),
          ),
        ].toRow(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
    ).paddingBottom(AppSpace.listRow * 2);
  }
}
