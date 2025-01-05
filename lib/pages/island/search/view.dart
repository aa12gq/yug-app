import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_app/common/index.dart';

import 'index.dart';

class IslandSearchPage extends GetView<IslandSearchController> {
  const IslandSearchPage({super.key});

  // 构建搜索栏
  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextField(
        controller: controller.searchController,
        decoration: InputDecoration(
          hintText: '搜索',
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        ),
        onChanged: controller.onSearchChanged,
      ),
    );
  }

  // 主视图
  Widget _buildView() {
    return Column(
      children: [
        _buildSearchBar(),
        // TODO: 添加搜索结果列表
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('搜索'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: _buildView(),
      ),
    );
  }
}
