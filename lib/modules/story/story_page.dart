import 'package:corrode/components/loading_overlay.dart';
import 'package:corrode/models/item.dart';
import 'package:corrode/modules/home/home_controller.dart';
import 'package:corrode/modules/story/story_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoryPage extends StatelessWidget {
  final StoryController controller = Get.put(StoryController());

  final StoryType storyType;

  StoryPage({@required this.storyType}) {
    controller.storyType = storyType;
    // controller.request();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<StoryController>(
        builder: (controller) {
          return LoadingOverlay(
              isLoading: controller.isLoading,
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: controller.datas.length,
                itemBuilder: (context, index) =>
                    StoryRow(controller.datas[index]),
              ));
        },
      ),
    );
  }
}

class StoryRow extends StatelessWidget {
  final Item item;
  StoryRow(this.item);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Text(item.title),
      ),
    );
  }
}
