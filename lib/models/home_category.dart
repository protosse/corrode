import 'package:json_annotation/json_annotation.dart';

part 'home_category.g.dart';

@JsonSerializable()
class HomeCategory {
  int cat_id;
  String cat_name;

  HomeCategory({this.cat_id, this.cat_name});

  factory HomeCategory.fromJson(Map<String, dynamic> json) =>
      _$HomeCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$HomeCategoryToJson(this);
}
