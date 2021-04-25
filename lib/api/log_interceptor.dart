import 'dart:convert';

import 'package:dio/dio.dart';

class LogsInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    print("请求url：${options.uri}");
    print('请求头: ' + options.headers.toString());
    if (options.data != null) {
      print('请求参数: ' + options.data.toString());
    }
    return options;
  }

  @override
  onResponse(Response response) async {
    if (response != null) {
      // pretty json print
      // https://gist.github.com/kasperpeulen/d61029fc0bc6cd104602
      String s = JsonEncoder().convert(response.data);
      print('返回参数: ' + s);
    }
    return response;
  }

  @override
  onError(DioError err) async {
    print('请求异常: ' + err.toString());
    print('请求异常信息: ' + err.response?.toString() ?? "");
    return err;
  }
}
