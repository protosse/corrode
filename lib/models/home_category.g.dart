// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeCategory _$HomeCategoryFromJson(Map<String, dynamic> json) {
  return HomeCategory(
    cat_id: json['cat_id'] as int,
    cat_name: json['cat_name'] as String,
  );
}

Map<String, dynamic> _$HomeCategoryToJson(HomeCategory instance) =>
    <String, dynamic>{
      'cat_id': instance.cat_id,
      'cat_name': instance.cat_name,
    };
