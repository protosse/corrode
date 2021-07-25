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
    img: json['img'] as String? ?? '',
    intro: json['intro'] as String? ?? '',
    src: json['src'] as String? ?? '',
    catId: json['cat_id'] as int? ?? 0,
    type: json['type'] as int? ?? 0,
    addTime: json['add_time'] as int? ?? 0,
    num: json['num'] as int? ?? 0,
    catName: json['cat_name'] as String? ?? '无',
  );
}

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'img': instance.img,
      'intro': instance.intro,
      'src': instance.src,
      'cat_id': instance.catId,
      'type': instance.type,
      'add_time': instance.addTime,
      'num': instance.num,
      'cat_name': instance.catName,
    };
