import 'package:corrode/util/extensions/color_extension.dart';
import 'package:flutter/material.dart';
import 'login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(Object context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("登录"),
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 10,
                  color: HexColor.fromHex("#F4F8F7"),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      )),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 40, right: 40, top: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, bottom: 6),
                            child: Text(
                              "手机号",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: HexColor.fromHex("#3E5752"),
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: HexColor.fromHex("#EFF5F4"),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(21)),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextField(
                              style: TextStyle(fontSize: 14),
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  hintText: "请输入手机号",
                                  hintStyle: TextStyle(
                                    color: HexColor.fromHex("#426B63")
                                        .withOpacity(0.3),
                                  ),
                                  enabledBorder: InputBorder.none),
                            ),
                          ),
                          SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, bottom: 6),
                            child: Text(
                              "验证码",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: HexColor.fromHex("#3E5752"),
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: HexColor.fromHex("#EFF5F4"),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(21)),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(fontSize: 14),
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                        hintText: "请输入验证码",
                                        hintStyle: TextStyle(
                                          color: HexColor.fromHex("#426B63")
                                              .withOpacity(0.3),
                                        ),
                                        enabledBorder: InputBorder.none),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
