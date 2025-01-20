import 'package:flutter/material.dart';

class AnimePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..style = PaintingStyle.fill;

    // 头部形状
    paint.color = const Color(0xFFFFE4E1);
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.5),
      size.width * 0.45,
      paint,
    );

    // 眼睛
    paint.color = Colors.white;
    canvas.drawCircle(
      Offset(size.width * 0.35, size.height * 0.45),
      size.width * 0.1,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.65, size.height * 0.45),
      size.width * 0.1,
      paint,
    );

    // 瞳孔
    paint.color = const Color(0xFF000000);
    canvas.drawCircle(
      Offset(size.width * 0.35, size.height * 0.45),
      size.width * 0.05,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.65, size.height * 0.45),
      size.width * 0.05,
      paint,
    );

    // 眼睛高光
    paint.color = Colors.white;
    canvas.drawCircle(
      Offset(size.width * 0.33, size.height * 0.43),
      size.width * 0.02,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.63, size.height * 0.43),
      size.width * 0.02,
      paint,
    );

    // 腮红
    paint.color = const Color(0xFFFFB6C1).withValues(alpha: 0.3);
    canvas.drawCircle(
      Offset(size.width * 0.25, size.height * 0.5),
      size.width * 0.05,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.75, size.height * 0.5),
      size.width * 0.05,
      paint,
    );

    // 嘴巴
    paint
      ..color = const Color(0xFFFF69B4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final Path mouthPath = Path()
      ..moveTo(size.width * 0.45, size.height * 0.55)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.58,
        size.width * 0.55,
        size.height * 0.55,
      );
    canvas.drawPath(mouthPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
