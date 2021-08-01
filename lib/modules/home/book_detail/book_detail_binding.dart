import 'package:get/get.dart';

import '../../../routes/route_model.dart';
import 'book_detail_controller.dart';

class BookDetailBinding implements Bindings {
  @override
  void dependencies() {
    RouteModel rm = Get.arguments;
    var controller = BookDetailController(param: rm.param);
    Get.lazyPut<BookDetailController>(
      () => controller,
      tag: rm.tag,
    );
  }
}
