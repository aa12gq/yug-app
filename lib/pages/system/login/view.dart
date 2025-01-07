import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yug_app/common/components/page_title.dart';
import 'package:yug_app/common/style/space.dart';
import 'package:yug_app/pages/system/login/controller.dart';
import 'package:yug_app/pages/system/login/widgets/login_form.dart';
import 'package:yug_app/pages/system/register/wave_painter.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  void _handleSwipe(DragEndDetails details) {
    final items = [
      'username',
      'phone',
      'email',
    ];
    final currentIndex = items.indexOf(controller.loginType.value);
    if (details.primaryVelocity! < 0 && currentIndex < items.length - 1) {
      // 向左滑动，切换到下一个
      controller.switchLoginType(items[currentIndex + 1]);
    } else if (details.primaryVelocity! > 0 && currentIndex > 0) {
      // 向右滑动，切换到上一个
      controller.switchLoginType(items[currentIndex - 1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: _handleSwipe,
        child: Stack(
          children: [
            // 背景渐变
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    context.theme.primaryColor.withOpacity(0.05),
                    Colors.transparent,
                  ],
                ),
              ),
            ),

            // 波浪背景
            CustomPaint(
              painter: WavePainter(
                color: context.theme.primaryColor.withOpacity(0.08),
                waveHeight: 100,
              ),
              size: Size(Get.width, Get.height),
            ),

            // 主内容
            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(), // 防止滚动与手势冲突
              child: <Widget>[
                // 头部标题
                Hero(
                  tag: 'page_title',
                  child: AuthPageTitle(
                    title: "欢迎回来",
                    subtitle: "请选择登录方式",
                  ),
                ),

                // 表单
                const LoginForm(),
              ]
                  .toColumn(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  )
                  .paddingHorizontal(AppSpace.page),
            ),
          ],
        ),
      ),
    );
  }
}
