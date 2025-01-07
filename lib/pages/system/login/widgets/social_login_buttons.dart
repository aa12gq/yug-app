import 'dart:ui';

import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yug_app/common/style/space.dart';
import 'package:yug_app/common/values/svgs.dart';
import 'package:yug_app/pages/system/login/controller.dart';

class SocialLoginButtons extends GetView<LoginController> {
  const SocialLoginButtons({super.key});

  Widget _buildSocialButton(
    BuildContext context,
    String svgPath,
    VoidCallback onPressed,
    Color color,
  ) {
    return Container(
      width: 50.w,
      height: 50.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            context.theme.colorScheme.surface.withOpacity(0.9),
            Color.lerp(
              context.theme.colorScheme.surface,
              color,
              0.1,
            )!,
          ],
        ),
        borderRadius: BorderRadius.circular(25.w),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
        border: Border.all(
          color: color.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.w),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onPressed,
              splashColor: color.withOpacity(0.2),
              highlightColor: color.withOpacity(0.1),
              child: Container(
                padding: EdgeInsets.all(12.w),
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        color,
                        Color.lerp(color, Colors.white, 0.2)!,
                      ],
                    ).createShader(bounds);
                  },
                  child: SvgPicture.asset(
                    svgPath,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "其他登录方式",
          style: TextStyle(
            fontSize: 14.sp,
            color: context.theme.colorScheme.onSurface.withOpacity(0.6),
            letterSpacing: 0.5,
            fontWeight: FontWeight.w500,
          ),
        ).paddingBottom(AppSpace.listRow),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialButton(
              context,
              AssetsSvgs.wechatSvg,
              () {},
              const Color(0xFF07C160),
            ),
            SizedBox(width: AppSpace.listItem * 1.5),
            _buildSocialButton(
              context,
              AssetsSvgs.qqSvg,
              () {},
              const Color(0xFF12B7F5),
            ),
            SizedBox(width: AppSpace.listItem * 1.5),
            _buildSocialButton(
              context,
              AssetsSvgs.githubSvg,
              () {},
              context.theme.colorScheme.onSurface,
            ),
          ],
        ),
      ],
    );
  }
}
