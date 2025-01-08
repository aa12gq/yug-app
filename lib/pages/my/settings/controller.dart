import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yug_app/common/index.dart';
import 'dart:io';

class SettingsController extends GetxController {
  static SettingsController get to => Get.find();

  // 缓存大小
  final RxString _cacheSize = "0B".obs;
  String get cacheSize => _cacheSize.value;

  @override
  void onInit() {
    super.onInit();
    loadCacheSize();
  }

  // 加载缓存大小
  Future<void> loadCacheSize() async {
    try {
      Directory tempDir = await getTemporaryDirectory();
      double value = await _getTotalSizeOfFilesInDir(tempDir);
      _cacheSize.value = _renderSize(value);
      update(["settings"]);
    } catch (e) {
      print(e.toString());
    }
  }

  // 计算文件夹大小
  Future<double> _getTotalSizeOfFilesInDir(final FileSystemEntity file) async {
    if (file is File) {
      int length = await file.length();
      return double.parse(length.toString());
    }
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      double total = 0;
      for (final FileSystemEntity child in children) {
        total += await _getTotalSizeOfFilesInDir(child);
      }
      return total;
    }
    return 0;
  }

  // 格式化文件大小
  String _renderSize(double value) {
    List<String> unitArr = ['B', 'KB', 'MB', 'GB'];
    int index = 0;
    while (value > 1024) {
      index++;
      value = value / 1024;
    }
    String size = value.toStringAsFixed(2);
    return size + unitArr[index];
  }

  // 清除缓存
  Future<void> clearCache() async {
    try {
      Directory tempDir = await getTemporaryDirectory();
      await _deleteDirectory(tempDir);
      await loadCacheSize();
      Loading.success(LocaleKeys.settingsClearCacheSuccess.tr);
    } catch (e) {
      print(e.toString());
      Loading.error(LocaleKeys.settingsClearCacheFailed.tr);
    }
  }

  // 删除目录
  Future<void> _deleteDirectory(Directory directory) async {
    if (directory.existsSync()) {
      directory.listSync().forEach((FileSystemEntity file) {
        if (file is File) {
          file.deleteSync();
        } else if (file is Directory) {
          _deleteDirectory(file);
        }
      });
    }
  }

  // 账号安全
  void onAccountSecurity() {
    Get.toNamed('/account/security');
  }

  // 隐私设置
  void onPrivacy() {
    Get.toNamed(RouteNames.myPrivacy);
  }

  // 通知设置
  void onNotifications() {
    Get.toNamed('/notifications/settings');
  }

  // 清除缓存
  void onClearCache() async {
    bool? confirm = await Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Column(
          children: [
            Icon(
              Icons.delete_outline,
              color: const Color(0xFF00B894),
              size: 36,
            ),
            SizedBox(height: 16),
            Text(
              LocaleKeys.settingsClearCacheTitle.tr,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        content: Text(
          "${LocaleKeys.settingsClearCacheConfirm.tr}$cacheSize",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: Colors.black54,
            height: 1.5,
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: EdgeInsets.only(bottom: 16),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            style: TextButton.styleFrom(
              minimumSize: Size(100, 40),
            ),
            child: Text(
              LocaleKeys.commonBottomCancel.tr,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black45,
              ),
            ),
          ),
          SizedBox(width: 16),
          TextButton(
            onPressed: () => Get.back(result: true),
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xFF00B894),
              minimumSize: Size(100, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              LocaleKeys.commonBottomConfirm.tr,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      transitionDuration: Duration(milliseconds: 200),
      transitionCurve: Curves.easeInOut,
    );

    if (confirm == true) {
      Loading.show();
      await clearCache();
      Loading.dismiss();
    }
  }

  // 退出登录
  void onLogout() async {
    bool? confirm = await Get.dialog(
      AlertDialog(
        title: Text(
          LocaleKeys.settingsLogoutTitle.tr,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          LocaleKeys.settingsLogoutConfirm.tr,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: Text(LocaleKeys.commonBottomCancel.tr),
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            child: Text(
              LocaleKeys.commonBottomConfirm.tr,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        await UserService.to.logout();
        Get.offAllNamed(RouteNames.systemLogin);
      } catch (e) {
        Loading.error('${LocaleKeys.settingsLogoutFailed.tr}: ${e.toString()}');
      }
    }
  }
}
