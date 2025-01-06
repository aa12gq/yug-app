import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yug_app/pages/system/main/controller.dart';

class MessageModel {
  final String name;
  final String? avatar;
  final String lastMessage;
  final String lastTime;
  final int unreadCount;

  MessageModel({
    required this.name,
    this.avatar,
    required this.lastMessage,
    required this.lastTime,
    this.unreadCount = 0,
  });
}

class NotificationModel {
  final IconData icon;
  final Color color;
  final String title;
  final String content;
  final String time;

  NotificationModel({
    required this.icon,
    required this.color,
    required this.title,
    required this.content,
    required this.time,
  });
}

class SocialController extends GetxController {
  SocialController();

  // 页面控制器
  late final PageController pageController;

  // 主导航控制器
  final mainController = Get.find<MainController>();

  // 当前选中的标签
  int currentTab = 0;

  // 消息列表
  List<MessageModel> messageList = [
    MessageModel(
      name: "小语",
      lastMessage: "你好，我是语乐岛的小语~",
      lastTime: "刚刚",
      unreadCount: 1,
    ),
    MessageModel(
      name: "语乐小助手",
      lastMessage: "欢迎来到语乐岛！",
      lastTime: "10:30",
      unreadCount: 2,
    ),
    MessageModel(
      name: "创作者中心",
      lastMessage: "你的作品获得了新的点赞",
      lastTime: "昨天",
    ),
  ];

  // 通知列表
  List<NotificationModel> notificationList = [
    NotificationModel(
      icon: Icons.favorite_border,
      color: const Color(0xFFFF6B6B),
      title: "获得新的点赞",
      content: "小明赞了你的作品《春日的午后》",
      time: "刚刚",
    ),
    NotificationModel(
      icon: Icons.comment_outlined,
      color: const Color(0xFF4ECDC4),
      title: "收到新的评论",
      content: "小红评论了你的作品：真是太棒了！",
      time: "10分钟前",
    ),
    NotificationModel(
      icon: Icons.person_add_outlined,
      color: const Color(0xFF6C5CE7),
      title: "新增粉丝",
      content: "小张关注了你",
      time: "1小时前",
    ),
    NotificationModel(
      icon: Icons.workspace_premium,
      color: const Color(0xFFFFBE0B),
      title: "作品被收录",
      content: "你的作品《春日的午后》被收录到精选集",
      time: "2小时前",
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: currentTab);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  _initData() {
    update(["social"]);
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // 切换标签
  void switchTab(int index) {
    if (currentTab != index) {
      currentTab = index;
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      update(["social"]);
    }
  }

  // 搜索
  void onSearch() {
    Get.toNamed('/social/search');
  }

  // 查看消息详情
  void onMessageDetail(MessageModel message) {
    Get.toNamed('/social/chat', arguments: message);
  }

  // 切换到上一个导航项
  void onPrevious() {
    mainController.onJumpToPage(1); // 切换到动态页
  }

  // 切换到下一个导航项
  void onNext() {
    mainController.onJumpToPage(4); // 切换到我的页
  }
}
