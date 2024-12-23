import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:yug_app/common/widgets/text.dart';

import '../index.dart';
import 'index.dart';

/// 按钮样式
enum ButtonWidgetVariant {
  primary,
  secondary,
  destructive,
  outline,
  ghost,
  link,
  icon,
}

/// 按钮
class ButtonWidget extends StatefulWidget {
  /// 按钮样式
  final ButtonWidgetVariant variant;

  /// 按钮尺寸
  final WidgetScale scale;

  /// tap 事件
  final Function()? onTap;

  /// 文字字符串
  final String? text;

  /// 文字颜色
  final Color? textColor;

  /// 子组件
  final Widget? child;

  /// 图标
  final Widget? icon;

  /// 圆角
  final double? borderRadius;

  /// 背景色
  final Color? backgroundColor;

  /// 边框色
  final Color? borderColor;

  /// 宽度
  final double? _width;

  /// 高度
  final double? height;

  /// 启用
  final bool enabled;

  /// 图标和文字的间距
  final double? iconSpace;

  /// 是否loading
  final bool? loading;

  /// 是否反转
  final bool? reverse;

  /// 主轴对齐方式
  final MainAxisAlignment? mainAxisAlignment;

  /// 主轴尺寸
  final MainAxisSize? mainAxisSize;

  /// 阴影
  final double? elevation;

  const ButtonWidget({
    super.key,
    this.variant = ButtonWidgetVariant.primary,
    this.scale = WidgetScale.medium,
    this.onTap,
    this.text,
    this.borderRadius,
    this.child,
    this.backgroundColor,
    this.icon,
    this.borderColor,
    double? width,
    this.height,
    this.enabled = true,
    this.iconSpace,
    this.loading,
    this.textColor,
    this.reverse,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.elevation,
  }) : _width = width;

  /// raw
  const ButtonWidget.raw({
    super.key,
    required this.variant,
    required this.scale,
    this.onTap,
    this.text,
    this.borderRadius,
    this.child,
    this.backgroundColor,
    this.icon,
    this.borderColor,
    double? width,
    this.height,
    this.enabled = true,
    this.iconSpace,
    this.loading,
    this.textColor,
    this.reverse,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.elevation,
  }) : _width = width;

  /// 主要
  const ButtonWidget.primary(
    this.text, {
    super.key,
    this.scale = WidgetScale.medium,
    double? width,
    this.height,
    this.onTap,
    this.borderRadius,
    this.child,
    this.backgroundColor,
    this.icon,
    this.borderColor,
    this.enabled = true,
    this.iconSpace,
    this.loading,
    this.textColor,
    this.reverse,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.elevation,
  })  : _width = width,
        variant = ButtonWidgetVariant.primary;

  /// 次要
  const ButtonWidget.secondary(
    this.text, {
    super.key,
    this.scale = WidgetScale.medium,
    double? width,
    this.height,
    this.onTap,
    this.borderRadius,
    this.child,
    this.backgroundColor,
    this.icon,
    this.borderColor,
    this.enabled = true,
    this.iconSpace,
    this.loading,
    this.textColor,
    this.reverse,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.elevation,
  })  : _width = width,
        variant = ButtonWidgetVariant.secondary;

  // destructive 警告
  const ButtonWidget.destructive(
    this.text, {
    super.key,
    this.scale = WidgetScale.medium,
    double? width,
    this.height,
    this.onTap,
    this.borderRadius,
    this.child,
    this.backgroundColor,
    this.icon,
    this.borderColor,
    this.enabled = true,
    this.iconSpace,
    this.loading,
    this.textColor,
    this.reverse,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.elevation,
  })  : _width = width,
        variant = ButtonWidgetVariant.destructive;

  // outline
  const ButtonWidget.outline(
    this.text, {
    super.key,
    this.scale = WidgetScale.medium,
    double? width,
    this.height,
    this.onTap,
    this.borderRadius,
    this.child,
    this.backgroundColor,
    this.icon,
    this.borderColor,
    this.enabled = true,
    this.iconSpace,
    this.loading,
    this.textColor,
    this.reverse,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.elevation,
  })  : _width = width,
        variant = ButtonWidgetVariant.outline;

  // ghost
  const ButtonWidget.ghost(
    this.text, {
    super.key,
    this.scale = WidgetScale.medium,
    double? width,
    this.height,
    this.onTap,
    this.borderRadius,
    this.child,
    this.backgroundColor,
    this.icon,
    this.borderColor,
    this.enabled = true,
    this.iconSpace,
    this.loading,
    this.textColor,
    this.reverse,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.elevation,
  })  : _width = width,
        variant = ButtonWidgetVariant.ghost;

  // link
  const ButtonWidget.link(
    this.text, {
    super.key,
    this.scale = WidgetScale.medium,
    double? width,
    this.height,
    this.onTap,
    this.borderRadius,
    this.child,
    this.backgroundColor,
    this.icon,
    this.borderColor,
    this.enabled = true,
    this.iconSpace,
    this.loading,
    this.textColor,
    this.reverse,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.elevation,
  })  : _width = width,
        variant = ButtonWidgetVariant.link;

  // icon
  const ButtonWidget.icon(
    this.icon, {
    super.key,
    this.scale = WidgetScale.medium,
    this.text,
    double? width,
    this.height,
    this.onTap,
    this.borderRadius,
    this.child,
    this.backgroundColor,
    this.borderColor,
    this.enabled = true,
    this.iconSpace,
    this.loading,
    this.textColor,
    this.reverse,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.elevation,
  })  : _width = width,
        variant = ButtonWidgetVariant.icon;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  // 按下
  bool pressed = false;

  // 按尺寸缩放
  double _size(double val) {
    switch (widget.scale) {
      case WidgetScale.medium:
        return val;
      case WidgetScale.small:
        return val * (1 - 0.3);
      case WidgetScale.large:
        return val * (1 + 0.3);
    }
  }

  // 文本样式
  Color _textColor() {
    var colorScheme = context.colors.scheme;
    Color color = colorScheme.onPrimary;
    switch (widget.variant) {
      case ButtonWidgetVariant.primary:
        color = widget.textColor ?? colorScheme.onPrimary;
        break;
      case ButtonWidgetVariant.secondary:
        color = widget.textColor ?? colorScheme.onSecondary;
        break;
      case ButtonWidgetVariant.destructive:
        color = widget.textColor ?? colorScheme.onError;
        break;
      case ButtonWidgetVariant.outline:
        color = widget.textColor ?? colorScheme.primary;
        break;
      case ButtonWidgetVariant.ghost:
      case ButtonWidgetVariant.link:
      case ButtonWidgetVariant.icon:
        color = widget.textColor ?? colorScheme.onPrimaryContainer;
        break;
      default:
    }

    return color;
  }

  // 背景色
  Color _backgroundColor() {
    var colorScheme = context.colors.scheme;
    Color color = colorScheme.primary;
    switch (widget.variant) {
      case ButtonWidgetVariant.primary:
        color = colorScheme.primary;
        break;
      case ButtonWidgetVariant.secondary:
        color = colorScheme.secondary;
        break;
      case ButtonWidgetVariant.destructive:
        color = colorScheme.error;
        break;
      case ButtonWidgetVariant.outline:
      case ButtonWidgetVariant.ghost:
        color = widget.backgroundColor ?? Colors.transparent;
      case ButtonWidgetVariant.link:
      case ButtonWidgetVariant.icon:
        color = colorScheme.surface;
        break;
      default:
    }
    return color;
  }

  // 高亮色
  Color _highlightColor() {
    var colorScheme = context.colors.scheme;
    Color color = colorScheme.primary.withOpacity(0.1);
    switch (widget.variant) {
      case ButtonWidgetVariant.primary:
        color = colorScheme.primaryContainer.withOpacity(0.1);
        break;
      case ButtonWidgetVariant.secondary:
        color = colorScheme.secondaryContainer.withOpacity(0.1);
        break;
      case ButtonWidgetVariant.destructive:
        color = colorScheme.errorContainer.withOpacity(0.1);
        break;
      case ButtonWidgetVariant.outline:
      case ButtonWidgetVariant.ghost:
      case ButtonWidgetVariant.link:
      case ButtonWidgetVariant.icon:
        color = colorScheme.surfaceContainer.withOpacity(0.1);
        break;
      default:
    }
    return color;
  }

  // 圆角
  BorderRadius? _borderRadius() {
    switch (widget.variant) {
      case ButtonWidgetVariant.primary:
      case ButtonWidgetVariant.secondary:
      case ButtonWidgetVariant.destructive:
      case ButtonWidgetVariant.ghost:
      case ButtonWidgetVariant.link:
      case ButtonWidgetVariant.icon:
        return null;
      case ButtonWidgetVariant.outline:
        return BorderRadius.circular(
            widget.borderRadius ?? _size(AppRadius.button));
      default:
    }
    return null;
  }

  BoxBorder? _border() {
    switch (widget.variant) {
      case ButtonWidgetVariant.primary:
      case ButtonWidgetVariant.secondary:
      case ButtonWidgetVariant.destructive:
      case ButtonWidgetVariant.ghost:
      case ButtonWidgetVariant.link:
      case ButtonWidgetVariant.icon:
        return null;
      case ButtonWidgetVariant.outline:
        return Border.all(
          color: widget.borderColor ?? context.colors.scheme.outline,
          width: AppBorder.button,
        );
      default:
    }
    return null;
  }

  bool _ripple(bool enbaled) {
    if (enbaled == false) {
      return false;
    }

    switch (widget.variant) {
      case ButtonWidgetVariant.link:
        return false;
      default:
        return true;
    }
  }

  // 主视图
  Widget _buildView() {
    // 组件
    var ws = <Widget>[];
    if (widget.icon != null) {
      ws.add(widget.icon!);
    }
    if (widget.child != null) {
      ws.add(widget.child!);
    }
    if (widget.text?.isNotEmpty == true) {
      ws.add(TextWidget.label(
        widget.text!,
        color: _textColor(),
        scale: widget.scale,
        textAlign: TextAlign.center,
      ));
    }

    // loading Indicator
    if (widget.loading == true) {
      ws.add(CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation(_textColor()),
      ).tightSize(_size(16)));
    }

    // onTap 事件 为空，关闭启用状态
    var enabled = widget.enabled;
    if (widget.onTap == null) {
      enabled = false;
    }

    // 反转
    if (widget.reverse == true && ws.length > 1) {
      ws = ws.reversed.toList();
    }

    // 子组件
    Widget child = ws.length == 1
        ? ws[0]
        : ws.toRowSpace(
            space: widget.iconSpace ?? _size(AppSpace.iconText),
            mainAxisAlignment:
                widget.mainAxisAlignment ?? MainAxisAlignment.center,
            mainAxisSize: widget.mainAxisSize ?? MainAxisSize.min,
          );

    // 约束, 不设置组件默认紧包裹
    if (widget._width != null || widget.height != null) {
      child = child.alignment(Alignment.center).constrained(
            width: widget._width,
            height: widget.height,
          );
    }

    // 边距
    if (widget.variant != ButtonWidgetVariant.icon) {
      child = child.padding(
        vertical: _size(AppPadding.button.vertical),
        horizontal: _size(AppPadding.button.horizontal),
      );
    }

    // 涟漪效果
    child = child.ripple(
      enable: _ripple(enabled),
      highlightColor: _highlightColor(),
    );

    // 背景、边框
    if (widget.variant != ButtonWidgetVariant.icon) {
      child = child.decorated(
        color: _backgroundColor(),
        borderRadius: _borderRadius(),
        border: _border(),
      );
    }

    // 裁切圆角
    if (widget.borderRadius == null || widget.borderRadius! > 0) {
      child =
          child.clipRRect(all: _size(widget.borderRadius ?? AppRadius.button));
    }

    // 阴影
    if ((widget.elevation == null || widget.elevation! > 0) &&
        (widget.variant == ButtonWidgetVariant.primary ||
            widget.variant == ButtonWidgetVariant.secondary ||
            widget.variant == ButtonWidgetVariant.destructive)) {
      child = child.elevation(
        pressed ? 0 : widget.elevation ?? AppElevation.button,
        borderRadius: BorderRadius.circular(_size(AppRadius.button)),
        shadowColor: context.colors.shadow, // const Color(0x30000000),
      );
    }

    // 事件、透明度、缩放
    child = child
        .gestures(
          onTapChange: enabled
              ? (tapStatus) => setState(() => pressed = tapStatus)
              : null,
          onTap: enabled
              ? () {
                  widget.onTap?.call();
                }
              : null,
        )
        .opacity(enabled ? 1.0 : 0.5)
        .scale(all: pressed ? 0.99 : 1.0);

    // 动画:
    // 1 开启动画需要定义 .animate
    // 2 开启动画需要扩展设置  animate: true
    // 3 默认不开启 节约流畅
    // 开启动画，去掉注释即可
    // child = child.animate(const Duration(milliseconds: 150), Curves.easeOut);

    // 样式
    return child;
  }

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
