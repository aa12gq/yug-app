import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yug_app/common/style/space.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppSpace.listRow),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: context.theme.colorScheme.onSurface.withOpacity(0.2),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              "或",
              style: TextStyle(
                color: context.theme.colorScheme.onSurface.withOpacity(0.5),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: context.theme.colorScheme.onSurface.withOpacity(0.2),
            ),
          ),
        ],
      ),
    );
  }
}
