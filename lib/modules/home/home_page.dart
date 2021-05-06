import 'package:corrode/models/home.dart';
import 'package:corrode/modules/home/book_list/book_list_controller.dart';
import 'package:corrode/modules/home/book_list/book_list_page.dart';
import 'package:corrode/modules/home/home_controller.dart';
import 'package:corrode/modules/search/search_page.dart';
import 'package:corrode/theme/colors.dart';
import 'package:corrode/util/loadState/load_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) {
        return Scaffold(
          body: LoadStateView(
            state: controller,
            child: Column(
              children: [
                Container(
                  color: Colours.app_main,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      searchView(),
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

  Widget searchView() {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: GestureDetector(
          onTap: () {
            Get.to(SearchPage());
          },
          child: Container(
            height: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFf56165)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      "穿越文",
                      style: TextStyle(color: Colors.white60),
                    ),
                  )),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "搜索",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget tabBar() {
    return TabBar(
      isScrollable: true,
      unselectedLabelColor: Colors.white60,
      unselectedLabelStyle: TextStyle(fontSize: 14),
      labelColor: Colors.white,
      labelStyle: TextStyle(fontSize: 16),
      indicatorColor: Colors.white,
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
        children: controller.tabs.asMap().entries.map((e) {
          if (e.key == 0) {
            return recommendView();
          } else {
            var controller =
                Get.put(BookListController(), tag: e.value.catName);
            controller.category = e.value;
            return BookListPage(tag: e.value.catName);
          }
        }).toList());
  }

  Widget recommendView() {
    return LoadStateView(
      state: controller,
      child: ListView.builder(
          itemCount: controller.dataSource.length,
          itemBuilder: (_, index) {
            Home model = controller.dataSource[index];
            if (model.list.length == 0) {
              return Container();
            } else {
              return Container(
                child: Text(model.label),
              );
            }
          }),
    );
  }
}
