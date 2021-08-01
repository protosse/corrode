// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chapter _$ChapterFromJson(Map<String, dynamic> json) {
  return Chapter(
    id: json['id'] as int? ?? 0,
    bookId: json['articleId'] as int? ?? 0,
    chapter: json['chapter'] as String? ?? '',
  );
}

Map<String, dynamic> _$ChapterToJson(Chapter instance) => <String, dynamic>{
      'id': instance.id,
      'articleId': instance.bookId,
      'chapter': instance.chapter,
    };
