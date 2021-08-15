import 'dart:io';

import 'package:corrode/modules/home/book_chapter/book_chapter_page.dart';
import 'package:corrode/util/extensions/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/book.dart';
import '../../../routes/route_model.dart';
import '../../../theme/colors.dart';
import '../../../constants/flutter_assets.dart';
import 'book_detail_controller.dart';
import '../../../util/screen.dart';

class BookDetailPage extends GetView<BookDetailController> {
  final GlobalKey _buttonKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    RouteModel rm = Get.arguments;
    return GetBuilder<BookDetailController>(
      tag: rm.tag,
      builder: (controller) {
        var model = controller.param.book;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: HexColor.fromHex("#F4F8F7"),
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            leading: IconButton(
              icon: Icon(
                  Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          body: Container(
            color: HexColor.fromHex("#F4F8F7"),
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30.h),
                          _topView(model),
                          SizedBox(height: 20.h),
                          Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 20.h, bottom: 47.h),
                                  child: _starAndReadView(),
                                ),
                                _infoView(controller, model),
                                SizedBox(height: 20.h)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Builder(builder: (context) {
                    return _bottomView(context, model);
                  })
                ],
              ),
            ),
          ),
          drawer: Drawer(
            child: BookChapterPage(controllerTag: controller.chapterTag),
          ),
        );
      },
    );
  }

  Row _starAndReadView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Row(
              children: [
                Text(
                  "7.5",
                  style: TextStyle(
                      color: Colours.text6,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "分",
                  style: TextStyle(
                      color: Colours.text6,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Image(image: AssetImages.icStar),
                Image(image: AssetImages.icStar),
                Image(image: AssetImages.icStar),
                Image(image: AssetImages.icStar),
                Image(image: AssetImages.icStar),
              ],
            )
          ],
        ),
        Container(
          width: 1,
          height: 44.h,
          color: HexColor.fromHex("#DDDDDD"),
        ),
        Column(
          children: [
            Row(
              children: [
                Text(
                  "7.5",
                  style: TextStyle(
                      color: Colours.text6,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "万人",
                  style: TextStyle(
                      color: Colours.text6,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              "正在阅读",
              style: TextStyle(
                color: Colours.text6,
                fontSize: 10,
              ),
            )
          ],
        ),
      ],
    );
  }

  Center _topView(Book model) {
    return Center(
      child: Column(
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: FadeInImage(
                width: 182.w,
                height: 235.h,
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
                offset: Offset(-3, -3), // changes position of shadow
              )
            ]),
          ),
          SizedBox(height: 15.h),
          Text(
            model.title,
            style: TextStyle(
              fontSize: 24,
              color: Colours.text3,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            model.author + "・连载中",
            style: TextStyle(
              fontSize: 10,
              color: Colours.text6,
            ),
          ),
        ],
      ),
    );
  }

  Container _bottomView(BuildContext context, Book model) {
    return Container(
      color: Colors.white,
      height: 70.h,
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              key: _buttonKey,
              child: TextButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Text(
                    "目录",
                    style: TextStyle(
                        color: Colours.text6,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: HexColor.fromHex("#DDDDDD"),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "加入书架",
                    style: TextStyle(
                        color: Colours.text6,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: HexColor.fromHex("#DDDDDD"),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "开始阅读",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colours.mainMedium,
              ),
            ),
          )
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
          Container(
            height: 1,
            color: HexColor.fromHex("#DDDDDD"),
          ),
          SizedBox(height: 20.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "简介：",
                style: TextStyle(
                    color: Colours.text3,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              _tags(["都市", "连载"])
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 8)),
          GestureDetector(
            onTap: () {
              controller.toggle();
            },
            child: Text(
              model.intro,
              maxLines: controller.isExpanded ? null : 4,
              overflow: controller.isExpanded ? null : TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12, color: Colours.text9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tags(List<String> tags) {
    return Wrap(
      spacing: 4,
      children: (tags)
          .map((e) => Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 0),
              child: Text(
                e,
                style: TextStyle(
                  fontSize: 9,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [
                    HexColor.fromHex("#04A293"),
                    HexColor.fromHex("#B0F9C4")
                  ],
                ),
              )))
          .toList(),
    );
  }
}
