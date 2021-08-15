import 'package:corrode/constants/assets_images.dart';
import 'package:corrode/modules/home/book_read/book_read_page.dart';
import 'package:corrode/theme/colors.dart';
import 'package:corrode/util/extensions/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../util/screen.dart';
import '../../../models/book.dart';
import '../../../models/chapter.dart';
import '../../../routes/app_routes.dart';
import '../../../routes/route_model.dart';
import '../book_read/book_read_controller.dart';
import 'book_chapter_controller.dart';

class BookChapterPage extends GetView<BookChapterController> {
  final String? controllerTag;

  BookChapterPage({this.controllerTag});

  @override
  Widget build(Object context) {
    var tag = controllerTag ?? (Get.arguments as RouteModel).tag;
    return GetBuilder<BookChapterController>(
      tag: tag,
      builder: (controller) {
        var model = controller.param.book;
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 20, right: 10),
                      child: Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: FadeInImage(
                            width: 93.w,
                            height: 120.h,
                            fit: BoxFit.cover,
                            placeholder: AssetImages.defaultPlaceholder,
                            image: AssetImages.defaultPlaceholder,
                            // image: NetworkImage(model.img),
                          ),
                        ),
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset:
                                Offset(-3, -3), // changes position of shadow
                          )
                        ]),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colours.text3,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "作者：" + model.author,
                            style: TextStyle(
                              color: Colours.text6,
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "连载中・${model.num}章",
                            style: TextStyle(
                              color: Colours.text6,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        controller.reverseSort();
                      },
                      child: Row(
                        children: [
                          Image(
                              image: controller.isDescend
                                  ? AssetImages.icJx
                                  : AssetImages.icSx),
                          SizedBox(width: 4),
                          Text(controller.isDescend ? "降序" : "升序",
                              style: TextStyle(
                                color: Colours.text6,
                                fontSize: 10,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  height: 1,
                  color: HexColor.fromHex("#DDDDDD"),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.chapters.length,
                    itemBuilder: (_, index) {
                      Book book = controller.param.book;
                      Chapter model = controller.chapters[index];
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          var param = BookReadParam();
                          param.book = book;
                          param.chapterId = model.id;
                          Get.back();
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
              ],
            ),
          ),
        );
      },
    );
  }
}

class BookChapterItem extends StatelessWidget {
  final Chapter model;

  BookChapterItem({required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(15),
          child: Text(
            model.chapter,
            style: TextStyle(fontSize: 12, color: Colours.text6),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 1,
            color: HexColor.fromHex("#DDDDDD"),
          ),
        ),
      ],
    );
  }
}
