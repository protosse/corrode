import 'package:get/get.dart';

import 'book_read_controller.dart';

class BookReadBinding implements Bindings {
	@override
	void dependencies() {
		Get.lazyPut<BookReadController>(() => BookReadController());
	}
}
	