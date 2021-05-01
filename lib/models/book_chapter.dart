import 'package:json_annotation/json_annotation.dart';

part 'book_chapter.g.dart';

@JsonSerializable()
class BookChapter {
  @JsonKey(name: 'chapter_id')
  dynamic chapterId;
  @JsonKey(name: 'chapter_title')
  String chapterTitle;

  BookChapter({this.chapterId, this.chapterTitle});

  factory BookChapter.fromJson(Map<String, dynamic> json) {
    return _$BookChapterFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BookChapterToJson(this);
}
