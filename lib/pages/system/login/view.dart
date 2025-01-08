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
                waveHeight: 60,
              ),
              size: Size(Get.width, Get.height),
            ),

            // 主内容
            Container(
              height: Get.height,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),

                    // 品牌标题区域
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // 主要装饰圆圈
                          Positioned(
                            right: -35,
                            top: -15,
                            child: Transform.rotate(
                              angle: -0.2,
                              child: Container(
                                width: 130,
                                height: 130,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      context.theme.primaryColor
                                          .withOpacity(0.15),
                                      context.theme.primaryColor
                                          .withOpacity(0.05),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(65),
                                    topRight: Radius.circular(45),
                                    bottomLeft: Radius.circular(55),
                                    bottomRight: Radius.circular(65),
                                  ),
                                  border: Border.all(
                                    color: context.theme.primaryColor
                                        .withOpacity(0.1),
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: Transform.rotate(
                                    angle: 0.3,
                                    child: Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            context.theme.primaryColor
                                                .withOpacity(0.2),
                                            context.theme.primaryColor
                                                .withOpacity(0.05),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(25),
                                          topRight: Radius.circular(15),
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(25),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // 装饰线条
                          Positioned(
                            right: 45,
                            top: -15,
                            child: Transform.rotate(
                              angle: 0.2,
                              child: Container(
                                width: 2,
                                height: 50,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      context.theme.primaryColor
                                          .withOpacity(0.3),
                                      context.theme.primaryColor.withOpacity(0),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // 装饰点
                          Positioned(
                            right: 35,
                            bottom: 15,
                            child: Transform.rotate(
                              angle: -0.4,
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: context.theme.colorScheme.secondary
                                      .withOpacity(0.2),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(3),
                                    bottomLeft: Radius.circular(4),
                                    bottomRight: Radius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // 品牌内容
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    // 品牌图标
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Transform.rotate(
                                          angle: -0.1,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 18, vertical: 14),
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  context.theme.primaryColor,
                                                  context.theme.colorScheme
                                                      .secondary,
                                                ],
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(10),
                                                bottomLeft: Radius.circular(12),
                                                bottomRight:
                                                    Radius.circular(15),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: context
                                                      .theme.primaryColor
                                                      .withOpacity(0.3),
                                                  offset: const Offset(0, 4),
                                                  blurRadius: 15,
                                                ),
                                              ],
                                            ),
                                            child: Transform.rotate(
                                              angle: 0.1,
                                              child: Text(
                                                "V",
                                                style: TextStyle(
                                                  fontSize: 32.sp,
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        // 装饰点1
                                        Positioned(
                                          left: -4,
                                          top: -4,
                                          child: Transform.rotate(
                                            angle: 0.3,
                                            child: Container(
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                color: context
                                                    .theme.colorScheme.secondary
                                                    .withOpacity(0.3),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  topRight: Radius.circular(3),
                                                  bottomLeft:
                                                      Radius.circular(4),
                                                  bottomRight:
                                                      Radius.circular(5),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        // 装饰点2
                                        Positioned(
                                          right: -4,
                                          bottom: -4,
                                          child: Transform.rotate(
                                            angle: -0.2,
                                            child: Container(
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                color: context
                                                    .theme.primaryColor
                                                    .withOpacity(0.3),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  topRight: Radius.circular(3),
                                                  bottomLeft:
                                                      Radius.circular(4),
                                                  bottomRight:
                                                      Radius.circular(5),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 15),
                                    // 品牌名称
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Transform.rotate(
                                              angle: -0.05,
                                              child: Text(
                                                "TYUG",
                                                style: TextStyle(
                                                  fontSize: 32.sp,
                                                  fontWeight: FontWeight.w800,
                                                  letterSpacing: 2,
                                                  foreground: Paint()
                                                    ..shader = LinearGradient(
                                                      colors: [
                                                        context
                                                            .theme.primaryColor,
                                                        context
                                                            .theme
                                                            .colorScheme
                                                            .secondary,
                                                      ],
                                                    ).createShader(
                                                      Rect.fromLTWH(0.0, 0.0,
                                                          120.0, 40.0),
                                                    ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            Transform.rotate(
                                              angle: 0.1,
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 6, vertical: 2),
                                                decoration: BoxDecoration(
                                                  color: context.theme
                                                      .colorScheme.secondary
                                                      .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(5),
                                                    topRight:
                                                        Radius.circular(3),
                                                    bottomLeft:
                                                        Radius.circular(4),
                                                    bottomRight:
                                                        Radius.circular(5),
                                                  ),
                                                ),
                                                child: Text(
                                                  "Beta",
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: context.theme
                                                        .colorScheme.secondary,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 4),
                                        Transform.rotate(
                                          angle: -0.05,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 4),
                                            decoration: BoxDecoration(
                                              color: context.theme.primaryColor
                                                  .withOpacity(0.08),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                topRight: Radius.circular(3),
                                                bottomLeft: Radius.circular(4),
                                                bottomRight: Radius.circular(5),
                                              ),
                                              border: Border.all(
                                                color: context
                                                    .theme.primaryColor
                                                    .withOpacity(0.1),
                                                width: 1,
                                              ),
                                            ),
                                            child: Text(
                                              "让生活更美好",
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                color:
                                                    context.theme.primaryColor,
                                                letterSpacing: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: Get.height * 0.03),

                    // 表单
                    Expanded(
                      child: const LoginForm(),
                    ),

                    SizedBox(height: Get.height * 0.01),
                  ],
                ).paddingHorizontal(AppSpace.page * 0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
