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
    catId: json['catId'] as int? ?? 0,
    type: json['type'] as int? ?? 0,
    addTime: json['addTime'] as int? ?? 0,
    num: json['num'] as int? ?? 0,
    catName: json['catName'] as String? ?? '',
  );
}

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'img': instance.img,
      'intro': instance.intro,
      'src': instance.src,
      'catId': instance.catId,
      'type': instance.type,
      'addTime': instance.addTime,
      'num': instance.num,
      'catName': instance.catName,
    };
