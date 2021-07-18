import 'package:get/get.dart';

import '../modules/search/search_binding.dart';
import '../modules/search/search_page.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_page.dart';
import '../modules/tab/tab_binding.dart';
import '../modules/tab/tab_page.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.TAB,
      page: () => MyTabPage(),
      binding: MyTabBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => SearchPage(),
      binding: SearchBinding(),
    )
  ];
}
