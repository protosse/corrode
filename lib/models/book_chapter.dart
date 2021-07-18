import 'package:json_annotation/json_annotation.dart';

import '../util/model_helper.dart';

part 'book_chapter.g.dart';

@JsonSerializable()
class BookChapter {
  @JsonKey(name: 'chapter_id', fromJson: dynamicToInt)
  int? chapterId;
  @JsonKey(name: 'chapter_title')
  String? chapterTitle;

  BookChapter({this.chapterId, this.chapterTitle});

  factory BookChapter.fromJson(Map<String, dynamic> json) {
    return _$BookChapterFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BookChapterToJson(this);
}
