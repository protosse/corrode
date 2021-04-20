import 'package:corrode/modules/home/home_controller.dart';
import 'package:get/get.dart';

import 'tab_controller.dart';

class MyTabBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyTabController>(() => MyTabController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
