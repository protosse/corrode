import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';

import '../../../models/article.dart';
import '../../../routes/route_model.dart';
import '../../../constants/assets_images.dart';
import 'book_read_controller.dart';
import 'components/book_read_view.dart';

class BookReadPage extends StatelessWidget {
  @override
  Widget build(Object context) {
    RouteModel rm = Get.arguments;
    Get.put(BookReadController(param: rm.param), tag: rm.tag);
    return FocusDetector(
      onFocusLost: () {
        SystemChrome.setEnabledSystemUIOverlays(
            [SystemUiOverlay.top, SystemUiOverlay.bottom]);
      },
      child: GetBuilder<BookReadController>(
        tag: rm.tag,
        builder: (controller) {
          if (controller.currentArticle == null ||
              controller.chapters.isEmpty) {
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
                  buildPageView(controller),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildPageView(BookReadController controller) {
    if (controller.currentArticle == null) {
      return Container();
    }
    return PageView.builder(
      physics: BouncingScrollPhysics(),
      controller: controller.pageController,
      itemCount: controller.itemCount,
      itemBuilder: (context, index) {
        return buildPage(context, controller, index);
      },
      onPageChanged: controller.onPageChanged,
    );
  }

  Widget buildPage(
      BuildContext context, BookReadController controller, int index) {
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
