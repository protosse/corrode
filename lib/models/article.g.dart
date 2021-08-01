// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return Article(
    id: json['id'] as int? ?? 0,
    bookId: json['articleId'] as int? ?? 0,
    chapter: json['chapter'] as String? ?? '',
    content: json['content'] as String? ?? '',
    nextArticleId: json['nextArticleId'] as int? ?? 0,
    preArticleId: json['preArticleId'] as int? ?? 0,
  );
}

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'id': instance.id,
      'articleId': instance.bookId,
      'chapter': instance.chapter,
      'content': instance.content,
      'nextArticleId': instance.nextArticleId,
      'preArticleId': instance.preArticleId,
    };
