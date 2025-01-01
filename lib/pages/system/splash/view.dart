import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import 'index.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  // 构建渐变背景
  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1A237E), // 深蓝色
            Color(0xFF3949AB), // 靛蓝色
            Color(0xFF3F51B5), // 宝蓝色
          ],
        ),
      ),
    );
  }

  // 构建装饰性光效
  Widget _buildDecorations() {
    return Stack(
      children: [
        // 右上角光效
        Positioned(
          right: -100,
          top: -100,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.1),
            ),
          ),
        ),
        // 左下角光效
        Positioned(
          left: -80,
          bottom: -80,
          child: Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.1),
            ),
          ),
        ),
      ],
    );
  }

  // 构建Logo
  Widget _buildLogo() {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 2000),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, double value, child) {
        return Opacity(
          opacity: value,
          child: Transform.scale(
            scale: value,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo容器
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.2),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // 旋转的光环
                      TweenAnimationBuilder(
                        duration: const Duration(seconds: 10),
                        tween: Tween<double>(begin: 0, end: 2 * math.pi),
                        builder: (context, double value, child) {
                          return Transform.rotate(
                            angle: value,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: SweepGradient(
                                  colors: [
                                    Colors.white.withOpacity(0.3),
                                    Colors.white.withOpacity(0),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      // 中心图标
                      const Icon(
                        Icons.auto_awesome,
                        size: 50,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // 标题
                const Text(
                  "语光",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 4,
                    shadows: [
                      Shadow(
                        color: Colors.white24,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // 副标题
                Text(
                  "让社交更有温度",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.8),
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // 构建加载指示器
  Widget _buildLoading() {
    return Positioned(
      bottom: 100,
      left: 0,
      right: 0,
      child: Column(
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.white.withOpacity(0.8),
              ),
              strokeWidth: 2,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '正在启动...',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 14,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }

  // 主视图
  Widget _buildView() {
    return Stack(
      fit: StackFit.expand,
      children: [
        _buildBackground(),
        _buildDecorations(),
        _buildLogo(),
        _buildLoading(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      id: "splash",
      builder: (_) {
        return _buildView();
      },
    );
  }
}
