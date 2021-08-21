import 'dart:ffi';

import 'package:corrode/util/screen.dart';
import 'package:corrode/constants/assets_images.dart';
import 'package:corrode/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShelfEmptyWidget extends StatelessWidget {
  final VoidCallback? onTap;
  ShelfEmptyWidget({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImages.icBook),
          SizedBox(height: 54.h),
          Text(
            '书架空空如也，去书城看看吧',
            style: TextStyle(fontSize: 12, color: Colours.text6),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: 108.w,
            height: 44.h,
            child: CupertinoButton(
              padding: EdgeInsets.all(0),
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: Colours.mainMedium,
              onPressed: onTap,
              child: Text("去书城"),
            ),
          ),
        ],
      ),
    );
  }
}
