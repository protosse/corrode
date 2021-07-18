import 'package:get/get.dart';
import 'book_detail_controller.dart';

class BookDetailBinding implements Bindings {
	@override
	void dependencies() {
		Get.lazyPut<BookDetailController>(() => BookDetailController());
	}
}
	