import 'package:corrode/models/book.dart';
import 'package:corrode/models/chapter.dart';
import 'package:corrode/modules/home/book_chapter/components/book_chapter_item.dart';
import 'package:corrode/modules/home/book_read/book_read_controller.dart';
import 'package:corrode/routes/app_routes.dart';
import 'package:corrode/routes/route_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'book_chapter_controller.dart';

class BookChapterPage extends GetView<BookChapterController> {
  @override
  Widget build(Object context) {
    _hideStatusBar();
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
                    param.chapters = controller.chapters;
                    param.index = index;
                    Get.toNamed(Routes.bookRead,
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

  _hideStatusBar() {
    SystemChrome.setEnabledSystemUIOverlays([]);
  }
}
