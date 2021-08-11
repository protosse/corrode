import 'package:corrode/constants/assets_images.dart';
import 'package:corrode/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home_page.dart';
import '../mine/mine_page.dart';
import 'tab_controller.dart';

class MyTabPage extends GetView<MyTabController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyTabController>(
      builder: (controller) {
        return Scaffold(
          body: IndexedStack(
            index: controller.tabIndex,
            children: [HomePage(), MinePage()],
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colours.grey,
            unselectedFontSize: 12,
            selectedItemColor: Colours.main,
            selectedFontSize: 12,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImages.tabIcBookstore),
                activeIcon: ImageIcon(AssetImages.tabIcBookstoreS),
                label: '书城',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImages.tabIcBookcase),
                activeIcon: ImageIcon(AssetImages.tabIcBookcaseS),
                label: '书架',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImages.tabIcPersonalcenter),
                activeIcon: ImageIcon(AssetImages.tabIcPersonalcenterS),
                label: '我的',
              ),
            ],
          ),
        );
      },
    );
  }
}
