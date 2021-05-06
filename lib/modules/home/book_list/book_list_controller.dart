import 'package:corrode/api/api.dart';
import 'package:corrode/models/home_category.dart';
import 'package:corrode/util/loadState/load_state.dart';
import 'package:corrode/util/extensions/future_extension.dart';
import 'package:get/get.dart';

class BookListController extends GetxController
    with SingleGetTickerProviderMixin, LoadState {
  HomeCategory category;
  var bookStatus = 0.obs;

  @override
  void onReady() {
    super.onReady();
    request();

    bookStatus.listen((_) {
      isFirstLoad = true;
      update();
      request();
    });
  }

  @override
  request({bool pullDown = true}) {
    super.request(pullDown: pullDown);
    Api.share
        .bookList(
            page: page,
            pageSize: perPage,
            catId: category.catId,
            bookStatus: bookStatus.value)
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
