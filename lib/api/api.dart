import 'package:corrode/api/rest_client.dart';
import 'package:dio/dio.dart';

class Api {
  Dio _dioClient;
  RestClient client;

  Api() {
    _dioClient = Dio();
    client = RestClient(_dioClient);
  }
}
