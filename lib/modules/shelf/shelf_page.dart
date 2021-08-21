import 'package:corrode/constants/assets.dart';
import 'package:corrode/constants/assets_images.dart';
import 'package:corrode/models/book.dart';
import 'package:corrode/modules/home/book_read/book_read_controller.dart';
import 'package:corrode/modules/home/book_read/book_read_page.dart';
import 'package:corrode/modules/tab/tab_controller.dart';
import 'package:corrode/routes/app_routes.dart';
import 'package:corrode/routes/route_model.dart';
import 'package:corrode/util/loadState/load_state.dart';
import 'package:corrode/util/screen.dart';
import 'package:corrode/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/shelf_empty.dart';
import 'shelf_controller.dart';
import 'package:get/get.dart';

class ShelfPage extends GetView<ShelfController> {
  @override
  Widget build(Object context) {
    return GetBuilder<ShelfController>(
      builder: (controller) {
        return SafeArea(
          child: Column(
            children: [
              _topView(),
              SizedBox(height: 45.h),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: LoadStateView(
                    state: controller,
                    emptyWidget: ShelfEmptyWidget(
                      onTap: () {
                        MyTabController c = Get.find();
                        c.changeTabIndex(0);
                      },
                    ),
                    child: GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 20.w,
                      crossAxisSpacing: 20.h,
                      childAspectRatio: 97 / 125,
                      children: controller.dataSource
                          .asMap()
                          .map((key, value) =>
                              MapEntry(key, _itemView(key, value)))
                          .values
                          .toList(),
                    ),
                  ),
                ),
              ),
              controller.isEdit ? _bottomView() : null
            ].whereType<Widget>().toList(),
          ),
        );
      },
    );
  }

  Widget _itemView(int index, Book book) {
    return InkWell(
      onTap: () {
        var param = BookReadParam();
        param.book = book;
        Get.back();
        Get.to(BookReadPage(),
            arguments:
                RouteModel(tag: "${Routes.bookRead}/${book.id}", param: param));
      },
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 5, top: 5, right: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: FadeInImage.assetNetwork(
                fit: BoxFit.cover,
                placeholder: Assets.defaultPlaceholder,
                image: book.cover,
                // image: NetworkImage(model.img),
              ),
            ),
          ),
          controller.isEdit
              ? Positioned(
                  top: 0,
                  right: 0,
                  child: SizedBox(
                    width: 15,
                    height: 15,
                    child: IconButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () => controller.toggle(book: book),
                      icon: Image(
                          image: controller.selectedItem.contains(book)
                              ? AssetImages.icXz
                              : AssetImages.icXk),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                  ),
                )
              : null,
        ].whereType<Widget>().toList(),
      ),
    );
  }

  Widget _topView() {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 15, right: 15),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 60.w),
            child: Row(
              children: [
                Text(
                  "今日已读",
                  style: TextStyle(color: Colours.text3, fontSize: 14),
                ),
                Text(
                  "200",
                  style: TextStyle(
                      color: Colours.text3,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "分钟",
                  style: TextStyle(color: Colours.text3, fontSize: 14),
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colours.mainLight,
            ),
          ),
          Spacer(),
          SizedBox(
            width: 15,
            height: 15,
            child: IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () => Get.toNamed(Routes.search),
              icon: ImageIcon(AssetImages.icFound),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
          ),
          SizedBox(width: 12),
          SizedBox(
            width: 15,
            height: 15,
            child: IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () => controller.toggleEdit(),
              icon: ImageIcon(AssetImage("assets/images/ic_edit.png")),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }

  Container _bottomView() {
    return Container(
      height: 50,
      padding: EdgeInsets.only(left: 15),
      child: Row(
        children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            child: Row(
              children: [
                Image(
                    image: controller.isSelectedAll
                        ? AssetImages.icXz
                        : AssetImages.icXk),
                SizedBox(width: 10),
                Text(
                  "全选",
                  style: TextStyle(
                      color: Colours.text6,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            onPressed: () {
              controller.toggleAll();
            },
          ),
          Spacer(),
          SizedBox(
            width: 96.w,
            child: CupertinoButton(
              color: Colours.red,
              borderRadius: null,
              padding: EdgeInsets.zero,
              child: Text(
                "删除",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () => controller.delete(),
            ),
          ),
          SizedBox(
            width: 96.w,
            child: CupertinoButton(
              color: Colours.mainMedium,
              borderRadius: null,
              padding: EdgeInsets.zero,
              child: Text(
                "取消",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () => controller.toggleEdit(),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(
          width: 0.5,
          color: Colours.divider,
        ),
        bottom: BorderSide(
          width: 0.5,
          color: Colours.divider,
        ),
      )),
    );
  }
}
