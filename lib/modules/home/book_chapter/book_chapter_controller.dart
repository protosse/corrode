import 'package:flutter/material.dart';

import '../../../api/api.dart';
import '../../../models/book.dart';
import '../../../models/chapter.dart';
import 'package:get/get.dart';
import '../../../util/extensions/future_extension.dart';

class BookChapterController extends GetxController {
  Book? book;
  int? bookId;

  List<Chapter> chapters = [];

  PageController pageController = PageController(keepPage: false);

  @override
  void onReady() {
    super.onReady();
    request();
  }

  request() {
    var id = bookId ?? book?.id;
    if (id == null) {
      return;
    }
    Api.share.chapterList(id: id).toastWhenError().then((value) {
      chapters = value;
    }).whenComplete(() {
      update();
    });
  }
}
