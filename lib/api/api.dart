import 'package:corrode/api/rest_client.dart';
import 'package:dio/dio.dart';

import 'header_interceptor.dart';
import 'log_interceptor.dart';

class Api {
  Dio _dio;
  RestClient client;

  static Api share = Api();

  Api() {
    _dio = Dio();
    _dio.interceptors.add(HeaderInterceptors());
    _dio.interceptors.add(LogsInterceptor());
    client = RestClient(_dio);
  }
}
