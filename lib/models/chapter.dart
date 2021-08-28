import 'package:json_annotation/json_annotation.dart';

part 'chapter.g.dart';

@JsonSerializable()
class Chapter {
  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(defaultValue: 0, name: "articleId")
  int bookId;
  @JsonKey(defaultValue: "")
  String chapter;
  @JsonKey(ignore: true)
  late int index;

  Chapter({
    required this.id,
    required this.bookId,
    required this.chapter,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterToJson(this);
}
