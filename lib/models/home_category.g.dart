// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeCategory _$HomeCategoryFromJson(Map<String, dynamic> json) {
  return HomeCategory(
    catId: json['cat_id'] as int?,
    catName: json['cat_name'] as String?,
  );
}

Map<String, dynamic> _$HomeCategoryToJson(HomeCategory instance) =>
    <String, dynamic>{
      'cat_id': instance.catId,
      'cat_name': instance.catName,
    };
