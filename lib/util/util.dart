import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';

export 'screen.dart';
export 'model_helper.dart';
export 'extensions/future_extension.dart';
export 'extensions/iterable_extension.dart';
export 'extensions/color_extension.dart';

class Util {
  static late SharedPreferences sp;

  static showHUD() {
    SVProgressHUD.show();
  }

  static hideHUD() {
    SVProgressHUD.dismiss();
  }

  static showError(String error) {
    Fluttertoast.showToast(msg: error);
  }

  static showSuccess(String success) {
    Fluttertoast.showToast(msg: success);
  }

  static showInfo(String info) {
    Fluttertoast.showToast(msg: info);
  }
}

class DefaultKey {
  static String user = "currentUser";
  static String loginPhone = "loginPhone";
  static String searchHistory = 'searchHistory';
}

var logger = Logger();
