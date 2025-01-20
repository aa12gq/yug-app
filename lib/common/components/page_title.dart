import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

// 页面标题 组件
class PageTitleWidget extends StatelessWidget {
  /// 标题
  final String title;

  /// 说明
  final String desc;

  const PageTitleWidget({
    super.key,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      TextWidget.h2(title),
      TextWidget.label(desc),
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .padding(
          left: 10,
          top: 10,
          bottom: 30,
        );
  }
}

// 登录注册页面标题组件
class AuthPageTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool showBackButton;

  const AuthPageTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 25.w,
        right: 25.w,
        top: 20.w,
        bottom: subtitle != null ? 40.w : 30.w,
      ),
      child: Stack(
        children: [
          // 装饰背景 1
          Positioned(
            right: -20.w,
            top: showBackButton ? 50.w : 0,
            child: Container(
              width: 120.w,
              height: 120.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    context.theme.primaryColor.withValues(alpha: 0.1),
                    context.theme.primaryColor.withValues(alpha: 0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(60.w),
              ),
            ),
          ),

          // 装饰背景 2
          Positioned(
            right: 40.w,
            top: showBackButton ? 100.w : 50.w,
            child: Container(
              width: 60.w,
              height: 60.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    context.theme.colorScheme.secondary.withValues(alpha: 0.1),
                    context.theme.colorScheme.secondary.withValues(alpha: 0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(30.w),
              ),
            ),
          ),

          // 内容
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showBackButton)
                Container(
                  margin: EdgeInsets.only(bottom: 30.w),
                  decoration: BoxDecoration(
                    color: context.theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(12.w),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: context.theme.primaryColor,
                      size: 20.w,
                    ),
                    onPressed: () => Get.back(),
                    padding: EdgeInsets.all(8.w),
                    constraints: const BoxConstraints(),
                  ),
                ),
              Row(
                children: [
                  Container(
                    width: 6.w,
                    height: 45.w,
                    margin: EdgeInsets.only(right: 15.w),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          context.theme.primaryColor,
                          context.theme.colorScheme.secondary,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(3.w),
                      boxShadow: [
                        BoxShadow(
                          color:
                              context.theme.primaryColor.withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 38.sp,
                            fontWeight: FontWeight.w800,
                            color: context.theme.colorScheme.onBackground,
                            letterSpacing: -1,
                            height: 1.1,
                            shadows: [
                              Shadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                offset: const Offset(0, 2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                        ),
                        if (subtitle != null)
                          Container(
                            margin: EdgeInsets.only(top: 12.w),
                            child: Text(
                              subtitle!,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: context.theme.colorScheme.onBackground
                                    .withValues(alpha: 0.5),
                                height: 1.5,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
