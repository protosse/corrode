import 'package:get/get.dart';
import 'book_list_controller.dart';

class BookListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookListController>(() => BookListController());
  }
}
		