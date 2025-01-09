import 'dart:ui';

import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yug_app/common/i18n/locale_keys.dart';
import 'package:yug_app/common/style/space.dart';
import 'package:yug_app/common/values/svgs.dart';
import 'package:yug_app/pages/system/login/controller.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          LocaleKeys.loginOtherMethods.tr,
          style: TextStyle(
            fontSize: 14.sp,
            color: context.theme.hintColor,
          ),
        ),
        SizedBox(height: AppSpace.listRow),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialButton(
              context,
              icon: Icons.wechat,
              color: const Color(0xFF07C160),
              onTap: () {},
            ),
            SizedBox(width: AppSpace.listItem),
            _buildSocialButton(
              context,
              icon: Icons.apple,
              color: Colors.black,
              onTap: () {},
            ),
            SizedBox(width: AppSpace.listItem),
            _buildSocialButton(
              context,
              icon: Icons.facebook,
              color: const Color(0xFF1877F2),
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialButton(
    BuildContext context, {
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20.w),
        splashColor: color.withOpacity(0.1),
        highlightColor: color.withOpacity(0.05),
        child: Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20.w),
          ),
          child: Icon(
            icon,
            color: color,
            size: 24.w,
          ),
        ),
      ),
    );
  }
}
