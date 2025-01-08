import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CircleController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final List<dynamic> moments = [];
  bool isLoading = false;
  bool hasMore = true;
  int page = 1;

  @override
  void onInit() {
    super.onInit();
    _loadData();
    scrollController.addListener(_onScroll);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void _onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (!isLoading && hasMore) {
        _loadMore();
      }
    }
  }

  Future<void> _loadData() async {
    if (isLoading) return;
    isLoading = true;
    update();

    try {
      // TODO: 从API获取数据
      await Future.delayed(const Duration(seconds: 2));
      moments.addAll([
        {
          'id': '1',
          'userName': '用户A',
          'userAvatar':
              'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde',
          'content': '这是一条测试动态内容',
          'images': [
            'https://images.unsplash.com/photo-1522441815192-d9f04eb0615c',
          ],
          'timeAgo': '2分钟前',
          'likes': 12,
          'isLiked': false,
          'comments': [
            {
              'id': '1',
              'userName': '用户B',
              'userAvatar':
                  'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde',
              'content': '评论内容1',
              'timeAgo': '1分钟前',
              'likes': 2,
              'isLiked': false,
            },
            {
              'id': '2',
              'userName': '用户C',
              'userAvatar':
                  'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde',
              'content': '评论内容2',
              'timeAgo': '刚刚',
              'likes': 0,
              'isLiked': false,
              'replyTo': '用户B',
            }
          ],
        }
      ]);
      page = 1;
      hasMore = moments.length >= 10;
    } catch (e) {
      print('Error loading data: $e');
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> _loadMore() async {
    if (isLoading || !hasMore) return;
    isLoading = true;
    update();

    try {
      // TODO: 从API获取更多数据
      await Future.delayed(const Duration(seconds: 2));
      page++;
      moments.addAll([
        {
          'id': '2',
          'userName': '用户D',
          'userAvatar':
              'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde',
          'content': '这是加载更多的测试内容',
          'images': [
            'https://images.unsplash.com/photo-1522441815192-d9f04eb0615c',
            'https://images.unsplash.com/photo-1522441815192-d9f04eb0615c',
          ],
          'timeAgo': '5分钟前',
          'likes': 8,
          'isLiked': true,
          'comments': [],
        }
      ]);
      hasMore = moments.length >= page * 10;
    } catch (e) {
      print('Error loading more data: $e');
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> onRefresh() async {
    moments.clear();
    hasMore = true;
    await _loadData();
  }

  void onLike(String id) {
    final index = moments.indexWhere((moment) => moment['id'] == id);
    if (index != -1) {
      moments[index]['isLiked'] = !moments[index]['isLiked'];
      moments[index]['likes'] += moments[index]['isLiked'] ? 1 : -1;
      update();
    }
  }

  void onComment(String id) {
    // TODO: 显示评论输入框
  }

  void onReply(String id, String userName, dynamic parent) {
    // TODO: 显示回复输入框
  }
}
