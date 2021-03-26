import 'package:corrode/controllers/root_controller.dart';
import 'package:corrode/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(context) {
    Future.delayed(Duration(seconds: 2, milliseconds: 500), () {
      Get.put(RootController());
      Get.offAll(HomePage());
    });

    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          "Welcome",
          style:
              TextStyle(color: Colors.black, decoration: TextDecoration.none),
        ),
      ),
    );
  }
}
