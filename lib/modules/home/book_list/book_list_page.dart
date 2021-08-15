import 'package:corrode/theme/colors.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import '../book_detail/book_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/book.dart';
import '../../../models/book_category.dart';
import '../../../routes/app_routes.dart';
import '../../../routes/route_model.dart';
import '../../../util/loadState/load_state.dart';
import 'book_list_controller.dart';
import 'widgets/book_list_item.dart';

class BookListPage extends GetView<BookListController> {
  final BookCategory category;

  String get tag {
    return "bookList/${category.catName}";
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
              child: LoadStateView(
                state: controller,
                child: ListView.builder(
                    itemCount: controller.dataSource.length + 1,
                    itemBuilder: (_, index) {
                      if (index == 0) {
                        return _bannerView();
                      }
                      index -= 1;
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
          );
        });
  }

  Widget _bannerView() {
    return Container(
      height: 166,
      child: Swiper(
        itemBuilder: (context, index) {
          return new Image.network(
            "http://via.placeholder.com/350x150",
            fit: BoxFit.fill,
          );
        },
        itemCount: 3,
        pagination: SwiperPagination(
            margin: EdgeInsets.all(5),
            builder: DotSwiperPaginationBuilder(
              size: 5,
              activeSize: 5,
              color: Colours.mainSoft,
              activeColor: Colours.main,
            )),
      ),
    );
  }
}
