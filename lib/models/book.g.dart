// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) {
  return Book(
    id: json['id'] as int? ?? 0,
    title: json['title'] as String? ?? '',
    author: json['author'] as String? ?? '',
    cover: json['cover'] as String? ?? '',
    intro: json['intro'] as String? ?? '',
    catId: json['cat_id'] as int? ?? 0,
    read: dynamicToInt(json['read']),
    score: dynamicToString(json['score']),
    num: json['num'] as int? ?? 0,
    catName: json['cat_name'] as String? ?? '无',
  );
}

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'cover': instance.cover,
      'intro': instance.intro,
      'read': instance.read,
      'score': instance.score,
      'num': instance.num,
      'cat_id': instance.catId,
      'cat_name': instance.catName,
    };
