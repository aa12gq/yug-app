import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yug_app/common/i18n/locale_keys.dart';
import 'package:yug_app/common/style/space.dart';
import 'package:yug_app/pages/system/login/controller.dart';
import 'dart:math' as math;

// 波浪线画笔
class WavyPainter extends CustomPainter {
  final Color color;
  final double amplitude;
  final double frequency;
  final double phase;

  WavyPainter({
    required this.color,
    this.amplitude = 1.5,
    this.frequency = 0.8,
    this.phase = 0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    final path = Path();

    // 只画一个完整的波浪
    final waveWidth = size.width;
    final waveHeight = size.height;

    path.moveTo(0, waveHeight / 2);

    // 使用贝塞尔曲线画一个完整的波浪
    path.cubicTo(
        waveWidth * 0.25, // 第一个控制点x
        waveHeight * 0.2, // 第一个控制点y
        waveWidth * 0.75, // 第二个控制点x
        waveHeight * 0.8, // 第二个控制点y
        waveWidth, // 终点x
        waveHeight / 2 // 终点y
        );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(WavyPainter oldDelegate) =>
      color != oldDelegate.color ||
      amplitude != oldDelegate.amplitude ||
      frequency != oldDelegate.frequency ||
      phase != oldDelegate.phase;
}

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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item['icon'] as IconData,
                      size: 18.w,
                      color: isSelected
                          ? context.theme.primaryColor
                          : Colors.black54,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      item['text'] as String,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight:
                            isSelected ? FontWeight.w500 : FontWeight.normal,
                        color: isSelected
                            ? context.theme.primaryColor
                            : Colors.black54,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.w),
                // 波浪形下划线
                Builder(builder: (context) {
                  // 计算文字宽度
                  final textSpan = TextSpan(
                    text: item['text'] as String,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight:
                          isSelected ? FontWeight.w500 : FontWeight.normal,
                    ),
                  );
                  final textPainter = TextPainter(
                    text: textSpan,
                    textDirection: TextDirection.ltr,
                  )..layout();

                  // 波浪线宽度：文字宽度 + 额外边距
                  final waveWidth = textPainter.width + 32.w;

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: isSelected ? 8.w : 0,
                    width: isSelected ? waveWidth : 0,
                    child: isSelected
                        ? CustomPaint(
                            painter: WavyPainter(
                              color: context.theme.primaryColor,
                            ),
                            size: Size(waveWidth, 8.w),
                          )
                        : null,
                  );
                }),
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
