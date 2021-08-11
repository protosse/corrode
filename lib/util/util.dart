import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';

class Util {
  static late SharedPreferences sp;

  static showHUD() {
    SVProgressHUD.show();
  }

  static hideHUD() {
    SVProgressHUD.dismiss();
  }

  static showError(String error) {
    SVProgressHUD.showError(status: error);
  }

  static showSuccess(String success) {
    SVProgressHUD.showSuccess(status: success);
  }

  static showInfo(String info) {
    SVProgressHUD.showInfo(status: info);
  }
}

class DefaultKey {
  static String user = "currentUser";
}
