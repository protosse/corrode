import 'package:corrode/models/article.dart';
import 'package:corrode/models/user.dart';
import 'package:dio/dio.dart';

import '../models/book.dart';
import '../models/book_category.dart';
import '../models/chapter.dart';
import 'header_interceptor.dart';
import 'log_interceptor.dart';

class ApiResponse {
  var data;
  int code;

  ApiResponse({this.data, required this.code});
}

class ApiError implements Exception {
  String? message;
  int code;

  ApiError({this.message, required this.code});

  @override
  String toString() {
    var m = message ?? "";
    return "$code: $m";
  }
}

class Api {
  static Api share = Api();

  Dio _dio = Dio();

  var prefix = "http://xiaoshuo.muniao.org/api/";

  Api() {
    _dio.interceptors.add(HeaderInterceptors());
    _dio.interceptors.add(LogsInterceptor());
  }

  // 小说列表
  Future<List<Book>> bookList(
      {required int page,
      required int perPage,
      int? catId,
      String? title}) async {
    Map<String, dynamic> params = {
      "page": page,
      "limit": perPage,
    };
    if (catId != null && catId != 0) {
      params["cat_id"] = catId;
    }

    if (title != null) {
      params["title"] = title;
    }
    return await request(url: 'article/index', params: params).then((value) {
      if (value.data is List) {
        List d = value.data;
        return d.map((e) => Book.fromJson(e)).toList();
      } else {
        return [];
      }
    });
  }

  // 章节列表
  Future<List<Chapter>> chapterList({required int id}) async {
    return await request(url: 'article/getChapter', params: {
      "article_id": id,
    }).then((value) {
      if (value.data is List) {
        List d = value.data;
        return d.map((e) => Chapter.fromJson(e)).toList();
      } else {
        return [];
      }
    });
  }

  // 分类列表
  Future<List<BookCategory>> categoryList() async {
    return await request(url: 'article/getCategory').then((value) {
      if (value.data is List) {
        List d = value.data;
        return d.map((e) => BookCategory.fromJson(e)).toList();
      } else {
        return [];
      }
    });
  }

  // 章节内容
  Future<Article> article({required int id}) async {
    return await request(url: 'article/getChapterContent', params: {"id": id})
        .then((value) {
      return Article.fromJson(value.data);
    });
  }

  // 发送验证码
  Future<ApiResponse> code({required String phone}) async {
    return await request(url: 'auth/sendSms', params: {"mobile": phone});
  }

  // 登录
  Future<User> login({required String phone, required String code}) async {
    return await request(
        url: 'auth/mobileLogin',
        params: {"mobile": phone, "code": code}).then((value) {
      return User.fromJson(value.data);
    });
  }

  Future<ApiResponse> request(
      {required String url,
      params,
      Map<String, dynamic>? queryParameters,
      Options? option}) async {
    url = prefix + url;

    if (option == null) {
      option = Options(method: 'post');
    }

    if (params == null) {
      params = {};
    }

    var user = User.share();
    if (user != null) {
      params["access_token"] = user.accessToken;
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

      if (code == 200) {
        return ApiResponse(code: code, data: data);
      } else {
        throw ApiError(message: message ?? "", code: code);
      }
    }

    return ApiResponse(code: 0, data: object);
  }
}
