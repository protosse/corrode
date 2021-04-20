import 'package:corrode/modules/splash/splash_page.dart';
import 'package:corrode/modules/splash/splash_binding.dart';
import 'package:corrode/modules/tab/tab_binding.dart';
import 'package:corrode/modules/tab/tab_page.dart';
import 'package:corrode/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.TAB, page: () => MyTabPage(), binding: MyTabBinding()),
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    )
  ];
}
