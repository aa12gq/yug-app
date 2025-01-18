import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yug_app/common/index.dart';
import 'package:yug_app/pages/index.dart';
import 'package:yug_app/common/i18n/locale_keys.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

import 'index.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    Get.put(MainController());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _MainViewGetX();
  }
}

class _MainViewGetX extends GetView<MainController> {
  const _MainViewGetX();

  // 主视图
  Widget _buildView(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if (didPop) {
          return;
        }
        if (controller.closeOnConfirm(context)) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        floatingActionButton: SizedBox(
          height: 56,
          width: 56,
          child: FloatingActionButton(
            backgroundColor: AppTheme.primary,
            elevation: 2,
            shape: const CircleBorder(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppTheme.primary,
                        AppTheme.primary.withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      LocaleKeys.tabBarAiChat.tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  LocaleKeys.tabBarAiChatLabel.tr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            onPressed: () => controller.onOpenAIChat(),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: GetBuilder<MainController>(
          id: "navigation",
          builder: (controller) {
            final isDark =
                AdaptiveTheme.of(context).brightness == Brightness.dark;
            return BottomAppBar(
              height: 56,
              padding: EdgeInsets.zero,
              notchMargin: 5,
              shape: const CircularNotchedRectangle(),
              color: isDark ? Colors.black.withOpacity(0.3) : Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(
                    icon: AssetsSvgs.navIslandSvg,
                    label: LocaleKeys.tabBarIsland.tr,
                    isSelected: controller.currentIndex == 0,
                    onTap: () => controller.onJumpToPage(0),
                    isDark: isDark,
                  ),
                  _buildNavItem(
                    icon: AssetsSvgs.navMomentsSvg,
                    label: LocaleKeys.tabBarMoments.tr,
                    isSelected: controller.currentIndex == 1,
                    onTap: () => controller.onJumpToPage(1),
                    isDark: isDark,
                  ),
                  const SizedBox(width: 80),
                  _buildNavItem(
                    icon: AssetsSvgs.navSocialSvg,
                    label: LocaleKeys.tabBarSocial.tr,
                    isSelected: controller.currentIndex == 3,
                    onTap: () => controller.onJumpToPage(3),
                    isDark: isDark,
                  ),
                  _buildNavItem(
                    icon: AssetsSvgs.navProfileSvg,
                    label: LocaleKeys.tabBarProfile.tr,
                    isSelected: controller.currentIndex == 4,
                    onTap: () => controller.onJumpToPage(4),
                    isDark: isDark,
                  ),
                ],
              ),
            );
          },
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          onPageChanged: controller.onIndexChanged,
          children: const [
            IslandPage(),
            MomentsIndexPage(),
            NotesPage(),
            SocialPage(),
            MyIndexPage(),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    // 未选中状态的颜色根据深色模式调整
    final unselectedColor =
        isDark ? Colors.white.withOpacity(0.5) : const Color(0xFF999999);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        splashColor: AppTheme.primary.withOpacity(0.2),
        highlightColor: AppTheme.primary.withOpacity(0.1),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                icon,
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                  isSelected ? AppTheme.primary : unselectedColor,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                  color: isSelected ? AppTheme.primary : unselectedColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      id: "main",
      builder: (_) {
        return _buildView(context);
      },
    );
  }
}
