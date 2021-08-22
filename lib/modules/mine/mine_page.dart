import 'package:corrode/util/screen.dart';
import 'package:corrode/constants/assets_images.dart';
import 'package:corrode/theme/colors.dart';
import 'package:corrode/util/extensions/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mine_controller.dart';

class MinePage extends GetView<MineController> {
  @override
  Widget build(Object context) {
    return GetBuilder<MineController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              color: HexColor.fromHex("#F4F8F7"),
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  SizedBox(height: 60.h),
                  Image(image: AssetImages.icBook),
                  SizedBox(height: 12.h),
                  Text(
                    "请登录",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colours.text3,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          )),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Column(
                            children: [
                              MineTapItem(
                                image: AssetImages.icLs,
                                title: "浏览历史",
                                onTap: () {},
                              ),
                              MineTapItem(
                                image: AssetImages.icJy,
                                title: "意见反馈",
                                onTap: () {},
                              ),
                              MineTapItem(
                                image: AssetImages.icSz,
                                title: "设置中心",
                                hideLine: true,
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class MineTapItem extends StatelessWidget {
  final AssetImage image;
  final String title;
  final VoidCallback onTap;
  final bool hideLine;

  MineTapItem(
      {required this.image,
      required this.title,
      required this.onTap,
      this.hideLine = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 57.h,
          child: Row(
            children: [
              Image(image: image),
              SizedBox(width: 10.w),
              Text(
                title,
                style: TextStyle(
                    color: Colours.text3,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Image(image: AssetImages.icNext)
            ],
          ),
        ),
        Container(
          height: hideLine ? 0 : 1,
          color: HexColor.fromHex("#efefef"),
        )
      ],
    );
  }
}
