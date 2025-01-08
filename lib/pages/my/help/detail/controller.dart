import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpDetailController extends GetxController {
  HelpDetailController();

  final title = ''.obs;
  final type = ''.obs;
  final content = ''.obs;
  final isHelpful = false.obs;
  final hasVoted = false.obs;

  _initData() {
    var args = Get.arguments;
    if (args != null) {
      title.value = args['title'] ?? '';
      type.value = args['type'] ?? '';
      // TODO: 根据 type 和 title 获取具体内容
      _loadContent();
    }
    update(["help_detail"]);
  }

  // 加载帮助内容
  void _loadContent() {
    // 这里模拟加载内容，实际应该从服务器获取
    switch (type.value) {
      case '新手指南':
        content.value = '''
# ${title.value}

## 基本操作
1. 首次使用时，您需要注册账号或使用第三方账号登录
2. 登录后，您可以在首页浏览推荐内容
3. 点击底部导航栏可以切换不同的功能模块

## 功能说明
- 首页：展示推荐内容和热门话题
- 发现：浏览更多有趣的内容
- 消息：查看互动消息和系统通知
- 我的：管理个人信息和设置

## 使用技巧
1. 下拉刷新可以获取最新内容
2. 长按内容可以进行更多操作
3. 双击可以快速点赞

如果您在使用过程中遇到任何问题，欢迎随时反馈给我们。
''';
        break;
      case '账号安全':
        content.value = '''
# ${title.value}

## 账号保护
1. 设置强密码：建议使用字母、数字和符号的组合
2. 开启双重验证：提供额外的安全保障
3. 定期更换密码：建议每3个月更换一次

## 隐私设置
- 个人信息：可以选择对其他用户显示的信息
- 互动权限：可以设置谁能与您互动
- 数据管理：可以管理您的数据使用情况

## 注意事项
1. 不要将账号密码告诉他人
2. 不要在不安全的设备上登录
3. 发现异常及时修改密码

如需更多帮助，请联系客服。
''';
        break;
      case '功能介绍':
        content.value = '''
# ${title.value}

## 核心功能
1. 内容浏览：支持多种形式的内容展示
2. 社交互动：可以与其他用户进行互动
3. 创作工具：提供丰富的创作功能

## 特色功能
- 智能推荐：根据兴趣推荐内容
- 实时互动：支持即时通讯
- 创作助手：提供创作灵感和工具

## 进阶技巧
1. 使用标签功能更好地组织内容
2. 关注感兴趣的用户和话题
3. 参与活动获得更多互动

我们会持续优化功能，欢迎提供建议。
''';
        break;
      default:
        content.value = '''
# ${title.value}

## 常见问题
1. 问题描述
   - 详细说明问题的现象
   - 可能的原因分析
   - 解决方案建议

2. 解决步骤
   - 第一步：检查基本设置
   - 第二步：尝试常见解决方案
   - 第三步：如果问题仍然存在，请联系客服

## 注意事项
- 在尝试解决问题前，请先备份重要数据
- 按照步骤逐一尝试，不要跳过步骤
- 如果不确定，请咨询客服

如果以上内容没有解决您的问题，欢迎反馈给我们。
''';
    }
  }

  // 提交帮助反馈
  void submitHelpfulFeedback(bool helpful) {
    if (hasVoted.value) return;

    isHelpful.value = helpful;
    hasVoted.value = true;
    // TODO: 发送反馈到服务器
    Get.snackbar(
      '感谢反馈',
      helpful ? '很高兴这篇文档对您有帮助' : '我们会继续完善文档内容',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black87,
      colorText: Colors.white,
      margin: EdgeInsets.all(16.w),
    );
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }
}
