import 'package:cached_network_image/cached_network_image.dart';
import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yug_app/common/style/padding.dart';
import 'package:yug_app/common/style/radius.dart';

/// 图片类型
enum ImageWidgetType {
  img,
  svg,
  svgRaw,
}

/// 图片组件
class ImageWidget extends StatefulWidget {
  const ImageWidget({
    super.key,
    required this.path,
    required this.type,
    this.radius,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.errorWidget,
    this.elevation,
    this.color,
  });

  /// 文件路径
  final String path;

  /// 类型
  final ImageWidgetType type;

  /// 圆角
  final double? radius;

  /// 宽度
  final double? width;

  /// 高度
  final double? height;

  /// 自适应方式
  final BoxFit? fit;

  /// 占位图
  final Widget? placeholder;

  /// 错误图
  final Widget? errorWidget;

  /// 阴影
  final double? elevation;

  /// 颜色
  final Color? color;

  const ImageWidget.img(
    this.path, {
    super.key,
    this.radius,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.errorWidget,
    this.elevation,
    this.color,
  }) : type = ImageWidgetType.img;

  const ImageWidget.svg(
    this.path, {
    super.key,
    this.radius,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.errorWidget,
    this.elevation,
    this.color,
  }) : type = ImageWidgetType.svg;

  const ImageWidget.svgRaw(
    String raw, {
    super.key,
    this.radius,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.errorWidget,
    this.elevation,
    this.color,
  })  : type = ImageWidgetType.svgRaw,
        path = raw;

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  Widget _buildView() {
    Widget ws = widget.placeholder ?? const SizedBox();

    // 是否是网络图片
    bool isNetwork = widget.path.startsWith('http') ||
        widget.path.startsWith('https') ||
        widget.path.startsWith('//');

    // 1 图片

    // asset 图片
    if (widget.type == ImageWidgetType.img && !isNetwork) {
      ws = Image.asset(
        widget.path,
        fit: widget.fit,
        color: widget.color,
        // frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        //   if (wasSynchronouslyLoaded) {
        //     return child;
        //   }
        //   return AnimatedOpacity(
        //     opacity: frame == null ? 0 : 1,
        //     duration: const Duration(seconds: 1),
        //     curve: Curves.easeOut,
        //     child: widget.placeholder ?? const CircularProgressIndicator(),
        //   );
        // },
      );
    }

    // 网络图片
    else if (widget.type == ImageWidgetType.img && isNetwork) {
      ws = CachedNetworkImage(
        imageUrl: widget.path,
        fit: widget.fit,
        cacheKey: widget.path.hashCode.toString(),
        color: widget.color,
        // imageBuilder: (context, imageProvider) => Container(
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: imageProvider,
        //         fit: BoxFit.cover,
        //         colorFilter:
        //             const ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
        //   ),
        // ),
        placeholder: (context, url) =>
            widget.placeholder ??
            const CircularProgressIndicator()
                .tightSize(AppSize.indicator)
                .center(),
        errorWidget: (context, url, error) =>
            widget.errorWidget ?? const Icon(Icons.error),
      );
    }

    //  svg asset 图片
    else if (widget.type == ImageWidgetType.svg && !isNetwork) {
      ws = SvgPicture.asset(
        widget.path,
        fit: widget.fit ?? BoxFit.contain,
        colorFilter: widget.color != null
            ? ColorFilter.mode(widget.color!, BlendMode.srcIn)
            : null,
        placeholderBuilder: (BuildContext context) =>
            widget.placeholder ??
            Center(
              child: const CircularProgressIndicator()
                  .tightSize(AppSize.indicator)
                  .center(),
            ),
      );
    }

    //  svg 网络图片
    else if (widget.type == ImageWidgetType.svg && isNetwork) {
      ws = SvgPicture.network(
        widget.path,
        fit: widget.fit ?? BoxFit.contain,
        colorFilter: widget.color != null
            ? ColorFilter.mode(widget.color!, BlendMode.srcIn)
            : null,
        placeholderBuilder: (BuildContext context) =>
            widget.placeholder ??
            Center(
              child: const CircularProgressIndicator()
                  .tightSize(AppSize.indicator)
                  .center(),
            ),
      );
    }

    // svg raw
    else if (widget.type == ImageWidgetType.svgRaw) {
      ws = SvgPicture.string(
        widget.path,
        fit: widget.fit ?? BoxFit.contain,
        colorFilter: widget.color != null
            ? ColorFilter.mode(widget.color!, BlendMode.srcIn)
            : null,
        placeholderBuilder: (BuildContext context) =>
            widget.placeholder ??
            Center(
              child: const CircularProgressIndicator()
                  .tightSize(AppSize.indicator)
                  .center(),
            ),
      );
    }

    // 2 约束
    if (widget.width != null || widget.height != null) {
      ws = ws.tight(
        width: widget.width,
        height: widget.height,
      );
    }

    // 3 圆角
    ws = ws.clipRRect(all: widget.radius ?? AppRadius.img);

    // 4 阴影
    // ws = ws.elevation(
    //   widget.elevation ?? AppElevation.image,
    //   borderRadius: BorderRadius.circular(widget.radius ?? AppRadius.img),
    //   shadowColor: context.colors.shadow,
    // );

    return ws;
  }

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
