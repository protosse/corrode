import 'package:corrode/routes/route_model.dart';
import 'package:get/get.dart';

import 'book_read_controller.dart';

class BookReadBinding implements Bindings {
  @override
  void dependencies() {
    RouteModel rm = Get.arguments;
    var controller = BookReadController(param: rm.param);
    Get.lazyPut<BookReadController>(
      () => controller,
      tag: rm.tag,
    );
  }
}
