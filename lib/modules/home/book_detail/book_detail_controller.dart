import 'package:corrode/api/api.dart';
import 'package:corrode/modules/home/book_chapter/book_chapter_controller.dart';
import 'package:corrode/routes/app_routes.dart';
import 'package:get/get.dart';
import '../../../util/extensions/future_extension.dart';

import '../../../models/book.dart';

class BookDetailParam {
  Book book;

  BookDetailParam({required this.book});
}

class BookDetailController extends GetxController {
  BookDetailParam param;

  BookDetailController({required this.param});

  late String chapterTag;

  var isCollected = false.obs;

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

  toggleShelf() {
    if (isCollected.value) {
      Api.share
          .deleteShelf(id: param.book.id)
          .toast(success: "删除成功")
          .hud()
          .then((value) {
        isCollected.value = false;
      });
    } else {
      Api.share
          .addShelf(id: param.book.id)
          .toast(success: "添加成功")
          .hud()
          .then((value) {
        isCollected.value = true;
      });
    }
  }
}
