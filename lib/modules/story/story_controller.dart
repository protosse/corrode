import 'package:corrode/models/item.dart';
import 'package:corrode/modules/home/home_controller.dart';
import 'package:get/get.dart';

class StoryController extends GetxController {
  bool isLoading = true;
  List<Item> datas = [];
  StoryType storyType;
}
