import 'package:flutter/material.dart';
import 'dart:math' as math;

class GlowUnderlinePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double phase;

  GlowUnderlinePainter({
    required this.color,
    this.strokeWidth = 2.0,
    this.phase = 0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, width, height),
      Radius.circular(height / 2),
    );

    // 绘制背景渐变
    final bgPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          color.withValues(alpha: 0.08),
          color.withValues(alpha: 0.12),
          color.withValues(alpha: 0.08),
        ],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, width, height));

    canvas.drawRRect(rect, bgPaint);

    // 绘制动态边框
    final borderPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          color.withValues(alpha: 0.1),
          color.withValues(alpha: 0.3),
          color.withValues(alpha: 0.1),
        ],
        stops: const [0.0, 0.5, 1.0],
        transform: GradientRotation(phase * math.pi * 2),
      ).createShader(Rect.fromLTWH(0, 0, width, height))
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawRRect(rect, borderPaint);

    // 绘制光效
    final glowPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          color.withValues(alpha: 0.0),
          color.withValues(alpha: 0.2),
          color.withValues(alpha: 0.0),
        ],
        stops: const [0.0, 0.5, 1.0],
        transform: GradientRotation(phase * math.pi * 2),
      ).createShader(Rect.fromLTWH(-width * 0.5, 0, width * 2, height));

    canvas.drawRRect(rect, glowPaint);
  }

  @override
  bool shouldRepaint(GlowUnderlinePainter oldDelegate) =>
      color != oldDelegate.color ||
      strokeWidth != oldDelegate.strokeWidth ||
      phase != oldDelegate.phase;
}

class WaveUnderline extends StatefulWidget {
  final Color color;
  final double strokeWidth;
  final double width;
  final double height;

  const WaveUnderline({
    Key? key,
    required this.color,
    this.strokeWidth = 1.0,
    required this.width,
    this.height = 32.0,
  }) : super(key: key);

  @override
  State<WaveUnderline> createState() => _WaveUnderlineState();
}

class _WaveUnderlineState extends State<WaveUnderline>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size(widget.width, widget.height),
          painter: GlowUnderlinePainter(
            color: widget.color,
            strokeWidth: widget.strokeWidth,
            phase: _controller.value,
          ),
        );
      },
    );
  }
}
