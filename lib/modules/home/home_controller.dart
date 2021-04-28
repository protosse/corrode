import 'package:corrode/api/api.dart';
import 'package:corrode/models/home_category.dart';
import 'package:corrode/util/loadState/load_state.dart';
import 'package:corrode/util/loadState/refresh_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with SingleGetTickerProviderMixin, LoadState, RefreshState<HomeCategory> {
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
  request({bool pullDown = true}) {
    var home = Future.value();
    var category = Api.share.homeCategory();

    Future.wait([home, category]).then((value) {
      isFirstLoad = false;
      dataSource = value[1];
      dataSource.insert(0, HomeCategory(catId: -1, catName: "推荐"));
    }).catchError((error) {
      if (isFirstLoad) {
        isFirstLoadError = true;
      }
    }).whenComplete(() {
      tabController = TabController(vsync: this, length: dataSource.length);
      update();
    });
  }
}
