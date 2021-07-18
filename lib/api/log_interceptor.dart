import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LogsInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint("请求url：${options.uri}");
    debugPrint('请求头: ' + options.headers.toString());
    if (options.data != null) {
      debugPrint('请求参数: ' + options.data.toString());
    }
    handler.next(options);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) async {
    String s = JsonEncoder().convert(response.data);
    debugPrint('返回参数: ' + s);
    handler.next(response);
  }

  @override
  onError(DioError err, ErrorInterceptorHandler handler) async {
    debugPrint('请求异常: ' + err.toString());
    debugPrint('请求异常信息: ' + err.response.toString());
    handler.next(err);
  }
}
