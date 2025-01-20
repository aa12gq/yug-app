import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../index.dart';
import 'package:yug_app/common/style/theme.dart';

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
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                  fontSize: 13.sp,
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
                style: TextStyle(fontSize: 14.sp),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: theme.colorScheme.surface.withValues(alpha: 0.6),
                  hintText: placeholder,
                  hintStyle: TextStyle(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
                    fontSize: 14.sp,
                  ),
                  prefixIcon: prefix != null
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: prefix,
                        )
                      : null,
                  prefixIconConstraints: BoxConstraints(
                    minWidth: 40.w,
                    minHeight: 40.w,
                  ),
                  suffixIcon: suffix,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.w,
                  ),
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.w),
                    borderSide: BorderSide(
                      color: theme.colorScheme.outline.withValues(alpha: 0.1),
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.w),
                    borderSide: BorderSide(
                      color: theme.colorScheme.outline.withValues(alpha: 0.1),
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.w),
                    borderSide: BorderSide(
                      color: AppTheme.primary.withValues(alpha: 0.6),
                      width: 1.5,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.w),
                    borderSide: BorderSide(
                      color: theme.colorScheme.error.withValues(alpha: 0.6),
                      width: 1,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.w),
                    borderSide: BorderSide(
                      color: theme.colorScheme.error,
                      width: 1.5,
                    ),
                  ),
                ),
              ),

              // 提示词
              if (tipText != null)
                Text(
                  tipText,
                  style: TextStyle(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
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
