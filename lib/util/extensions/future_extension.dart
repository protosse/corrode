import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import '../util.dart';

extension ToastWhenError<T> on Future<T> {
  Future<T> toastWhenError() {
    return this.toast();
  }

  /// toast错误信息，当success不为空时toast成功的信息
  Future<T> toast({String? error, String? success}) {
    return this.catchError((e) {
      if (error != null) {
        Util.showError(error);
      } else {
        Util.showError(e.toString());
      }
    }).then((value) {
      if (success != null) {
        Util.showSuccess(success);
      }
      return value;
    });
  }

  Future<T> hud() {
    SVProgressHUD.show();
    Util.showHUD();
    return this.whenComplete(() {
      Util.hideHUD();
    });
  }
}
