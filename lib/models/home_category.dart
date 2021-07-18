import 'package:json_annotation/json_annotation.dart';

part 'home_category.g.dart';

@JsonSerializable()
class HomeCategory {
  @JsonKey(name: 'cat_id')
  int? catId;
  @JsonKey(name: 'cat_name')
  String? catName;

  HomeCategory({this.catId, this.catName});

  factory HomeCategory.fromJson(Map<String, dynamic> json) =>
      _$HomeCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$HomeCategoryToJson(this);
}
