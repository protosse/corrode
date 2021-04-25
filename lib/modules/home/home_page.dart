import 'package:corrode/modules/home/home_controller.dart';
import 'package:corrode/modules/story/story_page.dart';
import 'package:corrode/util/colors.dart';
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
              title: Container(
                color: Colours.red,
                child: Column(
                  children: [
                    searchView(),
                    tabBar(),
                  ],
                ),
              ),
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

  Container searchView() {
    return Container(
      color: Color(0xFFf56165),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          
        ],
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
