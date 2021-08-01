import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/book.dart';
import '../../../routes/app_routes.dart';
import '../../../routes/route_model.dart';
import '../../../theme/colors.dart';
import '../../../util/constants/flutter_assets.dart';
import '../book_chapter/book_chapter_controller.dart';
import 'book_detail_controller.dart';

class BookDetailPage extends GetView<BookDetailController> {
  @override
  Widget build(Object context) {
    RouteModel rm = Get.arguments;
    return GetBuilder<BookDetailController>(
      tag: rm.tag,
      builder: (controller) {
        var model = controller.param.book;
        return Scaffold(
          appBar: AppBar(
            title: Text(model.title),
          ),
          body: SafeArea(
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      _topView(model),
                      SizedBox(height: 15),
                      _infoView(controller, model),
                      SizedBox(height: 15),
                      _catalogView(model),
                    ],
                  ),
                ),
                Spacer(),
                _bottomView()
              ],
            ),
          ),
        );
      },
    );
  }

  Container _bottomView() {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "加入书架",
                    style: TextStyle(color: Colors.lightBlue),
                  )),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.lightBlue,
              child: TextButton(
                onPressed: () {},
                child: Text("立即阅读"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _catalogView(Book model) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        var param = BookChapterParam(book: model);
        Get.toNamed(Routes.bookChapter,
            arguments: RouteModel(
                tag: "${Routes.bookChapter}/${model.id}", param: param));
      },
      child: Column(
        children: [
          Container(
            height: 0.5,
            color: Colours.divider,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Text(
                  "查看目录",
                  style: TextStyle(color: Colours.text_gray),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colours.text_gray,
                  size: 15,
                )
              ],
            ),
          ),
          Container(
            height: 0.5,
            color: Colours.divider,
          ),
        ],
      ),
    );
  }

  Padding _infoView(BookDetailController controller, Book model) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("内容介绍"),
          Padding(padding: EdgeInsets.only(top: 8)),
          GestureDetector(
            onTap: () {
              controller.toggle();
            },
            child: Text(
              model.intro,
              maxLines: controller.isExpanded ? null : 4,
              overflow: controller.isExpanded ? null : TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12, color: Colours.text_gray),
            ),
          ),
        ],
      ),
    );
  }

  Padding _topView(Book model) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: FadeInImage(
              width: 85,
              fit: BoxFit.cover,
              placeholder: AssetImages.defaultPlaceholder,
              image: AssetImages.defaultPlaceholder,
              // image: NetworkImage(model.img),
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 10)),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: TextStyle(fontSize: 18, color: Colours.text_dark),
                ),
                Text(
                  "作者：${model.author}",
                  style: TextStyle(fontSize: 12, color: Colours.text_gray),
                ),
                Text(
                  "分类：${model.catName}",
                  style: TextStyle(fontSize: 12, color: Colours.text_gray),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
