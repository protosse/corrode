// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookCategory _$BookCategoryFromJson(Map<String, dynamic> json) {
  return BookCategory(
    id: json['id'] as int? ?? 0,
    catName: json['cat_name'] as String? ?? '',
  );
}

Map<String, dynamic> _$BookCategoryToJson(BookCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cat_name': instance.catName,
    };
