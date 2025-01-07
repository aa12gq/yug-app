import 'package:flutter/material.dart';
import 'dart:math' as math;

class WaveAnimation extends StatefulWidget {
  final bool isRecording;
  const WaveAnimation({super.key, required this.isRecording});

  @override
  State<WaveAnimation> createState() => _WaveAnimationState();
}

class _WaveAnimationState extends State<WaveAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<double> _heights = List.generate(30, (index) => 0);
  final _random = math.Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() {
        if (widget.isRecording) {
          setState(() {
            for (int i = 0; i < _heights.length; i++) {
              _heights[i] = _random.nextDouble() * 20 + 5;
            }
          });
        }
      });

    if (widget.isRecording) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(WaveAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isRecording != oldWidget.isRecording) {
      if (widget.isRecording) {
        _controller.repeat();
      } else {
        _controller.stop();
        setState(() {
          for (int i = 0; i < _heights.length; i++) {
            _heights[i] = 5;
          }
        });
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _heights.length,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 1),
          width: 2,
          height: _heights[index],
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
