import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatMessage {
  final String content;
  final bool isUser;
  final DateTime time;
  final bool? hasActions;

  ChatMessage({
    required this.content,
    required this.isUser,
    bool? hasActions,
    DateTime? time,
  })  : time = time ?? DateTime.now(),
        hasActions = hasActions ?? false;
}

class AIChatController extends GetxController {
  AIChatController();

  // 文本输入控制器
  final textController = TextEditingController();

  // 当前模式
  String currentMode = "闲聊模式";

  // 消息列表
  final List<ChatMessage> messages = [
    ChatMessage(
      content:
          "你好，我是小语，很高兴见到你！我可以帮你练习口语、纠正发音、回答问题，或者陪你聊天。\n\n你可以：\n1. 选择上方的功能模式\n2. 使用文字输入\n3. 点击消息可以进行朗读、重新生成等操作",
      isUser: false,
      hasActions: true,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }

  // 切换模式
  void switchMode(String mode) {
    if (currentMode != mode) {
      currentMode = mode;
      messages.insert(
        0,
        ChatMessage(
          content: _getModeWelcomeMessage(mode),
          isUser: false,
          hasActions: true, // AI消息有操作按钮
        ),
      );
      update(["ai_chat", "messages"]);
    }
  }

  // 获取模式欢迎语
  String _getModeWelcomeMessage(String mode) {
    switch (mode) {
      case "闲聊模式":
        return "已切换到闲聊模式。我可以陪你聊天、讲故事、玩游戏，让我们开始愉快的对话吧！";
      case "口语练习":
        return "已切换到口语练习模式。我会根据你的水平和兴趣，设计合适的口语练习内容。准备好开始了吗？";
      case "发音纠正":
        return "已切换到发音纠正模式。我会仔细听你的发音，并给出专业的纠正建议。你可以说出任何想练习的单词或句子。";
      case "翻译助手":
        return "已切换到翻译助手模式。我可以帮你翻译各种语言，并解释语言中的文化差异。需要翻译什么内容呢？";
      case "情感倾诉":
        return "已切换到情感倾诉模式。在这里，你可以和我分享任何心事，我会认真倾听并给出建议。";
      case "创作灵感":
        return "已切换到创作灵感模式。让我们一起激发创意，我可以帮你构思故事、写作、创作诗歌等。";
      default:
        return "已切换到$mode。让我们开始吧！";
    }
  }

  // 发送消息
  void onSend() {
    final text = textController.text.trim();
    if (text.isEmpty) return;

    // 添加用户消息
    messages.insert(
      0,
      ChatMessage(
        content: text,
        isUser: true,
        hasActions: false, // 用户消息没有操作按钮
      ),
    );
    update(["messages"]);

    // 清空输入框
    textController.clear();
  }

  // 虚拟助手点击
  void onAssistantTap() {
    // TODO: 实现虚拟助手点击响应
  }

  // 朗读消息
  void onReadMessage(ChatMessage message) {
    // TODO: 实现文字转语音功能
  }

  // 重新生成回复
  void onRegenerateMessage(ChatMessage message) {
    // TODO: 实现重新生成回复功能
  }

  // 更多选项
  void onMore() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.refresh_rounded),
              title: const Text("重新开始"),
              onTap: () {
                Get.back();
                messages.clear();
                messages.add(
                  ChatMessage(
                    content:
                        "你好，我是小语，很高兴见到你！我可以帮你练习口语、纠正发音、回答问题，或者陪你聊天。\n\n你可以：\n1. 选择上方的功能模式\n2. 使用文字输入\n3. 点击消息可以进行朗读、重新生成等操作",
                    isUser: false,
                    hasActions: true,
                  ),
                );
                update(["messages"]);
              },
            ),
          ],
        ),
      ),
    );
  }

  // 复制消息
  void onCopyMessage(ChatMessage message) {
    // TODO: 实现复制消息功能
  }
}
