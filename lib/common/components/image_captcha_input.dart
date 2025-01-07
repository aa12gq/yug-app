import 'package:flutter/material.dart';

class ImageCaptchaInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onRefresh;

  const ImageCaptchaInput({
    super.key,
    required this.controller,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: '图片验证码',
              prefixIcon: Icon(Icons.security),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '请输入图片验证码';
              }
              return null;
            },
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: onRefresh,
          child: Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Center(
              child: Text('点击刷新'),
            ),
          ),
        ),
      ],
    );
  }
}
