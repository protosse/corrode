import 'package:get/get.dart';

import '../../../api/api.dart';
import '../../../models/home_category.dart';
import '../../../util/extensions/future_extension.dart';
import '../../../util/loadState/load_state.dart';

class BookListController extends GetxController
    with SingleGetTickerProviderMixin, LoadState {
  late HomeCategory category;
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
            catId: category.catId ?? 0,
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
