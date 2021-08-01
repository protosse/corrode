// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return Article(
    id: json['id'] as int? ?? 0,
    articleId: json['articleId'] as int? ?? 0,
    num: json['num'] as int? ?? 0,
    chapter: json['chapter'] as String? ?? '',
    content: json['content'] as String? ?? '',
    src: json['src'] as String? ?? '',
    addTime: json['addTime'] as int? ?? 0,
  )..pageOffsets = (json['pageOffsets'] as List<dynamic>)
      .map((e) => Map<String, int>.from(e as Map))
      .toList();
}

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'id': instance.id,
      'articleId': instance.articleId,
      'num': instance.num,
      'chapter': instance.chapter,
      'content': instance.content,
      'src': instance.src,
      'addTime': instance.addTime,
      'pageOffsets': instance.pageOffsets,
    };
