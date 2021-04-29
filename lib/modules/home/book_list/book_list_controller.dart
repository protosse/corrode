import 'package:corrode/api/api.dart';
import 'package:corrode/models/home_category.dart';
import 'package:corrode/util/loadState/refresh_state.dart';
import 'package:corrode/util/extensions/future_extension.dart';
import 'package:get/get.dart';

class BookListController extends GetxController
    with SingleGetTickerProviderMixin, RefreshState {
  HomeCategory category;
  int bookStatus = 0;

  @override
  void onReady() {
    super.onReady();
    request();
  }

  @override
  request({bool pullDown = true}) {
    super.request(pullDown: pullDown);
    Api.share
        .bookList(
            page: page,
            pageSize: perPage,
            catId: category.catId,
            bookStatus: bookStatus)
        .toastWhenError()
        .then((value) {
      configDataSource(value);
    }).catchError((err) {
      endRefreshing();
    }).whenComplete(() {
      update();
    });
  }
}
