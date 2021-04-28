// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Home _$HomeFromJson(Map<String, dynamic> json) {
  return Home(
    recommendId: json['recommend_id'] as int,
    label: json['label'] as String,
    style: json['style'] as int,
    type: json['type'] as int,
    canMore: json['can_more'] as bool,
    canRefresh: json['can_refresh'] as bool,
    total: json['total'] as int,
    list: json['list'] as List,
  );
}

Map<String, dynamic> _$HomeToJson(Home instance) => <String, dynamic>{
      'recommend_id': instance.recommendId,
      'label': instance.label,
      'style': instance.style,
      'type': instance.type,
      'can_more': instance.canMore,
      'can_refresh': instance.canRefresh,
      'total': instance.total,
      'list': instance.list,
    };
