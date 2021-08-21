import 'package:get/get.dart';
import 'shelf_controller.dart';

class ShelfBinding implements Bindings {
  @override
  void dependencies() {
    var controller = ShelfController();
    Get.lazyPut<ShelfController>(
      () => controller,
    );
  }
}
