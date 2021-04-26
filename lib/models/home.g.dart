// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Home _$HomeFromJson(Map<String, dynamic> json) {
  return Home(
    recommendId: json['recommendId'] as int,
    label: json['label'] as String,
    style: _$enumDecodeNullable(_$HomeListStyleEnumMap, json['style']),
    canMore: json['canMore'] as bool,
    canRefresh: json['canRefresh'] as bool,
    total: json['total'] as String,
    list: (json['list'] as List)
        ?.map((e) =>
            e == null ? null : HomeList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HomeToJson(Home instance) => <String, dynamic>{
      'recommendId': instance.recommendId,
      'label': instance.label,
      'style': _$HomeListStyleEnumMap[instance.style],
      'canMore': instance.canMore,
      'canRefresh': instance.canRefresh,
      'total': instance.total,
      'list': instance.list,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$HomeListStyleEnumMap = {
  HomeListStyle.Banner: 4,
};

HomeList _$HomeListFromJson(Map<String, dynamic> json) {
  return HomeList(
    image: json['image'] as String,
    action: json['action'] as int,
    content: json['content'] as String,
    color: json['color'] as String,
    isLogin: json['isLogin'] as int,
  );
}

Map<String, dynamic> _$HomeListToJson(HomeList instance) => <String, dynamic>{
      'image': instance.image,
      'action': instance.action,
      'content': instance.content,
      'color': instance.color,
      'isLogin': instance.isLogin,
    };
