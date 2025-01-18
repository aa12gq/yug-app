import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yug_app/common/i18n/locale_keys.dart';
import 'package:yug_app/common/style/space.dart';
import 'package:yug_app/pages/system/login/controller.dart';
import 'package:yug_app/pages/system/login/widgets/login_form.dart';
import 'package:yug_app/pages/system/login/widgets/about_footer.dart';
import 'package:yug_app/common/style/theme.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  void _handleSwipe(DragEndDetails details) {
    final items = [
      LocaleKeys.loginTypeUsernameValue.tr,
      LocaleKeys.loginTypePhoneValue.tr,
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
      resizeToAvoidBottomInset: false, // 防止键盘弹出时页面被顶起
      body: GestureDetector(
        onHorizontalDragEnd: _handleSwipe,
        child: Stack(
          children: [
            // 背景渐变
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppTheme.primary.withOpacity(0.3),
                    AppTheme.primary.withOpacity(0.05),
                  ],
                ),
              ),
            ),

            // 右上大圆
            Positioned(
              right: -100,
              top: -100,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppTheme.primary.withOpacity(0.4),
                      AppTheme.primary.withOpacity(0.1),
                    ],
                  ),
                ),
              ),
            ),

            // 左下大圆
            Positioned(
              left: -50,
              bottom: -50,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppTheme.primary.withOpacity(0.4),
                      AppTheme.primary.withOpacity(0.1),
                    ],
                  ),
                ),
              ),
            ),

            // 右侧装饰线条
            Positioned(
              right: 60,
              top: Get.height * 0.25,
              child: Transform.rotate(
                angle: 0.2,
                child: Container(
                  width: 3,
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppTheme.primary.withOpacity(0.6),
                        AppTheme.primary.withOpacity(0),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // 左侧装饰线条
            Positioned(
              left: 40,
              bottom: Get.height * 0.2,
              child: Transform.rotate(
                angle: -0.2,
                child: Container(
                  width: 3,
                  height: 120,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppTheme.primary.withOpacity(0.6),
                        AppTheme.primary.withOpacity(0),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // 装饰点1
            Positioned(
              right: Get.width * 0.2,
              top: Get.height * 0.15,
              child: Transform.rotate(
                angle: 0.3,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withOpacity(0.4),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(6),
                      bottomLeft: Radius.circular(7),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                ),
              ),
            ),

            // 装饰点2
            Positioned(
              left: Get.width * 0.15,
              bottom: Get.height * 0.3,
              child: Transform.rotate(
                angle: -0.4,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withOpacity(0.4),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(7),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(6),
                      bottomRight: Radius.circular(7),
                    ),
                  ),
                ),
              ),
            ),

            // 主内容
            SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Container(
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
                                        AppTheme.primary.withOpacity(0.15),
                                        AppTheme.primary.withOpacity(0.05),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(65),
                                      topRight: Radius.circular(45),
                                      bottomLeft: Radius.circular(55),
                                      bottomRight: Radius.circular(65),
                                    ),
                                    border: Border.all(
                                      color: AppTheme.primary.withOpacity(0.1),
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
                                              AppTheme.primary.withOpacity(0.2),
                                              AppTheme.primary
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
                                        AppTheme.primary.withOpacity(0.3),
                                        AppTheme.primary.withOpacity(0),
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
                                    color: AppTheme.primary.withOpacity(0.3),
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
                                                    AppTheme.primary,
                                                    AppTheme.primary,
                                                  ],
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                  topRight: Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(12),
                                                  bottomRight:
                                                      Radius.circular(15),
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: AppTheme.primary
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
                                                  color: AppTheme.primary
                                                      .withOpacity(0.3),
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
                                                  color: AppTheme.primary
                                                      .withOpacity(0.3),
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
                                                          AppTheme.primary,
                                                          AppTheme.primary,
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
                                                      horizontal: 6,
                                                      vertical: 2),
                                                  decoration: BoxDecoration(
                                                    color: AppTheme.primary
                                                        .withOpacity(0.1),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(5),
                                                      topRight:
                                                          Radius.circular(3),
                                                      bottomLeft:
                                                          Radius.circular(4),
                                                      bottomRight:
                                                          Radius.circular(5),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    LocaleKeys.loginBetaTag.tr,
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: AppTheme.primary,
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
                                                color: AppTheme.primary
                                                    .withOpacity(0.08),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  topRight: Radius.circular(3),
                                                  bottomLeft:
                                                      Radius.circular(4),
                                                  bottomRight:
                                                      Radius.circular(5),
                                                ),
                                                border: Border.all(
                                                  color: AppTheme.primary
                                                      .withOpacity(0.1),
                                                  width: 1,
                                                ),
                                              ),
                                              child: Text(
                                                LocaleKeys.loginSlogan.tr,
                                                style: TextStyle(
                                                  fontSize: 13.sp,
                                                  color: AppTheme.primary,
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

                      // 关于我们
                      const AboutFooter(),
                      SizedBox(height: Get.height * 0.01),
                    ],
                  ).paddingHorizontal(AppSpace.page * 0.6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
