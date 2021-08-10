import 'package:get/get.dart';
import '../../../routes/route_model.dart';
import 'login_controller.dart';

class LoginBinding implements Bindings {
	@override
	void dependencies() {
		var controller = LoginController();
		Get.lazyPut<LoginController>(
		  () => controller,
		);
	}
}
	