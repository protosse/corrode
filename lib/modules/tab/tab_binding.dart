import 'package:corrode/modules/mine/mine_controller.dart';
import 'package:corrode/modules/shelf/shelf_controller.dart';
import 'package:get/get.dart';

import '../home/home_controller.dart';
import 'tab_controller.dart';

class MyTabBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyTabController>(() => MyTabController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<MineController>(() => MineController());
    Get.lazyPut<ShelfController>(() => ShelfController());
  }
}
