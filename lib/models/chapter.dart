import 'package:json_annotation/json_annotation.dart';

part 'chapter.g.dart';

@JsonSerializable()
class Chapter {
  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(defaultValue: 0, name: "articleId")
  int bookId;
  @JsonKey(defaultValue: 0)
  int num;
  @JsonKey(defaultValue: "")
  String chapter;
  @JsonKey(defaultValue: "")
  String content;
  @JsonKey(defaultValue: "")
  String src;
  @JsonKey(defaultValue: 0)
  int addTime;

  Chapter(
      {required this.id,
      required this.bookId,
      required this.num,
      required this.chapter,
      required this.content,
      required this.src,
      required this.addTime});

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterToJson(this);
}
