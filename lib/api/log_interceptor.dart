import 'dart:convert';

import 'package:corrode/util/util.dart';
import 'package:dio/dio.dart';

class LogsInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    logger.d("请求url：${options.uri}");
    logger.d('请求头: ' + options.headers.toString());
    if (options.data != null) {
      logger.d('请求参数: ' + options.data.toString());
    }
    handler.next(options);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) async {
    String s = JsonEncoder().convert(response.data);
    logger.d('返回参数: ' + s);
    handler.next(response);
  }

  @override
  onError(DioError err, ErrorInterceptorHandler handler) async {
    logger.d('请求异常: ' + err.toString());
    logger.d('请求异常信息: ' + err.response.toString());
    handler.next(err);
  }
}
