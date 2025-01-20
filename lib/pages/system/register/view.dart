import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';
import 'package:yug_app/common/components/page_title.dart';
import 'package:yug_app/common/index.dart';
import 'package:yug_app/common/utils/validators.dart';
import 'package:yug_app/common/widgets/form/input.dart';
import 'package:yug_app/common/widgets/wave_underline.dart';

import 'index.dart';
import 'wave_painter.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  // 注册类型选择按钮
  Widget _buildRegisterTypeButton(
      BuildContext context, Map<String, dynamic> item, bool isSelected) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => controller.switchRegisterType(item['type'] as String),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12.w),
            decoration: BoxDecoration(
              color: isSelected
                  ? context.theme.primaryColor.withValues(alpha: 0.08)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12.w),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  item['icon'] as IconData,
                  size: 24.w,
                  color: isSelected ? context.theme.primaryColor : Colors.grey,
                ),
                SizedBox(height: 4.w),
                Text(
                  item['text'] as String,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color:
                        isSelected ? context.theme.primaryColor : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 注册类型选择按钮
  void _handleSwipe(DragEndDetails details) {
    final items = [
      'username',
      'phone',
      'email',
    ];
    final currentIndex = items.indexOf(controller.registerType.value);
    if (details.primaryVelocity! < 0 && currentIndex < items.length - 1) {
      // 向左滑动，切换到下一个
      controller.switchRegisterType(items[currentIndex + 1]);
    } else if (details.primaryVelocity! > 0 && currentIndex > 0) {
      // 向右滑动，切换到上一个
      controller.switchRegisterType(items[currentIndex - 1]);
    }
  }

  // 注册类型切换器
  Widget _buildRegisterTypeSwitcher(BuildContext context) {
    final items = [
      {
        'type': 'username',
        'text': LocaleKeys.registerTypeUsername.tr,
        'icon': Icons.person_outline_rounded,
      },
      {
        'type': 'phone',
        'text': LocaleKeys.registerTypePhone.tr,
        'icon': Icons.phone_android_rounded,
      },
      {
        'type': 'email',
        'text': LocaleKeys.registerTypeEmail.tr,
        'icon': Icons.email_outlined,
      },
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Obx(() {
        final currentType = controller.registerType.value;

        return GestureDetector(
          onHorizontalDragEnd: _handleSwipe,
          child: Row(
            children: items.map((item) {
              final isSelected = item['type'] == currentType;
              return _buildRegisterTypeButton(context, item, isSelected);
            }).toList(),
          ),
        );
      }),
    ).paddingBottom(AppSpace.listRow);
  }

  // 表单页
  Widget _buildForm(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          // 装饰背景
          Positioned(
            right: -50.w,
            bottom: -50.w,
            child: Container(
              width: 150.w,
              height: 150.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.theme.primaryColor.withValues(alpha: 0.1),
                    context.theme.primaryColor.withValues(alpha: 0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(75.w),
              ),
            ),
          ),
          Positioned(
            left: -30.w,
            top: -30.w,
            child: Container(
              width: 100.w,
              height: 100.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.theme.colorScheme.secondary.withValues(alpha: 0.1),
                    context.theme.colorScheme.secondary.withValues(alpha: 0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(50.w),
              ),
            ),
          ),

          // 表单内容
          Form(
            key: controller.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: <Widget>[
              // 注册类型选择
              _buildRegisterTypeSwitcher(context),

              // 用户名输入框 (仅用户名密码注册时显示)
              if (controller.registerType.value == 'username')
                Hero(
                  tag: 'username_field',
                  child: InputFormFieldWidget(
                    controller: controller.userNameController,
                    labelText: LocaleKeys.registerFormName.tr,
                    prefix:
                        Icon(Icons.person, color: context.theme.primaryColor),
                    validator: Validatorless.multiple([
                      Validatorless.required(LocaleKeys.validatorRequired.tr),
                      Validatorless.min(
                          3, LocaleKeys.validatorMin.trParams({"size": "3"})),
                      Validatorless.max(
                          20, LocaleKeys.validatorMax.trParams({"size": "20"})),
                    ]),
                  ),
                ).paddingBottom(AppSpace.listRow),

              // 手机号输入框 (仅手机号注册时显示)
              if (controller.registerType.value == 'phone')
                InputFormFieldWidget(
                  controller: controller.phoneController,
                  labelText: LocaleKeys.registerFormPhoneNumber.tr,
                  keyboardType: TextInputType.phone,
                  prefix: Icon(Icons.phone_android,
                      color: context.theme.primaryColor),
                  validator: Validatorless.multiple([
                    Validatorless.required(LocaleKeys.validatorRequired.tr),
                  ]),
                ).paddingBottom(AppSpace.listRow),

              // 邮箱输入框 (仅邮箱注册时显示)
              if (controller.registerType.value == 'email')
                InputFormFieldWidget(
                  controller: controller.emailController,
                  labelText: LocaleKeys.registerFormEmail.tr,
                  keyboardType: TextInputType.emailAddress,
                  prefix: Icon(Icons.email, color: context.theme.primaryColor),
                  validator: Validatorless.multiple([
                    Validatorless.required(LocaleKeys.validatorRequired.tr),
                    Validatorless.email(LocaleKeys.validatorEmail.tr),
                  ]),
                ).paddingBottom(AppSpace.listRow),

              // 密码输入框 (始终显示)
              Hero(
                tag: 'password_field',
                child: InputFormFieldWidget(
                  controller: controller.passwordController,
                  labelText: LocaleKeys.registerFormPassword.tr,
                  obscureText: true,
                  prefix: Icon(Icons.lock_outline,
                      color: context.theme.primaryColor),
                  validator: Validatorless.multiple([
                    Validatorless.required(LocaleKeys.validatorRequired.tr),
                    Validators.password(
                        6,
                        18,
                        LocaleKeys.validatorPassword
                            .trParams({"min": "6", "max": "18"})),
                  ]),
                ),
              ).paddingBottom(AppSpace.listRow),

              // 验证码输入框 (仅手机号和邮箱注册时显示)
              if (controller.registerType.value != 'username')
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
                  decoration: BoxDecoration(
                    color: context.theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(20.w),
                    border: Border.all(
                      color: context.theme.primaryColor.withValues(alpha: 0.1),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.02),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: <Widget>[
                    Expanded(
                      child: InputFormFieldWidget(
                        controller: controller.verifyCodeController,
                        labelText: LocaleKeys.registerFormVerifyCode.tr,
                        keyboardType: TextInputType.number,
                        prefix: Icon(Icons.verified_user,
                            color: context.theme.primaryColor),
                        validator: Validatorless.multiple([
                          Validatorless.required(
                              LocaleKeys.validatorRequired.tr),
                        ]),
                      ),
                    ),
                    Container(
                      height: 40.w,
                      margin: EdgeInsets.only(left: 16.w),
                      child: TextButton(
                        onPressed: controller.getVerifyCode,
                        style: TextButton.styleFrom(
                          foregroundColor: context.theme.primaryColor,
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.w),
                            side: BorderSide(
                              color: context.theme.primaryColor
                                  .withValues(alpha: 0.5),
                            ),
                          ),
                        ),
                        child: Text(
                          LocaleKeys.registerGetVerifyCode.tr,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ].toRow(),
                ).paddingBottom(AppSpace.listRow * 2),

              // 注册按钮
              Container(
                width: double.infinity,
                height: 56.w,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      context.theme.primaryColor,
                      context.theme.colorScheme.secondary,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(28.w),
                  boxShadow: [
                    BoxShadow(
                      color: context.theme.primaryColor.withValues(alpha: 0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: controller.onSignUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.w),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.loginSignUp.tr,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 20.w,
                      ).paddingOnly(left: 8.w),
                    ],
                  ),
                ),
              ).paddingBottom(AppSpace.listRow),

              // 登录文字
              TextButton(
                onPressed: controller.onSignIn,
                style: TextButton.styleFrom(
                  foregroundColor: context.theme.primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 8.w),
                ),
                child: Text(
                  LocaleKeys.registerHaveAccount.tr,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              // end
            ].toColumn().paddingAll(AppSpace.card),
          ),
        ],
      ),
    ).paddingAll(AppSpace.card);
  }

  // 主视图
  Widget _buildView(BuildContext context) {
    return Stack(
      children: [
        // 背景渐变
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                context.theme.primaryColor.withValues(alpha: 0.05),
                Colors.transparent,
              ],
            ),
          ),
        ),

        CustomPaint(
          painter: WavePainter(
            color: context.theme.primaryColor.withValues(alpha: 0.08),
            waveHeight: 100,
          ),
          size: Size(Get.width, Get.height),
        ),

        SingleChildScrollView(
          child: <Widget>[
            // 头部标题
            Hero(
              tag: 'page_title',
              child: AuthPageTitle(
                title: "Get Started",
                subtitle: "Create your account to continue",
                showBackButton: true,
              ),
            ),

            // 表单
            _buildForm(context),
          ]
              .toColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
              )
              .paddingHorizontal(AppSpace.page),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      id: "register",
      builder: (_) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: context.theme.primaryColor,
              ),
              onPressed: () => Get.back(),
            ),
          ),
          backgroundColor: context.theme.colorScheme.background,
          body: GestureDetector(
            onHorizontalDragEnd: _handleSwipe,
            child: SafeArea(
              child: Stack(
                children: [
                  // 背景渐变
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          context.theme.primaryColor.withValues(alpha: 0.05),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),

                  CustomPaint(
                    painter: WavePainter(
                      color: context.theme.primaryColor.withValues(alpha: 0.08),
                      waveHeight: 100,
                    ),
                    size: Size(Get.width, Get.height),
                  ),

                  SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(), // 防止滚动与手势冲突
                    child: <Widget>[
                      // 头部标题
                      Hero(
                        tag: 'page_title',
                        child: AuthPageTitle(
                          title: "Get Started",
                          subtitle: "Create your account to continue",
                          showBackButton: true,
                        ),
                      ),

                      // 表单
                      _buildForm(context),
                    ]
                        .toColumn(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        )
                        .paddingHorizontal(AppSpace.page),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
