import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_app/common/index.dart';
import 'package:yug_app/common/i18n/locale_keys.dart';

import 'index.dart';

class LanguagePage extends GetView<LanguageController> {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
      init: LanguageController(),
      id: "language",
      builder: (_) {
        return Scaffold(
          backgroundColor: const Color(0xFFF8F9FA),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(90.h),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppTheme.secondary,
                      AppTheme.secondary.withOpacity(0.8),
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => Get.back(),
                              child: Container(
                                padding: EdgeInsets.all(6.w),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.white,
                                  size: 16.w,
                                ),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              LocaleKeys.settingsLanguage.tr,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          LocaleKeys.settingsLanguageSelect.tr,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      offset: const Offset(0, 4),
                      blurRadius: 16,
                      spreadRadius: -2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildLanguageItem(
                      LocaleKeys.settingsLanguageZh.tr,
                      LocaleKeys.settingsLanguageZhSub.tr,
                      "zh",
                      controller.currentLanguage == "zh",
                      Icons.translate_outlined,
                    ),
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: const Color(0xFFF7F7F9),
                      indent: 16.w,
                      endIndent: 16.w,
                    ),
                    _buildLanguageItem(
                      LocaleKeys.settingsLanguageEn.tr,
                      LocaleKeys.settingsLanguageEnSub.tr,
                      "en",
                      controller.currentLanguage == "en",
                      Icons.language_outlined,
                    ),
                  ],
                ),
              ),
              // 提示文本
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Text(
                  LocaleKeys.settingsLanguageTip.tr,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.secondaryText,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLanguageItem(
    String title,
    String subtitle,
    String code,
    bool isSelected,
    IconData icon,
  ) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => controller.changeLanguage(code),
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 16.h,
          ),
          child: Row(
            children: [
              // 图标
              Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppTheme.secondary.withOpacity(0.1)
                      : const Color(0xFFF7F7F9),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  icon,
                  color:
                      isSelected ? AppTheme.secondary : AppColors.secondaryText,
                  size: 20.w,
                ),
              ),
              SizedBox(width: 16.w),
              // 文本
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w500,
                        color: AppColors.primaryText,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ],
                ),
              ),
              // 选中标记
              if (isSelected)
                Container(
                  width: 24.w,
                  height: 24.w,
                  decoration: BoxDecoration(
                    color: AppTheme.secondary.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check,
                    color: AppTheme.secondary,
                    size: 16.w,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
