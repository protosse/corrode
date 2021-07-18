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
            selectedItemColor: Colors.blue,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            items: [
              _bottomNavigationBarItem(
                icon: CupertinoIcons.home,
                label: 'Home',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.person,
                label: 'Account',
              ),
            ],
          ),
        );
      },
    );
  }

  _bottomNavigationBarItem({IconData? icon, String? label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
