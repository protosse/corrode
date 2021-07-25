import 'dart:io';

import 'package:dio/dio.dart';

class HeaderInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[HttpHeaders.acceptHeader] = 'application/json';
    options.headers[HttpHeaders.contentTypeHeader] = 'application/json';
    handler.next(options);
  }
}
