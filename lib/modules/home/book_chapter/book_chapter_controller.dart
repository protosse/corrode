import 'package:get/get.dart';

import '../../../api/api.dart';
import '../../../models/book.dart';
import '../../../models/chapter.dart';
import '../../../util/extensions/future_extension.dart';

class BookChapterParam {
  Book book;

  BookChapterParam({required this.book});
}

class BookChapterController extends GetxController {
  BookChapterParam param;

  BookChapterController({required this.param});

  List<Chapter> chapters = [];

  @override
  void onReady() {
    super.onReady();
    request();
  }

  request() {
    var id = param.book.id;
    Api.share.chapterList(id: id).toastWhenError().then((value) {
      chapters = value;
    }).whenComplete(() {
      update();
    });
  }
}
