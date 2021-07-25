import 'package:get/get.dart';

import '../../../routes/route_model.dart';
import 'book_chapter_controller.dart';

class BookChapterBinding implements Bindings {
  @override
  void dependencies() {
    RouteModel rm = Get.arguments;
    var controller = BookChapterController();
    controller.book = rm.model;
    Get.lazyPut<BookChapterController>(
      () => controller,
      tag: rm.tag,
    );
  }
}
