import 'package:flutter/material.dart';
import 'dart:math' show sin, pi, cos;

class AnimePainter extends CustomPainter {
  final double waveProgress;
  final double blinkProgress;
  final bool isHappy;
  final bool isThinking;
  final bool isDarkMode;

  AnimePainter({
    this.waveProgress = 0,
    this.blinkProgress = 1,
    this.isHappy = false,
    this.isThinking = false,
    this.isDarkMode = true,
  });

  Color get primaryColor => isDarkMode
      ? const Color(0xFF00FFFF) // 深色模式使用青色
      : const Color(0xFF2196F3); // 浅色模式使用蓝色

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..style = PaintingStyle.fill;

    // 绘制顺序
    _drawBackground(canvas, size, paint); // 背景
    _drawCore(canvas, size, paint); // 核心
    _drawFace(canvas, size, paint); // 面部
    _drawEyes(canvas, size, paint); // 眼睛
    _drawCircuits(canvas, size, paint); // 电路
    _drawYuiLogo(canvas, size, paint); // YUI标识
  }

  void _drawBackground(Canvas canvas, Size size, Paint paint) {
    // 背景渐变 - 使用圆形渐变，更柔和的颜色
    paint.shader = RadialGradient(
      center: Alignment.center,
      radius: 0.8,
      colors: [
        primaryColor.withOpacity(0.1),
        primaryColor.withOpacity(0.05),
        Colors.transparent, // 完全透明
      ],
      stops: const [0.0, 0.5, 1.0],
    ).createShader(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width * 0.5,
      ),
    );

    // 绘制圆形背景
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width * 0.5,
      paint,
    );

    // 添加外环装饰
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1;
    paint.shader = null;
    paint.color = primaryColor.withOpacity(0.2);

    // 绘制多层环形
    for (var i = 0; i < 3; i++) {
      final double radius = size.width * (0.45 + i * 0.05);
      canvas.drawCircle(
        Offset(size.width / 2, size.height / 2),
        radius,
        paint,
      );
    }

    // 添加十字准星效果
    paint.strokeWidth = 0.5;
    canvas.drawLine(
      Offset(size.width * 0.3, size.height / 2),
      Offset(size.width * 0.7, size.height / 2),
      paint,
    );
    canvas.drawLine(
      Offset(size.width / 2, size.height * 0.3),
      Offset(size.width / 2, size.height * 0.7),
      paint,
    );

    // 添加角度刻度
    for (var i = 0; i < 8; i++) {
      final angle = i * pi / 4;
      final double startRadius = size.width * 0.45;
      final double endRadius = size.width * 0.48;
      canvas.drawLine(
        Offset(
          size.width / 2 + cos(angle) * startRadius,
          size.height / 2 + sin(angle) * startRadius,
        ),
        Offset(
          size.width / 2 + cos(angle) * endRadius,
          size.height / 2 + sin(angle) * endRadius,
        ),
        paint,
      );
    }
  }

  void _drawCore(Canvas canvas, Size size, Paint paint) {
    // 核心发光效果
    paint.shader = RadialGradient(
      center: Alignment.center,
      radius: 0.5,
      colors: [
        primaryColor,
        primaryColor.withOpacity(0.0),
      ],
    ).createShader(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width,
        height: size.height,
      ),
    );

    final double pulseSize =
        size.width * (0.3 + 0.05 * sin(waveProgress * pi * 2));
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      pulseSize,
      paint,
    );
  }

  void _drawFace(Canvas canvas, Size size, Paint paint) {
    paint.shader = null;
    paint.color = primaryColor.withOpacity(0.3);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;

    // 六边形面板
    final Path facePath = Path();
    for (var i = 0; i < 6; i++) {
      final double angle = i * pi / 3;
      final double x = size.width / 2 + cos(angle) * size.width * 0.25;
      final double y = size.height / 2 + sin(angle) * size.width * 0.25;
      i == 0 ? facePath.moveTo(x, y) : facePath.lineTo(x, y);
    }
    facePath.close();
    canvas.drawPath(facePath, paint);
  }

  void _drawEyes(Canvas canvas, Size size, Paint paint) {
    paint.style = PaintingStyle.fill;
    paint.color = primaryColor;

    // 调整眼睛大小
    final double eyeSize = size.width * 0.04 * blinkProgress;
    canvas.drawCircle(
      Offset(size.width * 0.4, size.height * 0.45),
      eyeSize,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.6, size.height * 0.45),
      eyeSize,
      paint,
    );

    // 眼睛扫描效果
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1;
    final double scanY = size.height * (0.4 + 0.1 * sin(waveProgress * pi * 2));
    canvas.drawLine(
      Offset(size.width * 0.35, scanY),
      Offset(size.width * 0.65, scanY),
      paint,
    );
  }

  void _drawCircuits(Canvas canvas, Size size, Paint paint) {
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1;
    paint.color = primaryColor.withOpacity(0.5);
    paint.maskFilter = null;

    // 修改电路布局，避免与标识重叠
    final Path circuitPath = Path()
      ..moveTo(size.width * 0.3, size.height * 0.55)
      ..lineTo(size.width * 0.4, size.height * 0.6)
      ..moveTo(size.width * 0.7, size.height * 0.55)
      ..lineTo(size.width * 0.6, size.height * 0.6);

    canvas.drawPath(circuitPath, paint);

    // 数据流动画
    final double progress = (waveProgress * 2) % 1.0;
    paint.color = primaryColor;
    canvas.drawCircle(
      Offset(
        size.width * (0.3 + progress * 0.4),
        size.height * 0.55,
      ),
      1.5,
      paint,
    );
  }

  void _drawYuiLogo(Canvas canvas, Size size, Paint paint) {
    // YUI 标识
    final textStyle = TextStyle(
      color: primaryColor,
      fontSize: size.width * 0.08,
      fontWeight: FontWeight.bold,
      shadows: [
        Shadow(
          color: primaryColor.withOpacity(0.3),
          blurRadius: 5,
        ),
      ],
    );

    final textPainter = TextPainter(
      text: TextSpan(text: 'YUI', style: textStyle),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        size.width * 0.5 - textPainter.width / 2,
        size.height * 0.58,
      ),
    );

    // 添加装饰线条
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 0.5;
    paint.color = primaryColor.withOpacity(0.2);

    // 左侧装饰线
    canvas.drawLine(
      Offset(size.width * 0.35, size.height * 0.6),
      Offset(size.width * 0.43, size.height * 0.6),
      paint,
    );

    // 右侧装饰线
    canvas.drawLine(
      Offset(size.width * 0.57, size.height * 0.6),
      Offset(size.width * 0.65, size.height * 0.6),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant AnimePainter oldDelegate) {
    return oldDelegate.waveProgress != waveProgress ||
        oldDelegate.blinkProgress != blinkProgress ||
        oldDelegate.isHappy != isHappy ||
        oldDelegate.isThinking != isThinking ||
        oldDelegate.isDarkMode != isDarkMode;
  }
}
