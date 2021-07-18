import 'package:json_annotation/json_annotation.dart';

part 'home_banner.g.dart';

@JsonSerializable()
class HomeBanner {
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'action')
  int? action;
  @JsonKey(name: 'content')
  String? content;
  @JsonKey(name: 'color')
  String? color;
  @JsonKey(name: 'is_login')
  int? isLogin;

  HomeBanner({
    this.image,
    this.action,
    this.content,
    this.color,
    this.isLogin,
  });

  factory HomeBanner.fromJson(Map<String, dynamic> json) =>
      _$HomeBannerFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBannerToJson(this);
}
