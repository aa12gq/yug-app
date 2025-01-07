import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  final Color? color;
  final double waveHeight;
  final bool isDark;

  WavePainter({
    this.color,
    this.waveHeight = 100,
    this.isDark = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paintColor =
        color ?? (isDark ? const Color(0xFF3D8BFF) : const Color(0xFF0071CE));
    var paint = Paint()
      ..color = paintColor.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    final baseHeight = size.height - waveHeight;

    var path = Path();
    path.moveTo(0, baseHeight);
    path.quadraticBezierTo(
      size.width * 0.25,
      baseHeight - waveHeight * 0.4,
      size.width * 0.5,
      baseHeight,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      baseHeight + waveHeight * 0.4,
      size.width,
      baseHeight,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);

    paint.color = paintColor.withOpacity(0.05);
    path = Path();
    path.moveTo(0, baseHeight + waveHeight * 0.2);
    path.quadraticBezierTo(
      size.width * 0.25,
      baseHeight - waveHeight * 0.2,
      size.width * 0.5,
      baseHeight + waveHeight * 0.2,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      baseHeight + waveHeight * 0.6,
      size.width,
      baseHeight + waveHeight * 0.2,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
