import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: ElevatedButton(
              child: Text("登录"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xff10cc66)),
                  foregroundColor: MaterialStateProperty.all(Colors.white)),
              onPressed: () {
                Fluttertoast.showToast(msg: "错了");
              },
            ),
          ),
        ),
      ),
    );
  }
}
