import 'package:carousel_slider/carousel_slider.dart';
import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:yug_app/common/models/welcome_model.dart';

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
                padding: EdgeInsets.symmetric(vertical: 20.w),
                child: ImageWidget.img(
                  item.image!,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width,
                ),
              ),

            // 标题
            if (item.title != null)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.w),
                child: TextWidget.h2(
                  item.title ?? "",
                  maxLines: 2,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),

            // 描述
            if (item.desc != null)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.w),
                child: TextWidget.label(
                  item.desc ?? "",
                  maxLines: 3,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
          ]
              .toColumn(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              )
              .width(MediaQuery.of(context).size.width),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: CarouselSlider(
        carouselController: carouselController,
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.7,
          viewportFraction: 1,
          enlargeCenterPage: false,
          enableInfiniteScroll: false,
          autoPlay: false,
          onPageChanged: (index, reason) => onPageChanged(index),
        ),
        items: <Widget>[
          for (var item in items) sliderItem(item),
        ].toList(),
      ),
    );
  }
}
