import 'package:corrode/api/api.dart';
import 'package:corrode/models/book.dart';
import 'package:corrode/util/loadState/load_state.dart';
import '../../../util/extensions/future_extension.dart';
import 'package:get/get.dart';

class ShelfController extends GetxController
    with SingleGetTickerProviderMixin, LoadState {
  var isEdit = false;
  var isSelectedAll = false;
  List<Book> selectedItem = [];

  @override
  void onReady() {
    super.onReady();
    request();
  }

  @override
  request({bool pullDown = true}) {
    super.request(pullDown: pullDown);
    if (pullDown) {
      selectedItem = [];
      isSelectedAll = false;
    }
    Api.share
        .shelfList(page: page, perPage: perPage)
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

  toggleEdit() {
    isEdit = !isEdit;
    update();
  }

  toggle({required Book book}) {
    if (selectedItem.contains(book)) {
      selectedItem.remove(book);
    } else {
      selectedItem.add(book);
    }
    isSelectedAll = dataSource.length == selectedItem.length;
    update();
  }

  toggleAll() {
    if (dataSource.isNotEmpty && dataSource.length == selectedItem.length) {
      selectedItem = [];
      isSelectedAll = false;
    } else {
      selectedItem = dataSource.map((e) => e as Book).toList();
      isSelectedAll = true;
    }
    update();
  }

  delete() {
    if (selectedItem.isEmpty) {
      return;
    }
    List<Future> res = [];
    for (Book book in selectedItem) {
      var request = Api.share.deleteShelf(id: book.id);
      res.add(request);
    }

    Future.wait(res).toastWhenError().hud().then((value) {
      selectedItem.forEach((element) {
        dataSource.remove(element);
      });
      isSelectedAll = false;
      isEdit = false;
      update();
    });
  }
}
