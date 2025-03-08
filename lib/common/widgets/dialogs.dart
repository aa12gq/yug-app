import 'package:flutter/material.dart';

/// 简单的信息对话框
Future<T?> showInfoDialog<T>(BuildContext context,
    {required String title,
    String? content,
    Widget? contentChild,
    VoidCallback? onConfirm}) {
  return showDialog<T>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: contentChild ?? (content != null ? Text(content) : null),
      actions: [
        TextButton(
          onPressed: () {
            if (onConfirm != null) {
              onConfirm();
            } else {
              Navigator.of(context).pop();
            }
          },
          child: const Text('确定'),
        ),
      ],
    ),
  );
}

/// 确认对话框
Future<bool> showConfirmDialog(BuildContext context,
    {required String title,
    String? content,
    Widget? contentChild,
    String confirmText = '确定',
    String cancelText = '取消'}) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: contentChild ?? (content != null ? Text(content) : null),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(cancelText),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(confirmText),
        ),
      ],
    ),
  );
  return result ?? false;
}
