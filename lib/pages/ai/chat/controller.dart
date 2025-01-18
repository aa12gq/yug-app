import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

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

  // 录音器实例
  final FlutterSoundRecorder _audioRecorder = FlutterSoundRecorder();
  String? _recordPath;

  // 录音时长计时器
  Timer? _recordTimer;
  int _recordDuration = 0;
  String get recordDuration {
    final minutes = (_recordDuration ~/ 60).toString().padLeft(2, '0');
    final seconds = (_recordDuration % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  // 文本输入控制器
  final textController = TextEditingController();

  // 当前模式
  String currentMode = "闲聊模式";

  // 是否为语音模式
  bool isVoiceMode = false;

  // 是否正在录音
  bool isRecording = false;

  // 消息列表
  final List<ChatMessage> messages = [
    ChatMessage(
      content:
          "你好，我是小语，很高兴见到你！我可以帮你练习口语、纠正发音、回答问题，或者陪你聊天。\n\n你可以：\n1. 选择上方的功能模式\n2. 使用语音或文字输入\n3. 点击消息可以进行朗读、重新生成等操作",
      isUser: false,
      hasActions: true,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    _initRecorder();
  }

  // 初始化录音器
  Future<void> _initRecorder() async {
    try {
      await _audioRecorder.openRecorder();
      // 请求麦克风权限
      final status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        Get.snackbar(
          "提示",
          "需要麦克风权限才能使用语音功能",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black87,
          colorText: Colors.white,
          margin: const EdgeInsets.all(20),
          duration: const Duration(seconds: 2),
        );
      }
    } catch (e) {
      print("初始化录音器失败: $e");
      Get.snackbar(
        "错误",
        "初始化录音器失败: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black87,
        colorText: Colors.white,
        margin: const EdgeInsets.all(20),
        duration: const Duration(seconds: 2),
      );
    }
  }

  // 获取录音文件路径
  Future<String> _getRecordPath() async {
    final dir = await getTemporaryDirectory();
    return '${dir.path}/record_${DateTime.now().millisecondsSinceEpoch}.m4a';
  }

  // 开始录音
  Future<void> startRecording() async {
    try {
      if (!await Permission.microphone.isGranted) {
        final status = await Permission.microphone.request();
        if (status != PermissionStatus.granted) {
          Get.snackbar(
            "提示",
            "需要麦克风权限才能使用语音功能",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.black87,
            colorText: Colors.white,
            margin: const EdgeInsets.all(20),
            duration: const Duration(seconds: 2),
          );
          return;
        }
      }

      _recordPath = await _getRecordPath();
      await _audioRecorder.startRecorder(
        toFile: _recordPath,
        codec: Codec.aacADTS,
      );
      isRecording = true;
      _recordDuration = 0;
      _startTimer();
      update(["ai_chat"]);
    } catch (e) {
      print("开始录音失败: $e");
      Get.snackbar(
        "错误",
        "开始录音失败: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black87,
        colorText: Colors.white,
        margin: const EdgeInsets.all(20),
        duration: const Duration(seconds: 2),
      );
    }
  }

  // 开始计时
  void _startTimer() {
    _recordTimer?.cancel();
    _recordTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _recordDuration++;
      update(["ai_chat"]);
    });
  }

  // 停止录音
  Future<void> stopRecording() async {
    try {
      if (!isRecording) return;

      _recordTimer?.cancel();
      final path = await _audioRecorder.stopRecorder();
      isRecording = false;
      update(["ai_chat"]);

      if (path != null) {
        messages.insert(
          0,
          ChatMessage(
            content: "[语音消息] ${recordDuration}",
            isUser: true,
            hasActions: false,
          ),
        );
        update(["messages"]);

        Future.delayed(const Duration(seconds: 1), () {
          messages.insert(
            0,
            ChatMessage(
              content: "我已经收到你的语音消息了，但目前语音识别功能还在开发中...",
              isUser: false,
              hasActions: true,
            ),
          );
          update(["messages"]);
        });
      }
    } catch (e) {
      Get.snackbar(
        "错误",
        "停止录音失败: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black87,
        colorText: Colors.white,
        margin: const EdgeInsets.all(20),
        duration: const Duration(seconds: 2),
      );
    }
  }

  // 取消录音
  Future<void> cancelRecording() async {
    try {
      if (!isRecording) return;

      _recordTimer?.cancel();
      await _audioRecorder.stopRecorder();
      if (_recordPath != null) {
        final file = File(_recordPath!);
        if (await file.exists()) {
          await file.delete();
        }
      }
      isRecording = false;
      update(["ai_chat"]);
    } catch (e) {
      print("取消录音失败: $e");
    }
  }

  @override
  void onClose() {
    _recordTimer?.cancel();
    _audioRecorder.closeRecorder();
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

  // 切换语音模式
  void onVoiceMode() {
    isVoiceMode = !isVoiceMode;
    update(["ai_chat"]);
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

    // 模拟AI回复
    Future.delayed(const Duration(seconds: 1), () {
      String response = "";
      switch (currentMode) {
        case "口语练习":
          response =
              "让我来分析一下你的表达：\n1. 语法结构：准确\n2. 用词搭配：自然\n3. 发音建议：注意'th'的发音\n\n建议：多练习以下句型...";
          break;
        case "发音纠正":
          response =
              "你的发音整体不错，但有几个音需要注意：\n1. 重音位置：第二个音节\n2. 连音：可以更流畅\n\n让我示范一下标准发音...";
          break;
        case "翻译助手":
          response =
              "这句话的翻译是：...\n\n小语提醒：\n1. 文化差异：...\n2. 地道表达：...\n3. 常见用法：...";
          break;
        case "情感倾诉":
          response =
              "我理解你的感受。让我们一起分析这个情况：\n1. 你的感受：...\n2. 可能的原因：...\n3. 建议的做法：...";
          break;
        case "创作灵感":
          response =
              "这是个很有趣的想法！我们可以从以下几个方面展开：\n1. 故事背景：...\n2. 人物设定：...\n3. 情节发展：...";
          break;
        default:
          response = "这个话题很有趣！让我们继续探讨...";
      }
      messages.insert(
        0,
        ChatMessage(
          content: response,
          isUser: false,
          hasActions: true, // AI消息有操作按钮
        ),
      );
      update(["messages"]);
    });
  }

  // 朗读消息
  void onReadMessage(ChatMessage message) {
    // TODO: 实现文字转语音功能
  }

  // 重新生成回复
  void onRegenerateMessage(ChatMessage message) {
    // TODO: 实现重新生成回复功能
  }

  // 复制消息
  void onCopyMessage(ChatMessage message) {
    Clipboard.setData(ClipboardData(text: message.content));
    Get.snackbar(
      "复制成功",
      "内容已复制到剪贴板",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black87,
      colorText: Colors.white,
      margin: const EdgeInsets.all(20),
      duration: const Duration(seconds: 2),
    );
  }

  // 更多选项
  void onMore() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
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
                        "你好，我是小语，很高兴见到你！我可以帮你练习口语、纠正发音、回答问题，或者陪你聊天。\n\n你可以：\n1. 选择上方的功能模式\n2. 使用语音或文字输入\n3. 点击消息可以进行朗读、重新生成等操作",
                    isUser: false,
                    hasActions: true, // AI消息有操作按钮
                  ),
                );
                update(["messages"]);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings_voice_rounded),
              title: const Text("语音设置"),
              onTap: () {
                Get.back();
                // TODO: 打开语音设置页面
              },
            ),
            ListTile(
              leading: const Icon(Icons.history_rounded),
              title: const Text("聊天记录"),
              onTap: () {
                Get.back();
                // TODO: 打开聊天记录页面
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings_rounded),
              title: const Text("偏好设置"),
              onTap: () {
                Get.back();
                // TODO: 打开设置页面
              },
            ),
          ],
        ),
      ),
    );
  }

  // 添加虚拟助手点击方法
  void onAssistantTap() {
    // TODO: 实现虚拟助手点击响应
  }
}
