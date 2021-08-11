import 'package:corrode/api/api.dart';
import 'package:corrode/models/user.dart';
import 'package:corrode/routes/app_routes.dart';
import 'package:flutter/material.dart';
import '../../util/util.dart';
import 'package:get/get.dart';
import '../../util/extensions/future_extension.dart';

class LoginController extends GetxController {
  var phoneController = TextEditingController();
  var codeController = TextEditingController();

  @override
  void onReady() {
    super.onReady();
    phoneController.text = Util.sp.getString(DefaultKey.loginPhone) ?? "";
  }

  login() {
    var phone = phoneController.text;
    var code = codeController.text;
    if (phone.isEmpty) {
      Util.showInfo("请输入手机号");
      return;
    }
    if (code.isEmpty) {
      Util.showInfo("请输入验证码");
      return;
    }

    Api.share
        .login(phone: phone, code: code)
        .toast(success: "登录成功")
        .hud()
        .then((value) {
      Util.sp.setString(DefaultKey.loginPhone, phone);
      User.login(value);
      Get.offAllNamed(Routes.tab);
    });
  }
}
