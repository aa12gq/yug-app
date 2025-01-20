import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';

/// slider indicator 指示器
class SliderIndicatorWidget extends StatelessWidget {
  /// 个数
  final int length;

  /// 当前位置
  final int currentIndex;

  /// 颜色
  final Color? color;

  /// 是否原型
  final bool isCircle;

  /// 对齐方式
  final MainAxisAlignment alignment;

  const SliderIndicatorWidget({
    super.key,
    required this.length,
    required this.currentIndex,
    this.color,
    this.isCircle = false,
    this.alignment = MainAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    Color boxColor = color ?? context.colors.scheme.primary;

    return Row(
      mainAxisAlignment: alignment,

      // 采用 list.generate 方式生成 item 项
      children: List.generate(length, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          // 圆型宽度 6 , 否则当前位置 15 , 其他位置 8
          width: !isCircle
              ? currentIndex == index
                  ? 15.0
                  : 8
              : 6,
          // 圆型高度 6 , 否则 4
          height: !isCircle ? 4 : 6,
          decoration: BoxDecoration(
            // 圆角 4
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            // 非当前位置透明度 0.3
            color: currentIndex == index
                ? boxColor
                : boxColor.withValues(alpha: 0.3),
          ),
        );
      }),
    );
  }
}
