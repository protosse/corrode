import 'package:corrode/api/api.dart';
import 'package:corrode/models/home_category.dart';
import 'package:corrode/util/loadState/load_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with SingleGetTickerProviderMixin, LoadState {
  List<HomeCategory> tabs = [];

  TabController tabController;

  @override
  void onInit() {
    super.onInit();
    request();
  }

  @override
  void onClose() {
    if (tabController != null) {
      tabController.dispose();
    }
    super.onClose();
  }

  @override
  request({bool up = true}) {
    // Api.share.homeCategory().then((value) {
    //   tabs = value;
    //   tabs.insert(0, HomeCategory(cat_id: -1, cat_name: "推荐"));
    //   isFirstLoad = false;
    // }).catchError((error) {
    //   if (isFirstLoad) {
    //     isFirstLoadError = true;
    //   }
    // }).whenComplete(() {
    //   tabController = TabController(vsync: this, length: tabs.length);
    //   update();
    // });

    var home = Api.share.home();
    var category = Api.share.homeCategory();

    Future.wait([home, category]).then((value) {
      isFirstLoad = false;
      tabs = value[1];
      tabs.insert(0, HomeCategory(cat_id: -1, cat_name: "推荐"));
    }).catchError((error) {
      if (isFirstLoad) {
        isFirstLoadError = true;
      }
    }).whenComplete(() {
      tabController = TabController(vsync: this, length: tabs.length);
      update();
    });
  }
}
