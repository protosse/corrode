// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chapter _$ChapterFromJson(Map<String, dynamic> json) {
  return Chapter(
    id: json['id'] as int? ?? 0,
    articleId: json['articleId'] as int? ?? 0,
    num: json['num'] as int? ?? 0,
    chapter: json['chapter'] as String? ?? '',
    content: json['content'] as String? ?? '',
    src: json['src'] as String? ?? '',
    addTime: json['addTime'] as int? ?? 0,
  );
}

Map<String, dynamic> _$ChapterToJson(Chapter instance) => <String, dynamic>{
      'id': instance.id,
      'articleId': instance.articleId,
      'num': instance.num,
      'chapter': instance.chapter,
      'content': instance.content,
      'src': instance.src,
      'addTime': instance.addTime,
    };
