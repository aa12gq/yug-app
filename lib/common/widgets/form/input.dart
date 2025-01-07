import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../index.dart';

/// Form 字段组件
class InputFormFieldWidget extends FormField<String> {
  InputFormFieldWidget({
    super.key,
    required this.labelText,
    this.tipText,
    this.initValue,
    this.onChanged,
    this.controller,
    this.placeholder,
    this.prefix,
    this.suffix,
    this.obscureText,
    this.cleanable,
    this.keyboardType,
    this.autofocus,
    Function(String?)? validator,
  }) : super(
          initialValue: initValue ?? controller?.text,
          validator: (val) {
            if (validator != null) {
              return validator(val);
            }
            return null;
          },
          builder: (field) {
            void onChangedHandler(String value) {
              field.didChange(value);
              onChanged?.call(value);
            }

            final theme = Theme.of(field.context);

            return <Widget>[
              // 字段说明
              Text(
                labelText,
                style: TextStyle(
                  color: theme.colorScheme.onSurface.withOpacity(0.8),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ).paddingLeft(AppSpace.card),

              // 输入框
              TextFormField(
                controller: controller,
                obscureText: obscureText ?? false,
                keyboardType: keyboardType,
                autofocus: autofocus ?? false,
                onChanged: onChangedHandler,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: theme.colorScheme.surface,
                  hintText: placeholder,
                  prefixIcon: prefix,
                  suffixIcon: suffix,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: theme.primaryColor.withOpacity(0.1),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: theme.primaryColor.withOpacity(0.1),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: theme.primaryColor,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: theme.colorScheme.error,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: theme.colorScheme.error,
                    ),
                  ),
                ),
              ),

              // 提示词
              if (tipText != null)
                Text(
                  tipText,
                  style: TextStyle(
                    color: theme.colorScheme.onSurface.withOpacity(0.5),
                    fontSize: 12.sp,
                  ),
                ).paddingLeft(AppSpace.card),

              // 错误提示
              if (field.errorText != null)
                Text(
                  field.errorText!,
                  style: TextStyle(
                    color: theme.colorScheme.error,
                    fontSize: 12.sp,
                  ),
                ).paddingLeft(AppSpace.card),
            ].toColumnSpace(
              crossAxisAlignment: CrossAxisAlignment.start,
            );
          },
        );

  /// 字段文字
  final String labelText;

  /// 提示词
  final String? tipText;

  /// 初始值
  final String? initValue;

  /// 输入框控制器
  final TextEditingController? controller;

  /// 占位符
  final String? placeholder;

  /// 前缀
  final Widget? prefix;

  /// 后缀
  final Widget? suffix;

  /// 是否隐藏文本
  final bool? obscureText;

  /// 是否可清空
  final bool? cleanable;

  /// 值被改变时的回调
  final void Function(String?)? onChanged;

  /// 输入法类型
  final TextInputType? keyboardType;

  /// 自动焦点
  final bool? autofocus;

  @override
  InputFormWidgetFieldState createState() => InputFormWidgetFieldState();
}

class InputFormWidgetFieldState extends FormFieldState<String> {
  @override
  InputFormFieldWidget get widget => super.widget as InputFormFieldWidget;
}
