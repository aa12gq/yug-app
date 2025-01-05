import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
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
        bottomNavigationBar: GetBuilder<MainController>(
          id: 'navigation',
          builder: (controller) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: SafeArea(
                child: SalomonBottomBar(
                  currentIndex: controller.currentIndex,
                  onTap: controller.onJumpToPage,
                  items: [
                    _buildNavItem(
                      icon: AssetsSvgs.navHomeSvg,
                      title: LocaleKeys.tabBarHome.tr,
                    ),
                    _buildNavItem(
                      icon: AssetsSvgs.navSocialSvg,
                      title: LocaleKeys.tabBarSocial.tr,
                    ),
                    _buildNavItem(
                      icon: AssetsSvgs.navIslandSvg,
                      title: LocaleKeys.tabBarIsland.tr,
                    ),
                    _buildNavItem(
                      icon: AssetsSvgs.navMomentsSvg,
                      title: LocaleKeys.tabBarMoments.tr,
                    ),
                    _buildNavItem(
                      icon: AssetsSvgs.navProfileSvg,
                      title: LocaleKeys.tabBarProfile.tr,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          onPageChanged: controller.onIndexChanged,
          children: const [
            HomePage(),
            SocialPage(),
            IslandPage(),
            MomentsPage(),
            MyIndexPage(),
          ],
        ),
      ),
    );
  }

  SalomonBottomBarItem _buildNavItem({
    required String icon,
    required String title,
  }) {
    return SalomonBottomBarItem(
      icon: SvgPicture.asset(
        icon,
        width: 24,
        height: 24,
        colorFilter: const ColorFilter.mode(
          Colors.grey,
          BlendMode.srcIn,
        ),
      ),
      activeIcon: SvgPicture.asset(
        icon,
        width: 24,
        height: 24,
        colorFilter: const ColorFilter.mode(
          Color(0xFF5C78FF),
          BlendMode.srcIn,
        ),
      ),
      title: Text(title),
      selectedColor: const Color(0xFF5C78FF),
      unselectedColor: Colors.grey,
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
