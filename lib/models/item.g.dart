// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    by: json['by'] as String,
    descendants: json['descendants'] as int,
    id: json['id'] as int,
    kids: (json['kids'] as List)?.map((e) => e as int)?.toList(),
    parent: json['parent'] as int,
    score: json['score'] as int,
    time: json['time'] as int,
    title: json['title'] as String,
    text: json['text'] as String,
    type: json['type'] as String,
    url: json['url'] as String,
    parts: (json['parts'] as List)?.map((e) => e as int)?.toList(),
    poll: json['poll'] as int,
  )..deleted = json['deleted'] as bool;
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'by': instance.by,
      'descendants': instance.descendants,
      'id': instance.id,
      'kids': instance.kids,
      'parent': instance.parent,
      'score': instance.score,
      'time': instance.time,
      'title': instance.title,
      'text': instance.text,
      'deleted': instance.deleted,
      'type': instance.type,
      'url': instance.url,
      'parts': instance.parts,
      'poll': instance.poll,
    };
