import 'package:corrode/modules/mine/mine_controller.dart';
import 'package:get/get.dart';

class MineBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MineController>(() => MineController());
  }
}
