import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:yug_app/common/style/theme.dart';

enum IconWidgetType { icon, svg, image, url }

/// 图标组件
class IconWidget extends StatelessWidget {
  /// 图标类型
  final IconWidgetType type;

  /// 图标数据
  final IconData? iconData;

  /// assets 路径
  final String? assetName;

  /// 图片 url
  final String? imageUrl;

  /// 尺寸
  final double? size;

  /// 宽
  final double? width;

  /// 高
  final double? height;

  /// 颜色
  final Color? color;

  /// 是否小圆点
  final bool? isDot;

  /// Badge 文字
  final String? badgeString;

  /// 图片 fit
  final BoxFit? fit;

  const IconWidget({
    Key? key,
    this.type = IconWidgetType.icon,
    this.size,
    this.width,
    this.height,
    this.color,
    this.iconData,
    this.isDot,
    this.badgeString,
    this.assetName,
    this.imageUrl,
    this.fit,
  }) : super(key: key);

  IconWidget.icon(
    this.iconData, {
    Key? key,
    this.type = IconWidgetType.icon,
    this.size = 24,
    this.width,
    this.height,
    this.color,
    this.isDot,
    this.badgeString,
    this.assetName,
    this.imageUrl,
    this.fit,
  }) : super(key: key) {
    return;
  }

  IconWidget.image(
    this.assetName, {
    Key? key,
    this.type = IconWidgetType.image,
    this.size = 24,
    this.width,
    this.height,
    this.color,
    this.iconData,
    this.isDot,
    this.badgeString,
    this.imageUrl,
    this.fit,
  }) : super(key: key) {
    return;
  }

  IconWidget.svg(
    this.assetName, {
    Key? key,
    this.type = IconWidgetType.svg,
    this.size = 24,
    this.width,
    this.height,
    this.color,
    this.iconData,
    this.isDot,
    this.badgeString,
    this.imageUrl,
    this.fit,
  }) : super(key: key) {
    return;
  }

  IconWidget.url(
    this.imageUrl, {
    Key? key,
    this.type = IconWidgetType.url,
    this.size = 24,
    this.width,
    this.height,
    this.color,
    this.iconData,
    this.isDot,
    this.badgeString,
    this.assetName,
    this.fit,
  }) : super(key: key) {
    return;
  }

  @override
  Widget build(BuildContext context) {
    Widget? icon;
    switch (type) {
      case IconWidgetType.icon:
        icon = Icon(
          iconData,
          size: size,
          color: color ?? AppTheme.primary,
        );
        break;
      case IconWidgetType.svg:
        icon = SvgPicture.asset(
          assetName!,
          width: width ?? size,
          height: height ?? size,
          color: color,
          fit: fit ?? BoxFit.contain,
        );
        break;
      case IconWidgetType.image:
        icon = Image.asset(
          assetName!,
          width: width ?? size,
          height: height ?? size,
          color: color,
          fit: fit ?? BoxFit.contain,
        );
        break;
      case IconWidgetType.url:
        icon = Image.network(
          imageUrl!,
          width: width ?? size,
          height: height ?? size,
          color: color,
          fit: fit ?? BoxFit.contain,
        );
        break;
      default:
        return const SizedBox();
    }

    // 圆点
    if (isDot == true) {
      return badges.Badge(
        position: badges.BadgePosition.bottomEnd(bottom: 0, end: -2),
        badgeStyle: badges.BadgeStyle(
          elevation: 0,
          badgeColor: AppTheme.primary,
          padding: const EdgeInsets.all(4.0),
        ),
        child: icon,
      );
    }

    // 文字、数字
    if (badgeString != null) {
      return badges.Badge(
        badgeContent: Text(
          badgeString!,
          style: TextStyle(
            color: Colors.white,
            fontSize: 9,
          ),
        ),
        position: badges.BadgePosition.topEnd(top: -7, end: -8),
        badgeStyle: badges.BadgeStyle(
          elevation: 0,
          badgeColor: AppTheme.primary,
          padding: const EdgeInsets.all(4.0),
        ),
        child: icon,
      );
    }

    // 图标
    return icon;
  }
}
