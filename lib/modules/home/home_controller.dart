import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/api.dart';
import '../../models/home_category.dart';
import '../../util/loadState/load_state.dart';

class HomeController extends GetxController
    with SingleGetTickerProviderMixin, LoadState {
  TabController? tabController;
  List<HomeCategory> tabs = [];

  @override
  void onInit() {
    super.onInit();
    request();
  }

  @override
  void onClose() {
    tabController?.dispose();
    super.onClose();
  }

  @override
  request({bool pullDown = true}) {
    super.request(pullDown: pullDown);
    var home = Api.share.home();
    var category = Api.share.homeCategory();

    Future.wait([home, category]).then((value) {
      isFirstLoad = false;
      tabs = value[1] as List<HomeCategory>;
      tabs.insert(0, HomeCategory(catId: -1, catName: "推荐"));
      configDataSource(value.first);
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
