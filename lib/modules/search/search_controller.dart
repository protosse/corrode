import 'package:corrode/api/api.dart';
import 'package:corrode/util/loadState/load_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../util/extensions/future_extension.dart';

class SearchController extends GetxController with LoadState {
  var textController = TextEditingController();

  @override
  void onInit() {
    this.isFirstLoad = false;
    super.onInit();
  }

  @override
  request({bool pullDown = true}) {
    super.request(pullDown: pullDown);
    Api.share
        .bookList(page: page, perPage: perPage, title: textController.text)
        .toastWhenError()
        .then((value) {
      isFirstLoad = false;
      configDataSource(value);
    }).catchError((err) {
      if (isFirstLoad) {
        isFirstLoadError = true;
      }
      endRefreshing();
    }).whenComplete(() {
      update();
    });
  }
}
