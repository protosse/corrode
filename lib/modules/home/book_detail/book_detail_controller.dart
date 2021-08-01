import 'package:get/get.dart';

import '../../../models/book.dart';

class BookDetailParam {
  Book book;

  BookDetailParam({required this.book});
}

class BookDetailController extends GetxController {
  BookDetailParam param;

  BookDetailController({required this.param});

  var isExpanded = false;

  toggle() {
    isExpanded = !isExpanded;
    update();
  }
}
