import 'package:corrode/modules/home/book_chapter/book_chapter_controller.dart';
import 'package:corrode/routes/app_routes.dart';
import 'package:get/get.dart';

import '../../../models/book.dart';

class BookDetailParam {
  Book book;

  BookDetailParam({required this.book});
}

class BookDetailController extends GetxController {
  BookDetailParam param;

  BookDetailController({required this.param});

  late String chapterTag;

  @override
  void onInit() {
    super.onInit();

    var chapterParam = BookChapterParam(book: param.book);
    chapterTag = "${Routes.bookChapter}/${param.book.id}";
    Get.put(BookChapterController(param: chapterParam), tag: chapterTag);
  }

  var isExpanded = false;

  toggle() {
    isExpanded = !isExpanded;
    update();
  }
}
