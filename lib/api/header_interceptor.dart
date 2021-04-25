import 'dart:io';
import 'package:dio/dio.dart';

class HeaderInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    options.headers[HttpHeaders.acceptHeader] = 'application/json';
    options.headers[HttpHeaders.contentTypeHeader] = 'application/json';
    return options;
  }
}
