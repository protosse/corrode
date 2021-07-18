import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../util/loadState/load_state.dart';
import '../../../models/book.dart';
import 'book_list_controller.dart';
import 'components/book_list_item.dart';

class BookListPage extends GetView<BookListController> {
  @override
  final String tag;
  BookListPage({required this.tag});

  @override
  Widget build(Object context) {
    return GetBuilder<BookListController>(
        tag: tag,
        builder: (controller) {
          return Scaffold(
            body: Column(
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
                              // BookDetailPage
                              Get.toNamed("/book/${model.id}");
                            },
                          );
                        }),
                  ),
                ),
              ],
            ),
          );
        });
  }

  // Widget _filterView() {
  //   return Container(
  //     child: Padding(
  //       padding: EdgeInsets.all(8.0),
  //       child: Wrap(
  //         spacing: 10,
  //         children: [
  //           _filterItem("全部", 0, () {
  //             controller.bookStatus.value = 0;
  //           }),
  //           _filterItem("已完结", 2, () {
  //             controller.bookStatus.value = 2;
  //           }),
  //           _filterItem("连载中", 1, () {
  //             controller.bookStatus.value = 1;
  //           }),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget _filterItem(String text, int index, VoidCallback tap) {
  //   return Container(
  //       height: 30,
  //       child: Obx(() => TextButton(
  //             child: Text(
  //               text,
  //               style: TextStyle(fontSize: 12),
  //             ),
  //             style: ButtonStyle(
  //                 padding: MaterialStateProperty.all(
  //                     EdgeInsets.symmetric(horizontal: 25)),
  //                 overlayColor: MaterialStateProperty.all(Colours.background),
  //                 foregroundColor: MaterialStateProperty.all(
  //                     controller.bookStatus.value == index
  //                         ? Colours.app_main
  //                         : Colours.text_normal),
  //                 backgroundColor:
  //                     MaterialStateProperty.all(Colours.background),
  //                 shape: MaterialStateProperty.all(RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(18.0),
  //                     side: BorderSide(
  //                         color: controller.bookStatus.value == index
  //                             ? Colours.app_main
  //                             : Colors.transparent,
  //                         width: 0.5)))),
  //             onPressed: tap,
  //           )));
  // }
}
