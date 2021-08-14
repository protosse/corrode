import 'package:corrode/constants/assets_images.dart';
import 'package:corrode/models/book.dart';
import 'package:corrode/modules/home/book_detail/book_detail_controller.dart';
import 'package:corrode/modules/home/book_list/components/book_list_item.dart';
import 'package:corrode/routes/app_routes.dart';
import 'package:corrode/routes/route_model.dart';
import 'package:corrode/theme/colors.dart';
import 'package:corrode/util/loadState/load_state.dart';
import 'package:corrode/util/extensions/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'search_controller.dart';

class SearchPage extends GetView<SearchController> {
  @override
  Widget build(Object context) {
    return GetBuilder<SearchController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            backgroundColor: Colors.white,
            title: _searchView(),
          ),
          body: _historyView(),
        );
      },
    );
  }

  Widget _historyView() {
    return Container(
      color: HexColor.fromHex("#F4F8F7"),
      padding: EdgeInsets.only(top: 10),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Text("搜索记录"),
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            )),
      ),
    );
  }

  Widget _itemView() {
    return LoadStateView(
      enablePullDown: false,
      enableEmpty: false,
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
                      tag: "${Routes.bookDetail}/${model.id}", param: param),
                );
              },
            );
          }),
    );
  }

  Container _searchView() {
    return Container(
        height: 35,
        child: TextField(
          cursorColor: Colours.main,
          style: TextStyle(fontSize: 14),
          decoration: InputDecoration(
              isDense: true,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: '搜索关键字',
              hintStyle: TextStyle(
                color: Colours.text9,
              ),
              focusColor: Colors.transparent,
              prefixIcon: ImageIcon(AssetImages.icFound),
              suffixIcon: Container(
                width: 70,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 1.3,
                      height: 12,
                      decoration: BoxDecoration(
                          color: Colours.main,
                          borderRadius: BorderRadius.circular(3)),
                    ),
                    TextButton(
                        child: Text(
                          "搜索",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colours.main,
                          ),
                        ),
                        onPressed: () {
                          controller.request();
                        }),
                  ],
                ),
              )),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: HexColor.fromHex("#f4f8f7")));
  }
}
