import 'package:json_annotation/json_annotation.dart';
part 'home.g.dart';

enum HomeListStyle {
  @JsonValue(4)
  Banner
}

@JsonSerializable()
class Home {
  int recommendId;
  String label;
  HomeListStyle style;
  bool canMore;
  bool canRefresh;
  String total;
  List<HomeList> list;

  Home({
    this.recommendId,
    this.label,
    this.style,
    this.canMore,
    this.canRefresh,
    this.total,
    this.list,
  });

  factory Home.fromJson(Map<String, dynamic> json) => _$HomeFromJson(json);
  Map<String, dynamic> toJson() => _$HomeToJson(this);
}

@JsonSerializable()
class HomeList {
  String image;
  int action;
  String content;
  String color;
  int isLogin;

  HomeList({
    this.image,
    this.action,
    this.content,
    this.color,
    this.isLogin,
  });

  factory HomeList.fromJson(Map<String, dynamic> json) =>
      _$HomeListFromJson(json);
  Map<String, dynamic> toJson() => _$HomeListToJson(this);
}
