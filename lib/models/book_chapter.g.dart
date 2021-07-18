// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookChapter _$BookChapterFromJson(Map<String, dynamic> json) {
  return BookChapter(
    chapterId: dynamicToInt(json['chapter_id']),
    chapterTitle: json['chapter_title'] as String?,
  );
}

Map<String, dynamic> _$BookChapterToJson(BookChapter instance) =>
    <String, dynamic>{
      'chapter_id': instance.chapterId,
      'chapter_title': instance.chapterTitle,
    };
