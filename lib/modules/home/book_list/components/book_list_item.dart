import 'package:corrode/util/extensions/color_extension.dart';
import 'package:flutter/material.dart';

import '../../../../models/book.dart';
import '../../../../theme/colors.dart';
import '../../../../constants/flutter_assets.dart';
import '../../../../util/screen.dart';

class BookListItem extends StatelessWidget {
  final Book model;

  BookListItem({required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30.h, left: 15.w, right: 15.w),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
                height: 108.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: HexColor.fromHex("#F8FEFC"),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ])),
          ),
          _item(),
        ],
      ),
    );
  }

  Widget _item() {
    return Container(
      padding: EdgeInsets.only(left: 25.w, right: 10.w, bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: FadeInImage(
                width: 97.w,
                height: 125.h,
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
          Flexible(
            child: Container(
              padding: EdgeInsets.only(left: 10.w, top: 40.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        model.title,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colours.text3,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        "评分：",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colours.text6,
                        ),
                      ),
                      Text(
                        "9.7",
                        style: TextStyle(
                            fontSize: 12,
                            color: HexColor.fromHex("#FD971B"),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  _tags(["都市"]),
                  Text(
                    model.intro,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 10, color: Colours.text6),
                  ),
                ],
              ),
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
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              child: Text(
                e,
                style: TextStyle(
                  fontSize: 10,
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
