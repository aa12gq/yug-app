import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'anime_painter.dart';
import 'dart:math' show sin, pi;
import 'dart:async';

class VirtualAssistant extends StatefulWidget {
  final double? size;
  final VoidCallback? onTap;
  final bool showOptions;
  final double defaultX;
  final double defaultY;

  const VirtualAssistant({
    super.key,
    this.size,
    this.onTap,
    this.showOptions = true,
    this.defaultX = 0,
    this.defaultY = 0,
  });

  @override
  State<VirtualAssistant> createState() => _VirtualAssistantState();
}

class _VirtualAssistantState extends State<VirtualAssistant>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _swayAnimation;
  late Animation<double> _waveAnimation;
  late Animation<double> _blinkAnimation;

  // 修改动画状态
  bool _isWaving = false;
  bool _isJumping = false;
  bool _isDancing = false;
  bool _isHappy = false;
  bool _isThinking = false;
  double _moveX = 0;
  double _moveY = 0;
  bool _isSystemBooting = false;

  @override
  void initState() {
    super.initState();
    _moveX = widget.defaultX;
    _moveY = widget.defaultY;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    // 系统启动动画
    _waveAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: 1.0)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 70.0,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(1.0),
        weight: 30.0,
      ),
    ]).animate(_controller);

    // 启动系统
    _startSystem();

    // 摇摆动画
    _swayAnimation = Tween<double>(
      begin: -0.05,
      end: 0.05,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // 挥手动画
    _waveAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // 眨眼动画
    _blinkAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.1), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 0.1, end: 1.0), weight: 1),
    ]).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.8, 1.0),
    ));

    // 添加定时器以更新时钟显示
    Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() {});
    });
  }

  void _startSystem() {
    _controller
      ..forward()
      ..repeat();

    // 模拟系统启动过程
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() => _isSystemBooting = true);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openChatDialog(),
      onLongPress: () => _showOptions(),
      onDoubleTap: playWaveAnimation,
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          double angle = _swayAnimation.value;
          double scale = 1.0;

          if (_isJumping) {
            scale = 1.0 + _controller.value * 0.2;
          } else if (_isDancing) {
            angle = sin(_controller.value * pi * 4) * 0.2;
            scale = 1.0 + sin(_controller.value * pi * 2) * 0.1;
          } else if (_isHappy) {
            angle = sin(_controller.value * pi * 6) * 0.1;
            scale = 1.0 + sin(_controller.value * pi * 3) * 0.05;
          } else if (_isThinking) {
            angle = sin(_controller.value * pi) * 0.05;
          }

          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.elasticOut,
            transform: Matrix4.identity()
              ..translate(_moveX, _moveY)
              ..rotateZ(angle)
              ..scale(scale),
            child: SizedBox(
              width: widget.size ?? 50.w,
              height: widget.size ?? 50.w,
              child: CustomPaint(
                painter: AnimePainter(
                  waveProgress: _waveAnimation.value,
                  blinkProgress: _blinkAnimation.value,
                  isHappy: _isHappy,
                  isThinking: _isThinking,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _openChatDialog() {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          width: 0.8.sw,
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A2E), // 深色背景
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF00FFFF).withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
            border: Border.all(
              color: const Color(0xFF00FFFF).withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 头部
              Row(
                children: [
                  Container(
                    width: 45.w,
                    height: 45.w,
                    padding: EdgeInsets.all(3.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF00FFFF).withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: CustomPaint(
                      painter: AnimePainter(
                        waveProgress: _waveAnimation.value,
                        blinkProgress: _blinkAnimation.value,
                        isHappy: true, // 显示友好表情
                        isThinking: false,
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'YUI',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'AI Assistant',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.settings_outlined,
                      color: Colors.white70,
                      size: 20.w,
                    ),
                    onPressed: () {
                      Get.back();
                      _showOptions();
                    },
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              // 分割线
              Container(
                height: 1,
                color: const Color(0xFF00FFFF).withOpacity(0.1),
              ),
              SizedBox(height: 20.h),

              // 欢迎消息
              Container(
                padding: EdgeInsets.all(15.w),
                decoration: BoxDecoration(
                  color: const Color(0xFF00FFFF).withOpacity(0.05),
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(
                    color: const Color(0xFF00FFFF).withOpacity(0.1),
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '你好！我是 YUI',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      '我可以帮你：',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    _buildFeatureItem(Icons.chat_outlined, '智能对话'),
                    _buildFeatureItem(Icons.search, '信息查询'),
                    _buildFeatureItem(Icons.assistant, '生活助手'),
                  ],
                ),
              ),
              SizedBox(height: 20.h),

              // 按钮组
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Get.back(),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white70,
                    ),
                    child: Text(
                      '稍后再说',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                      Get.toNamed('/chat');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00FFFF),
                      foregroundColor: const Color(0xFF1A1A2E),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 10.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      '开始对话',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16.w,
            color: const Color(0xFF00FFFF),
          ),
          SizedBox(width: 8.w),
          Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  void _showOptions() {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "虚拟助手设置",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.h),
            _buildOption(
              "更换形象",
              Icons.style,
              () => Get.toNamed('/avatar/customize'),
            ),
            _buildOption(
              "个性设置",
              Icons.psychology,
              () => Get.toNamed('/avatar/personality'),
            ),
            _buildOption(
              "互动记录",
              Icons.history,
              () => Get.toNamed('/avatar/interactions'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(Get.context!).primaryColor),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  // 播放挥手动画
  void playWaveAnimation() {
    if (!_isWaving) {
      setState(() => _isWaving = true);
      _controller.repeat(
        period: const Duration(seconds: 1),
        reverse: true,
      );
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() => _isWaving = false);
          _controller.repeat(
            period: const Duration(seconds: 3),
            reverse: true,
          );
        }
      });
    }
  }

  // 播放跳跃动画
  void playJumpAnimation() {
    if (!_isJumping) {
      setState(() => _isJumping = true);
      _controller
        ..stop()
        ..duration = const Duration(milliseconds: 500)
        ..forward().then((_) {
          if (mounted) {
            setState(() => _isJumping = false);
            _controller
              ..duration = const Duration(seconds: 3)
              ..repeat(reverse: true);
          }
        });
    }
  }

  // 播放舞蹈动画
  void playDanceAnimation() {
    if (!_isDancing) {
      setState(() => _isDancing = true);
      _controller
        ..stop()
        ..duration = const Duration(milliseconds: 300)
        ..repeat(period: const Duration(milliseconds: 600));

      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          setState(() => _isDancing = false);
          _controller
            ..duration = const Duration(seconds: 3)
            ..repeat(reverse: true);
        }
      });
    }
  }

  // 添加拖动功能
  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _moveX += details.delta.dx;
      _moveY += details.delta.dy;
      // 限制移动范围
      final maxOffset = 100.0;
      _moveX = _moveX.clamp(-maxOffset, maxOffset);
      _moveY = _moveY.clamp(-maxOffset, maxOffset);
    });
  }

  // 添加弹性回弹
  void _onPanEnd(DragEndDetails details) {
    setState(() {
      // 添加弹性回弹动画
      _moveX = 0;
      _moveY = 0;
    });
  }

  // 添加更多互动方法
  void playHappyAnimation() {
    setState(() => _isHappy = true);
    _controller
      ..duration = const Duration(milliseconds: 200)
      ..repeat();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() => _isHappy = false);
        _resetAnimation();
      }
    });
  }

  void playThinkingAnimation() {
    setState(() => _isThinking = true);
    _controller
      ..duration = const Duration(seconds: 2)
      ..repeat(reverse: true);
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() => _isThinking = false);
        _resetAnimation();
      }
    });
  }

  void _resetAnimation() {
    _controller
      ..duration = const Duration(seconds: 3)
      ..repeat(reverse: true);
  }
}
