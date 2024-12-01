import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yug_app/common/style/scale.dart';
import 'package:yug_app/common/style/space.dart';
import 'package:yug_app/common/widgets/widgets/text.dart';

import 'index.dart';

class TextPage extends GetView<TextController> {
  const TextPage({super.key});

  // 主视图
  Widget _buildView() {
    return <Widget>[
      // H1
      const TextWidget.h1(
        "H1.large",
        scale: WidgetScale.large,
      ),
      const TextWidget.h1("H1.medium"),
      const TextWidget.h1(
        "H1.small",
        scale: WidgetScale.small,
      ),

      // H2
      const TextWidget.h2(
        "H2.large",
        scale: WidgetScale.large,
      ),
      const TextWidget.h2("H2.medium"),
      const TextWidget.h2(
        "H2.small",
        scale: WidgetScale.small,
      ),

      // H3
      const TextWidget.h3(
        "H3.large",
        scale: WidgetScale.large,
      ),
      const TextWidget.h3("H3.medium"),
      const TextWidget.h3(
        "H3.small",
        scale: WidgetScale.small,
      ),

      // H4
      const TextWidget.h4(
        "H4.large",
        scale: WidgetScale.large,
      ),
      const TextWidget.h4("H4.medium"),
      const TextWidget.h4(
        "H4.small",
        scale: WidgetScale.small,
      ),

      // Body
      const TextWidget.body(
        "Body.large",
        scale: WidgetScale.large,
      ),
      const TextWidget.body("Body.medium"),
      const TextWidget.body(
        "Body.small",
        scale: WidgetScale.small,
      ),

      // Label
      const TextWidget.label(
        "Label.large",
        scale: WidgetScale.large,
      ),
      const TextWidget.label("Label.medium"),
      const TextWidget.label(
        "Label.small",
        scale: WidgetScale.small,
      ),

      // muted
      const TextWidget.muted(
        "Muted.large",
        scale: WidgetScale.large,
      ),
      const TextWidget.muted("Muted.medium"),
      const TextWidget.muted(
        "Muted.small",
        scale: WidgetScale.small,
      ),

      // end
    ]
        .toColumnSpace(
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .paddingHorizontal(AppSpace.page)
        .scrollable();
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<TextController>(
      init: TextController(),
      id: "text",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("text")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
