import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/api.dart';
import '../../models/book.dart';
import '../../models/book_category.dart';
import '../../util/loadState/load_state.dart';

class HomeController extends GetxController
    with SingleGetTickerProviderMixin, LoadState {
  late TabController tabController;
  List<BookCategory> tabs = [];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 0);
    request();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  @override
  request({bool pullDown = true}) {
    super.request(pullDown: pullDown);
    var home = Api.share.bookList(page: page, perPage: perPage);
    var category = Future.value([
      BookCategory(name: "全部"),
      // BookCategory(name: "奇幻"),
      // BookCategory(name: "玄幻"),
    ]);

    Future.wait([home, category]).then((value) {
      isFirstLoad = false;
      tabs = value[1] as List<BookCategory>;
      var data = value[0] as List<Book>;
      configDataSource(data);
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
