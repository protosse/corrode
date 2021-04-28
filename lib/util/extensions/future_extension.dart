import 'package:fluttertoast/fluttertoast.dart';

extension ToastWhenError<T> on Future<T> {
  Future<T> toastWhenError() {
    return this.catchError((error) {
      Fluttertoast.showToast(msg: error.toString());
    });
  }
}
