import 'package:corrode/modules/home/home_controller.dart';
import 'package:corrode/modules/story/story_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: tabBar(),
            ),
            body: TabBarView(
              controller: controller.tabController,
              children:
                  StoryType.values.map((e) => StoryPage(storyType: e)).toList(),
            ),
          );
        },
      ),
    );
  }

  TabBar tabBar() {
    return TabBar(
      isScrollable: true,
      unselectedLabelColor: Colors.grey,
      labelColor: Colors.blue,
      indicatorColor: Colors.blue,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorWeight: 2.0,
      tabs: controller.tabs
          .map((t) => Tab(
                text: t.name,
              ))
          .toList(),
      controller: controller.tabController,
    );
  }
}
