import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/index.dart';
import 'index.dart';

class RoutePages {
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static List<GetPage> list = [
    //////////////////////////////
    // 系统
    //////////////////////////////
    GetPage(
      name: RouteNames.systemLogin,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RouteNames.systemMain,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: RouteNames.systemRegister,
      page: () => const RegisterPage(),
    ),
    GetPage(
      name: RouteNames.systemRegisterPin,
      page: () => const RegisterPinPage(),
    ),
    GetPage(
      name: RouteNames.systemSplash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: RouteNames.systemUserAgreement,
      page: () => const UserAgreementPage(),
    ),
    GetPage(
      name: RouteNames.systemWelcome,
      page: () => const WelcomePage(),
    ),
    //////////////////////////////
    // 我的
    //////////////////////////////
    GetPage(
      name: RouteNames.myAddress,
      page: () => const MyAddressPage(),
    ),
    GetPage(
      name: RouteNames.myLanguage,
      page: () => const LanguagePage(),
    ),
    GetPage(
      name: RouteNames.myMyIndex,
      page: () => const MyIndexPage(),
    ),
    GetPage(
      name: RouteNames.myProfileEdit,
      page: () => const ProfileEditPage(),
    ),
    GetPage(
      name: RouteNames.myTheme,
      page: () => const ThemePage(),
    ),
    GetPage(
      name: RouteNames.searchSearchFilter,
      page: () => const SearchFilterPage(),
    ),
    GetPage(
      name: RouteNames.mySettings,
      page: () => const SettingsPage(),
    ),
    GetPage(
      name: RouteNames.searchSearchIndex,
      page: () => const SearchIndexPage(),
    ),
    //////////////////////////////
    // 样式
    //////////////////////////////
    GetPage(
      name: RouteNames.stylesBottomSheet,
      page: () => const BottomSheetPage(),
    ),
    GetPage(
      name: RouteNames.stylesButtons,
      page: () => const ButtonsPage(),
    ),
    GetPage(
      name: RouteNames.stylesCarousel,
      page: () => const CarouselPage(),
    ),
    GetPage(
      name: RouteNames.stylesComponents,
      page: () => const ComponentsPage(),
    ),
    GetPage(
      name: RouteNames.stylesGroupList,
      page: () => const GroupListPage(),
    ),
    GetPage(
      name: RouteNames.stylesInputs,
      page: () => const InputsPage(),
    ),
    GetPage(
      name: RouteNames.stylesOther,
      page: () => const OtherPage(),
    ),
    GetPage(
      name: RouteNames.stylesStylesIndex,
      page: () => const StylesIndexPage(),
    ),
    GetPage(
      name: RouteNames.stylesText,
      page: () => const TextPage(),
    ),
    GetPage(
      name: RouteNames.stylesTextForm,
      page: () => const TextFormPage(),
    ),
    GetPage(
      name: RouteNames.stylesIcon,
      page: () => const IconPage(),
    ),
    GetPage(
      name: RouteNames.stylesImage,
      page: () => const ImagePage(),
    ),
    //////////////////////////////
    // 首页
    //////////////////////////////
    GetPage(
      name: RouteNames.homeHome,
      page: () => const HomePage(),
    ),
    GetPage(
      name: RouteNames.socialSocial,
      page: () => const SocialPage(),
    ),
    GetPage(
      name: RouteNames.islandIsland,
      page: () => const IslandPage(),
    ),
    GetPage(
      name: RouteNames.momentsMoments,
      page: () => const MomentsPage(),
    ),
    //////////////////////////////
    // 消息
    //////////////////////////////
    GetPage(
      name: RouteNames.msgMsgIndex,
      page: () => const MsgIndexPage(),
    ),
    //////////////////////////////
    // 随心记
    //////////////////////////////
    GetPage(
      name: RouteNames.notesNotes,
      page: () => const NotesPage(),
    ),
    //////////////////////////////
    // 小语
    //////////////////////////////
    GetPage(
      name: RouteNames.chatChat,
      page: () => const AIChatPage(),
      binding: AIChatBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
      preventDuplicates: true,
    ),
    //////////////////////////////
    // 语乐岛
    //////////////////////////////
    GetPage(
      name: RouteNames.islandMain,
      page: () => const IslandPage(),
      binding: IslandBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouteNames.islandSearch,
      page: () => const IslandSearchPage(),
      binding: IslandSearchBinding(),
    ),
    GetPage(
      name: RouteNames.islandNotifications,
      page: () => const IslandNotificationsPage(),
      binding: IslandNotificationsBinding(),
    ),
    GetPage(
      name: RouteNames.islandEmotionMap,
      page: () => const IslandEmotionMapPage(),
      binding: IslandEmotionMapBinding(),
    ),
    GetPage(
      name: RouteNames.islandMoodWeather,
      page: () => const IslandMoodWeatherPage(),
      binding: IslandMoodWeatherBinding(),
    ),
    GetPage(
      name: RouteNames.islandCreativeIsland,
      page: () => const IslandCreativeIslandPage(),
      binding: IslandCreativeIslandBinding(),
    ),
    GetPage(
      name: RouteNames.islandThemeSpace,
      page: () => const IslandThemeSpacePage(),
      binding: IslandThemeSpaceBinding(),
    ),
    GetPage(
      name: RouteNames.islandInteractiveGames,
      page: () => const IslandInteractiveGamesPage(),
      binding: IslandInteractiveGamesBinding(),
    ),
    GetPage(
      name: RouteNames.islandCreativeShowcase,
      page: () => const IslandCreativeShowcasePage(),
      binding: IslandCreativeShowcaseBinding(),
    ),
    GetPage(
      name: RouteNames.islandActivities,
      page: () => const IslandActivitiesPage(),
      binding: IslandActivitiesBinding(),
    ),
    GetPage(
      name: RouteNames.islandCoCreation,
      page: () => const IslandCoCreationPage(),
      binding: IslandCoCreationBinding(),
    ),
  ];
}
