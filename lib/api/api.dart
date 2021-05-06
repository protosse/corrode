import 'package:corrode/models/book.dart';
import 'package:corrode/models/home.dart';
import 'package:corrode/models/home_category.dart';
import 'package:dio/dio.dart';

import 'header_interceptor.dart';
import 'log_interceptor.dart';

class ApiResponse {
  var data;
  int code;

  ApiResponse({this.data, this.code});
}

class ApiError implements Exception {
  String message;
  int code;

  ApiError({this.message, this.code});

  @override
  String toString() {
    return message;
  }
}

class Api {
  static Api share = Api();

  Dio _dio = Dio();

  var prefix = "http://47.108.217.123:9999/";

  Api() {
    _dio.interceptors.add(HeaderInterceptors());
    _dio.interceptors.add(LogsInterceptor());
  }

  Future<List<HomeCategory>> homeCategory() async {
    return await request(url: 'book/category').then((value) {
      List data = value.data;
      return data.map((e) => HomeCategory.fromJson(e)).toList();
    });
  }

  Future<List<Home>> home() async {
    return await request(url: 'book/like').then((value) {
      List data = value.data;
      return data.map((e) => Home.fromJson(e)).toList();
    });
  }

  Future<List<Book>> bookList(
      {int page, int pageSize, int catId, int bookStatus}) async {
    return await request(url: 'book/category-list', params: {
      "page_num": page,
      "page_size": pageSize,
      "cat_id": catId,
      "book_status": bookStatus
    }).then((value) {
      Map<String, dynamic> data = value.data;
      List d = data["list"];
      return d.map((e) => Book.fromJson(e)).toList();
    });
  }

  Future<ApiResponse> request(
      {String url,
      params,
      Map<String, dynamic> queryParameters,
      Options option}) async {
    url = prefix + url;

    if (option == null) {
      option = Options(method: 'post');
    }

    if (params == null) {
      params = {};
    }

    Response response;
    try {
      response = await _dio.request(url,
          data: params, queryParameters: queryParameters, options: option);
    } on DioError catch (e) {
      throw e;
    }
    if (response.data is DioError) {
      throw response.data;
    }

    var object = response.data;
    if (object is Map) {
      var data = object["data"];
      int code = object["code"];
      var message = object["msg"];

      if (code == 0) {
        return ApiResponse(code: code, data: data);
      } else {
        throw ApiError(message: message ?? "", code: code);
      }
    }

    return ApiResponse(code: 0, data: object);
  }
}
