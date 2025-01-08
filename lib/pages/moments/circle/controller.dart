import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yug_app/common/index.dart';
import 'comment_model.dart';

class CircleController extends GetxController {
  static CircleController get to => Get.find();

  // 动态列表
  final RxList<dynamic> _moments = <dynamic>[].obs;
  List<dynamic> get moments => _moments;

  // 评论相关
  final TextEditingController commentController = TextEditingController();
  final RxBool showCommentInput = false.obs;
  final RxString replyToUserName = ''.obs;
  String? currentMomentId;
  CommentModel? replyToComment;

  // 下拉刷新控制器
  final RefreshController refreshController = RefreshController();

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  // 加载数据
  Future<void> loadData() async {
    try {
      // 模拟网络请求
      await Future.delayed(const Duration(seconds: 1));

      _moments.value = [
        {
          'id': '1',
          'userId': '1',
          'userName': '小语',
          'userAvatar':
              'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde',
          'content': '今天学习了新的单词，感觉很充实！分享一下我的学习笔记 📚',
          'images': [
            'https://images.unsplash.com/photo-1503676260728-1c00da094a0b',
            'https://images.unsplash.com/photo-1606326608606-aa0b62935f2b',
          ],
          'timeAgo': '2小时前',
          'likes': 12,
          'isLiked': false,
          'comments': [],
        },
        {
          'id': '2',
          'userId': '2',
          'userName': '语乐',
          'userAvatar':
              'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
          'content': '和朋友一起练习口语，进步很大！继续加油 💪',
          'images': [
            'https://images.unsplash.com/photo-1522202176988-66273c2fd55f',
          ],
          'timeAgo': '4小时前',
          'likes': 8,
          'isLiked': false,
          'comments': [],
        },
      ];
    } catch (e) {
      print(e.toString());
    }
  }

  // 下拉刷新
  Future<void> onRefresh() async {
    try {
      await loadData();
      refreshController.refreshCompleted();
    } catch (e) {
      refreshController.refreshFailed();
    }
  }

  // 上拉加载
  Future<void> onLoading() async {
    try {
      // 模拟加载更多数据
      await Future.delayed(const Duration(seconds: 1));
      refreshController.loadComplete();
    } catch (e) {
      refreshController.loadFailed();
    }
  }

  // 点赞
  void onLike(String momentId) {
    final index = _moments.indexWhere((m) => m['id'] == momentId);
    if (index != -1) {
      final moment = Map<String, dynamic>.from(_moments[index]);
      moment['isLiked'] = !moment['isLiked'];
      moment['likes'] += moment['isLiked'] ? 1 : -1;
      _moments[index] = moment;
    }
  }

  // 评论
  void onComment(String momentId) {
    currentMomentId = momentId;
    replyToUserName.value = '';
    replyToComment = null;
    showCommentInput.value = true;
  }

  // 回复评论
  void onReply(String momentId, String userName, CommentModel comment) {
    currentMomentId = momentId;
    replyToUserName.value = userName;
    replyToComment = comment;
    showCommentInput.value = true;
  }

  // 提交评论
  void submitComment(String content) {
    if (currentMomentId == null) return;

    final index = _moments.indexWhere((m) => m['id'] == currentMomentId);
    if (index != -1) {
      final moment = Map<String, dynamic>.from(_moments[index]);
      final newComment = CommentModel(
        id: DateTime.now().toString(),
        userId: '当前用户ID',
        userName: '当前用户',
        userAvatar:
            'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde',
        content: content,
        timeAgo: '刚刚',
      );

      if (replyToComment != null) {
        // 回复评论
        final parentIndex =
            moment['comments'].indexWhere((c) => c.id == replyToComment!.id);
        if (parentIndex != -1) {
          moment['comments'][parentIndex].replies.add(newComment);
        }
      } else {
        // 新评论
        if (moment['comments'] == null) {
          moment['comments'] = <CommentModel>[];
        }
        moment['comments'].add(newComment);
      }

      _moments[index] = moment;
    }

    // 重置评论状态
    showCommentInput.value = false;
    commentController.clear();
    currentMomentId = null;
    replyToComment = null;
    replyToUserName.value = '';
  }

  // 分享
  void onShare(String momentId) {
    // TODO: 实现分享功能
    Loading.toast('分享功能开发中');
  }

  // 发布动态
  void onPublish() async {
    final result = await Get.toNamed(RouteNames.momentsPublish);
    if (result == true) {
      onRefresh();
    }
  }

  @override
  void onClose() {
    commentController.dispose();
    refreshController.dispose();
    super.onClose();
  }
}
