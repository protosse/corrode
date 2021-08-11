import 'package:corrode/api/api.dart';
import 'package:corrode/components/TimerCountDownWidget.dart';
import 'package:corrode/util/extensions/color_extension.dart';
import 'package:flutter/material.dart';
import 'login_controller.dart';
import 'package:get/get.dart';
import '../../util/extensions/future_extension.dart';

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
            child: Container(
              color: HexColor.fromHex("#F4F8F7"),
              padding: EdgeInsets.only(top: 10),
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
                            borderRadius: BorderRadius.all(Radius.circular(21)),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextField(
                            controller: controller.phoneController,
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
                            borderRadius: BorderRadius.all(Radius.circular(21)),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: controller.codeController,
                                  style: TextStyle(fontSize: 14),
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hintText: "请输入验证码",
                                    hintStyle: TextStyle(
                                      color: HexColor.fromHex("#426B63")
                                          .withOpacity(0.3),
                                    ),
                                    enabledBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                              _codeButton()
                            ],
                          ),
                        ),
                        SizedBox(height: 90),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 44,
                                child: ElevatedButton(
                                  onPressed: () {
                                    controller.login();
                                  },
                                  child: Text(
                                    "登录",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  style: TextButton.styleFrom(
                                    backgroundColor:
                                        HexColor.fromHex("#03C19B"),
                                    primary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(21),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _codeButton() {
    return Container(
      height: 32,
      child: TimerCountDownWidget(
        builder: (c) {
          return ElevatedButton(
            onPressed: () {
              if (c.countdownTime.value == 0) {
                var phone = controller.phoneController.text;
                if (phone.isNotEmpty) {
                  Api.share
                      .code(phone: phone)
                      .toast(success: "发送成功")
                      .then((value) {
                    c.countdownTime.value = 60;
                    c.startCountdownTimer();
                  });
                }
              }
            },
            child: Obx(() => Text(
                  c.countdownTime > 0 ? '${c.countdownTime}秒后获取' : "获取验证码",
                  style: TextStyle(fontSize: 12),
                )),
            style: TextButton.styleFrom(
              backgroundColor: HexColor.fromHex("#03C19B"),
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(21),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
