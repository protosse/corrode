import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home_page.dart';
import '../mine/mine_page.dart';
import 'tab_controller.dart';

class MyTabPage extends StatelessWidget {
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
            unselectedItemColor: Colors.grey,
            unselectedFontSize: 12,
            selectedItemColor: Colors.blue,
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
                icon: Icon(CupertinoIcons.home),
                label: '书城',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.book),
                label: '书架',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person),
                label: '我的',
              ),
            ],
          ),
        );
      },
    );
  }
}
