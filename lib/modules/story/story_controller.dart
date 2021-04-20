import 'package:corrode/api/api.dart';
import 'package:corrode/models/item.dart';
import 'package:corrode/modules/home/home_controller.dart';
import 'package:get/get.dart';

class StoryController extends GetxController {
  bool isLoading = true;
  List<Item> datas = [];
  StoryType storyType;

  Api _api = Api();

  request() async {
    switch (storyType) {
      case StoryType.top:
        final storyIds = await _api.client.getTopStoryIds();
        Future.wait(storyIds.take(10).map((e) => _api.client.getItem(e)))
            .then((value) {
          datas = value;
          isLoading = false;
          update();
        });
        break;
      case StoryType.new_:
        // TODO: Handle this case.
        break;
      case StoryType.jobs:
        // TODO: Handle this case.
        break;
      case StoryType.show:
        // TODO: Handle this case.
        break;
      case StoryType.ask:
        // TODO: Handle this case.
        break;
      case StoryType.best:
        // TODO: Handle this case.
        break;
    }
  }
}
