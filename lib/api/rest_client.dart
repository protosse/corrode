import 'package:corrode/models/item.dart';
import 'package:corrode/models/user.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://hacker-news.firebaseio.com/v0/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('item/{id}.json')
  Future<Item> getItem(@Path() int id);
  @GET('user/{id}.json')
  Future<User> getUser(@Path() String id);
  @GET('maxitem.json')
  Future<int> getMaxItemId();
  @GET('topstories.json')
  Future<List<int>> getTopStoryIds();
  @GET('beststories.json')
  Future<List<int>> getBestStoryIds();
  @GET('newstories.json')
  Future<List<int>> getNewStoryIds();
  @GET('askstories.json')
  Future<List<int>> getAskStoryIds();
  @GET('showstories.json')
  Future<List<int>> getShowStoryIds();
  @GET('jobstories.json')
  Future<List<int>> getJobStoryIds();
}
