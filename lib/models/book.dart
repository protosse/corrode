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
  String img;
  @JsonKey(defaultValue: "")
  String intro;
  @JsonKey(defaultValue: "")
  String src;
  @JsonKey(defaultValue: 0, name: "cat_id")
  int catId;
  @JsonKey(defaultValue: 0)
  int type;
  @JsonKey(defaultValue: 0, name: "add_time")
  int addTime;
  @JsonKey(defaultValue: 0)
  int num;
  @JsonKey(defaultValue: "无", name: "cat_name")
  String catName;

  Book(
      {required this.id,
      required this.title,
      required this.author,
      required this.img,
      required this.intro,
      required this.src,
      required this.catId,
      required this.type,
      required this.addTime,
      required this.num,
      required this.catName});

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);
}
