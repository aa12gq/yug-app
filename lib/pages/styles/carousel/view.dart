import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './controller.dart' as beta_carousel;

class CarouselPage extends GetView<beta_carousel.CarouselController> {
  const CarouselPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("CarouselPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<beta_carousel.CarouselController>(
      init: beta_carousel.CarouselController(),
      id: "carousel",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("carousel")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
