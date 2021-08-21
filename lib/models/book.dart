import 'package:corrode/util/model_helper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable()
class Book {
  @JsonKey(defaultValue: 0)
  int id;

  @JsonKey(defaultValue: "")
  String title;
  @JsonKey(defaultValue: "")
  String author;
  @JsonKey(defaultValue: "")
  String cover;
  @JsonKey(defaultValue: "")
  String intro;
  @JsonKey(fromJson: dynamicToInt)
  int read;
  @JsonKey(fromJson: dynamicToString)
  String score;
  @JsonKey(defaultValue: 0)
  int num;
  @JsonKey(defaultValue: 0, name: "cat_id")
  int catId;
  @JsonKey(defaultValue: "无", name: "cat_name")
  String catName;

  Book({ 
    required this.id,
    required this.title,
    required this.author,
    required this.cover,
    required this.intro,
    required this.catId,
    required this.read,
    required this.score,
    required this.num,
    required this.catName,
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);
}
