import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yug_app/common/services/config.dart';
import 'package:yug_app/common/services/user.dart';
import 'package:yug_app/common/style/theme.dart';
import 'package:yug_app/common/utils/loading.dart';
import 'package:yug_app/common/routers/name.dart';
import 'package:rive/rive.dart';
import 'dart:async';

class MyIndexController extends GetxController {
  StateMachineController? riveController;
  SMITrigger? idleTrigger;
  SMITrigger? talkTrigger;
  // 页面控制器
  PageController pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.85,
  );
  // 当前页面
  int currentPage = 0;
  // 定时器
  Timer? _timer;

  // 卡片数据
  final List<CardData> cardList = [
    CardData(
      title: "开通会员",
      subtitle: "解锁所有高级功能",
      buttonText: "立即开通",
      colors: [
        const Color(0xFF4A90E2), // 沉稳的蓝色
        const Color(0xFF357ABD),
      ],
      buttonColor: const Color(0xFF4A90E2),
    ),
    CardData(
      title: "AI助理",
      subtitle: "智能对话，提升效率",
      buttonText: "立即体验",
      colors: [
        const Color(0xFF34495E), // 深邃的蓝灰色
        const Color(0xFF2C3E50),
      ],
      buttonColor: const Color(0xFF34495E),
    ),
    CardData(
      title: "创作中心",
      subtitle: "发布作品，展示才华",
      buttonText: "开始创作",
      colors: [
        const Color(0xFF2C3A47), // 高级的深灰色
        const Color(0xFF3B4B59),
      ],
      buttonColor: const Color(0xFF2C3A47),
    ),
  ];

  MyIndexController() {
    _startAutoPlay();
  }

  _initData() {
    update(["my_index"]);
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
    _startAutoPlay();
  }

  // 进入设置页面
  void onSettings() {
    Get.toNamed(RouteNames.mySettings);
  }

  // 编辑个人资料
  void onEditProfile() {
    Get.toNamed('/my/profile/edit');
  }

  // 收藏
  void onFavorites() {
    Get.toNamed('/my/favorites');
  }

  // 历史记录
  void onHistory() {
    Get.toNamed('/my/history');
  }

  // 我的作品
  void onWorks() {
    Get.toNamed('/my/works');
  }

  // 帮助反馈
  void onHelpAndFeedback() {
    Get.toNamed(RouteNames.myHelp);
  }

  // 语言设置
  void onLanguage() {
    Get.toNamed(RouteNames.myLanguage);
  }

  // 主题设置
  void onTheme() {
    Get.toNamed(RouteNames.myTheme);
  }

  // 消息通知
  void onNotifications() {
    Get.toNamed('/my/notifications');
  }

  // 隐私设置
  void onPrivacy() {
    Get.toNamed('/my/privacy');
  }

  // 查看所有活动
  void onViewAllActivities() {
    Get.toNamed('/my/activities');
  }

  // 退出登录
  void onLogout() async {
    try {
      await UserService.to.logout();
      Get.offAllNamed(RouteNames.systemLogin);
    } catch (e) {
      Loading.error('退出失败：${e.toString()}');
    }
  }

  // 虚拟人物相关方法
  void onCustomizeAvatar() {
    Get.toNamed('/avatar/customize');
  }

  void onAvatarPersonality() {
    Get.toNamed('/avatar/personality');
  }

  void onAvatarInteractions() {
    Get.toNamed('/avatar/interactions');
  }

  void initRiveAnimation(Artboard artboard) {
    riveController = StateMachineController.fromArtboard(
      artboard,
      'State Machine 1',
    );
    if (riveController != null) {
      artboard.addController(riveController!);
      idleTrigger = riveController?.findSMI('idle');
      talkTrigger = riveController?.findSMI('talk');
    }
  }

  void playTalkAnimation() {
    talkTrigger?.fire();
  }

  void playIdleAnimation() {
    idleTrigger?.fire();
  }

  // 开始自动播放
  void _startAutoPlay() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      try {
        if (pageController.hasClients) {
          // 直接滚动到下一页
          pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      } catch (e) {
        print('Auto play error: $e');
      }
    });
  }

  // 页面切换回调
  void onPageChanged(int page) {
    currentPage = page;
    update(['card_indicator']);
  }

  // 修改页面构建逻辑
  CardData getCard(int index) {
    // 使用取模运算使索引永远在有效范围内
    return cardList[index % cardList.length];
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    _timer?.cancel();
    super.onClose();
  }
}

// 卡片数据模型
class CardData {
  final String title;
  final String subtitle;
  final String buttonText;
  final List<Color> colors;
  final Color buttonColor;

  CardData({
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.colors,
    required this.buttonColor,
  });
}
