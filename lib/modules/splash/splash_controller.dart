import 'package:corrode/models/user.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();

    Future.delayed(Duration(seconds: 3), () {
      if (User.share() == null) {
        Get.offAllNamed(Routes.login);
      } else {
        Get.offAllNamed(Routes.tab);
      }
    });
  }
}
