import 'package:corrode/modules/splash/splash_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
        builder: (_) {
          return Container(
            child: Center(
              child: Text("Welcome"),
            ),
          );
        },
      ),
    );
  }
}
