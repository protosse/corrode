import 'package:corrode/modules/home/book_detail/book_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/book.dart';
import '../../../models/book_category.dart';
import '../../../routes/app_routes.dart';
import '../../../routes/route_model.dart';
import '../../../util/loadState/load_state.dart';
import 'book_list_controller.dart';
import 'components/book_list_item.dart';

class BookListPage extends GetView<BookListController> {
  final BookCategory category;

  String get tag {
    return "bookList/${category.name}";
  }

  BookListPage({required this.category}) {
    var controller = Get.put(BookListController(), tag: tag);
    controller.category = category;
  }

  @override
  Widget build(Object context) {
    return GetBuilder<BookListController>(
        tag: tag,
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // _filterView(),
                  Expanded(
                    child: LoadStateView(
                      state: controller,
                      child: ListView.builder(
                          itemCount: controller.dataSource.length,
                          itemBuilder: (_, index) {
                            Book model = controller.dataSource[index];
                            return InkWell(
                              child: BookListItem(model: model),
                              onTap: () {
                                var param = BookDetailParam(book: model);
                                Get.toNamed(
                                  Routes.bookDetail,
                                  arguments: RouteModel(
                                      tag: "${Routes.bookDetail}/${model.id}",
                                      param: param),
                                );
                              },
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
