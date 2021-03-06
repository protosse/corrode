import 'package:corrode/modules/login/login_binding.dart';
import 'package:corrode/modules/login/login_page.dart';
import 'package:corrode/modules/shelf/shelf_binding.dart';
import 'package:corrode/modules/shelf/shelf_page.dart';
import 'package:get/get.dart';

import '../modules/home/book_chapter/book_chapter_binding.dart';
import '../modules/home/book_chapter/book_chapter_page.dart';
import '../modules/home/book_detail/book_detail_binding.dart';
import '../modules/home/book_detail/book_detail_page.dart';
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
    ),
    GetPage(
      name: Routes.bookChapter,
      page: () => BookChapterPage(),
      binding: BookChapterBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.shelf,
      page: () => ShelfPage(),
      binding: ShelfBinding(),
    ),
  ];
}
