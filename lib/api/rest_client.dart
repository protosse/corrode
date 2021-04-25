import 'package:corrode/models/item.dart';
import 'package:corrode/models/user.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'rest_client.g.dart';

@RestApi(baseUrl: 'http://47.108.217.123:9999/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
}
