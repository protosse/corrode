import '../../../routes/route_model.dart';
import 'package:get/get.dart';
import 'book_detail_controller.dart';

class BookDetailBinding implements Bindings {
  @override
  void dependencies() {
    RouteModel rm = Get.arguments;
    var bookDetailController = BookDetailController(book: rm.model);
    Get.lazyPut<BookDetailController>(
      () => bookDetailController,
      tag: rm.tag,
    );
  }
}
