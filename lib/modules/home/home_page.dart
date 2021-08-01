import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import 'book_list/book_list_page.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Scaffold(
            appBar: AppBar(
              title: Text("书城"),
              actions: [
                IconButton(
                    onPressed: () => {Get.toNamed(Routes.search)},
                    icon: Icon(
                      Icons.search,
                    ))
              ],
            ),
            body: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      tabBar(),
                    ],
                  ),
                ),
                Expanded(child: tabBarView())
              ],
            ),
          ),
        );
      },
    );
  }

  Widget tabBar() {
    return TabBar(
      isScrollable: true,
      unselectedLabelColor: Colors.black54,
      unselectedLabelStyle: TextStyle(fontSize: 14),
      labelColor: Colors.black,
      labelStyle: TextStyle(fontSize: 16),
      indicatorColor: Colors.black54,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorWeight: 2.0,
      tabs: controller.tabs
          .map((t) => Tab(
                text: t.catName,
              ))
          .toList(),
      controller: controller.tabController,
    );
  }

  Widget tabBarView() {
    return TabBarView(
      controller: controller.tabController,
      children: controller.tabs.map((e) => BookListPage(category: e)).toList(),
    );
  }
}
