import 'package:get/get.dart';

import '../../../models/book.dart';

class BookDetailController extends GetxController {
  Book book;
  BookDetailController({required this.book});

  var isExpanded = false;

  toggle() {
    isExpanded = !isExpanded;
    update();
  }
}
