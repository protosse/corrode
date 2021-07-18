import 'package:corrode/modules/home/book_detail/book_detail_binding.dart';
import 'package:corrode/modules/home/book_detail/book_detail_page.dart';
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
      name: Routes.tab,
      page: () => MyTabPage(),
      binding: MyTabBinding(),
    ),
    GetPage(
      name: Routes.splash,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.search,
      page: () => SearchPage(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: Routes.bookDetail,
      page: () => BookDetailPage(),
      binding: BookDetailBinding(),
    )
  ];
}
