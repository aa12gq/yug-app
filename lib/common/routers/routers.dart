import 'package:get/get.dart';
import 'package:yug_app/login/index.dart';
import 'package:yug_app/splash/view.dart';

// Route Pages Configuration
class RoutePages {
  // List of registered routes
  static List<GetPage> list = [
    GetPage(
      name: "/",
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: "/splash",
      page: () => const SplashPage(),
    ),
  ];
}
