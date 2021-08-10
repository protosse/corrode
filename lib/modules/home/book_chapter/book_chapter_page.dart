import 'package:corrode/modules/home/book_read/book_read_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/book.dart';
import '../../../models/chapter.dart';
import '../../../routes/app_routes.dart';
import '../../../routes/route_model.dart';
import '../book_read/book_read_controller.dart';
import 'book_chapter_controller.dart';
import 'components/book_chapter_item.dart';

class BookChapterPage extends GetView<BookChapterController> {
  @override
  Widget build(Object context) {
    RouteModel rm = Get.arguments;
    return GetBuilder<BookChapterController>(
      tag: rm.tag,
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("目录"),
          ),
          body: SafeArea(
            child: ListView.builder(
              itemCount: controller.chapters.length,
              itemBuilder: (_, index) {
                Book book = controller.param.book;
                Chapter model = controller.chapters[index];
                return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    var param = BookReadParam();
                    param.book = book;
                    param.chapterId = model.id;
                    Get.to(BookReadPage(),
                        arguments: RouteModel(
                            tag: "${Routes.bookRead}/${book.id}",
                            param: param));
                  },
                  child: BookChapterItem(model: model),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
