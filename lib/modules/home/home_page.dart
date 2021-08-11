import 'package:corrode/constants/assets_images.dart';
import 'package:corrode/theme/colors.dart';
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
            body: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: tabBar()),
                      IconButton(
                          onPressed: () => {Get.toNamed(Routes.search)},
                          icon: ImageIcon(AssetImages.icFound))
                    ],
                  ),
                  Expanded(child: tabBarView())
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget tabBar() {
    return TabBar(
      isScrollable: true,
      unselectedLabelColor: Colours.text6,
      unselectedLabelStyle: TextStyle(fontSize: 14),
      labelColor: Colours.text3,
      labelStyle: TextStyle(fontSize: 14),
      indicatorColor: Colours.main,
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
