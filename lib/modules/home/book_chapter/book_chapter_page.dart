import 'package:corrode/routes/route_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../util/constants/flutter_assets.dart';
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
          body: AnnotatedRegion(
            value: SystemUiOverlayStyle.dark,
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image(
                  image: AssetImages.readBg,
                  fit: BoxFit.cover,
                )),
                _buildPagingView(controller),
              ],
            ),
          ),
        );
      },
    );
  }

  _hideStatusBar() {
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  Widget _buildPagingView(BookChapterController controller) {
    return Container();
  }
}
