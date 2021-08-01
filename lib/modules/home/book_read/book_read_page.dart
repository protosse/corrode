import 'package:corrode/models/article.dart';
import 'package:corrode/routes/route_model.dart';
import 'package:corrode/util/constants/assets_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'book_read_controller.dart';
import 'components/book_read_view.dart';

class BookReadPage extends GetView<BookReadController> {
  @override
  Widget build(Object context) {
    RouteModel rm = Get.arguments;
    return GetBuilder<BookReadController>(
      tag: rm.tag,
      builder: (controller) {
        if (controller.currentArticle == null || controller.chapters.isEmpty) {
          return Scaffold();
        }

        return Scaffold(
          body: AnnotatedRegion(
            value: SystemUiOverlayStyle.dark,
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image(
                  image: AssetImages.readBg,
                  fit: BoxFit.cover,
                )),
                buildPageView(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildPageView() {
    if (controller.currentArticle == null) {
      return Container();
    }
    return PageView.builder(
      physics: BouncingScrollPhysics(),
      controller: controller.pageController,
      itemCount: controller.itemCount,
      itemBuilder: buildPage,
      onPageChanged: controller.onPageChanged,
    );
  }

  Widget buildPage(BuildContext context, int index) {
    if (controller.currentArticle == null) {
      return Container();
    }
    var page = index - (controller.preArticle?.pageCount ?? 0);
    Article article;
    if (page >= controller.currentArticle!.pageCount) {
      if (controller.nextArticle == null) {
        return Container();
      }
      // 到达下一章了
      article = controller.nextArticle!;
      page = 0;
    } else if (page < 0) {
      if (controller.preArticle == null) {
        return Container();
      }
      // 到达上一章了
      article = controller.preArticle!;
      page = controller.preArticle!.pageCount - 1;
    } else {
      article = controller.currentArticle!;
    }

    return GestureDetector(
      child: BookReaderView(
          article: article,
          page: page,
          topSafeHeight: controller.topSafeHeight),
    );
  }
}
