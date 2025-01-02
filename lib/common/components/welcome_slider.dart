import 'package:carousel_slider/carousel_slider.dart';
import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:yug_app/common/models/welcome_model.dart';
import 'package:yug_app/common/widgets/image.dart';
import 'package:yug_app/common/widgets/text.dart';

import '../index.dart';

/// 欢迎 slider
class WelcomeSliderWidget extends StatelessWidget {
  /// 项目
  final List<WelcomeModel> items;

  /// 页数发生变化
  final Function(int) onPageChanged;

  /// 控制器
  final CarouselSliderController? carouselController;

  const WelcomeSliderWidget(
    this.items, {
    super.key,
    required this.onPageChanged,
    this.carouselController,
  });

  Widget sliderItem(WelcomeModel item) {
    return Builder(
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: <Widget>[
            // 图
            if (item.image != null)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.w),
                child: ImageWidget.img(
                  item.image!,
                  fit: BoxFit.contain,
                  height: MediaQuery.of(context).size.height * 0.55,
                ),
              ),

            // 标题
            if (item.title != null)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.w),
                child: TextWidget.h3(
                  item.title ?? "",
                  maxLines: 2,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),

            // 描述
            if (item.desc != null)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.w),
                child: TextWidget.text(
                  item.desc ?? "",
                  maxLines: 3,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[600],
                  ),
                ),
              ),
          ]
              .toColumn(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
              )
              .width(MediaQuery.of(context).size.width)
              .paddingVertical(10.w),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: carouselController,
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.8,
        viewportFraction: 1,
        enlargeCenterPage: false,
        enableInfiniteScroll: false,
        autoPlay: false,
        onPageChanged: (index, reason) => onPageChanged(index),
      ),
      items: <Widget>[
        for (var item in items) sliderItem(item),
      ].toList(),
    );
  }
}
