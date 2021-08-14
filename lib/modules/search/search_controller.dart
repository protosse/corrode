import 'package:corrode/api/api.dart';
import 'package:corrode/util/loadState/load_state.dart';
import 'package:corrode/util/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../util/extensions/future_extension.dart';

class SearchController extends GetxController with LoadState {
  var textController = TextEditingController();

  var tags = List<String>.filled(0, "").obs;

  var isShowHistoryView = true;

  @override
  void onInit() {
    this.isFirstLoad = false;
    tags.value = Util.sp.getStringList(DefaultKey.searchHistory) ?? [];
    super.onInit();
  }

  @override
  request({bool pullDown = true}) {
    super.request(pullDown: pullDown);
    var text = textController.text;
    if (text.isNotEmpty) {
      tags.remove(text);
      tags.insert(0, text);
      Util.sp.setStringList(DefaultKey.searchHistory, tags);
      tags.refresh();
    }
    Api.share
        .bookList(page: page, perPage: perPage, title: text)
        .toastWhenError()
        .then((value) {
      isFirstLoad = false;
      isShowHistoryView = false;
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

  clearTags() {
    tags.clear();
    Util.sp.setStringList(DefaultKey.searchHistory, tags);
    tags.refresh();
  }
}
