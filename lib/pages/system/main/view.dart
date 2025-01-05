import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yug_app/common/index.dart';
import 'package:yug_app/pages/index.dart';

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
        floatingActionButton: Container(
          height: 56,
          width: 56,
          child: FloatingActionButton(
            backgroundColor: const Color(0xFF5C78FF),
            elevation: 2,
            shape: const CircleBorder(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AssetsSvgs.navNotesSvg,
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  "随心记",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            onPressed: () => controller.onJumpToPage(2),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: GetBuilder<MainController>(
          id: 'navigation',
          builder: (controller) {
            return BottomAppBar(
              height: 49,
              padding: EdgeInsets.zero,
              notchMargin: 5,
              shape: const CircularNotchedRectangle(),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(
                    icon: AssetsSvgs.navIslandSvg,
                    label: LocaleKeys.tabBarIsland.tr,
                    isSelected: controller.currentIndex == 0,
                    onTap: () => controller.onJumpToPage(0),
                  ),
                  _buildNavItem(
                    icon: AssetsSvgs.navSocialSvg,
                    label: LocaleKeys.tabBarSocial.tr,
                    isSelected: controller.currentIndex == 1,
                    onTap: () => controller.onJumpToPage(1),
                  ),
                  const SizedBox(width: 80),
                  _buildNavItem(
                    icon: AssetsSvgs.navMomentsSvg,
                    label: LocaleKeys.tabBarMoments.tr,
                    isSelected: controller.currentIndex == 3,
                    onTap: () => controller.onJumpToPage(3),
                  ),
                  _buildNavItem(
                    icon: AssetsSvgs.navProfileSvg,
                    label: LocaleKeys.tabBarProfile.tr,
                    isSelected: controller.currentIndex == 4,
                    onTap: () => controller.onJumpToPage(4),
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
            SocialPage(),
            NotesPage(),
            MomentsPage(),
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
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        splashColor: const Color(0xFF5C78FF).withOpacity(0.2),
        highlightColor: const Color(0xFF5C78FF).withOpacity(0.1),
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
                  isSelected ? const Color(0xFF5C78FF) : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  color: isSelected ? const Color(0xFF5C78FF) : Colors.grey,
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
