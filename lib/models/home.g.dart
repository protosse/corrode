// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Home _$HomeFromJson(Map<String, dynamic> json) {
  return Home(
    recommendId: json['recommend_id'] as int,
    label: json['label'] as String,
    style: _$enumDecodeNullable(_$HomeStyleEnumMap, json['style'],
        unknownValue: HomeStyle.UNKNOWN),
    type: json['type'] as int,
    canMore: json['can_more'] as bool,
    canRefresh: json['can_refresh'] as bool,
    total: json['total'] as int,
    list: (json['list'] as List)
        ?.map(
            (e) => e == null ? null : Book.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HomeToJson(Home instance) => <String, dynamic>{
      'recommend_id': instance.recommendId,
      'label': instance.label,
      'style': _$HomeStyleEnumMap[instance.style],
      'type': instance.type,
      'can_more': instance.canMore,
      'can_refresh': instance.canRefresh,
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

const _$HomeStyleEnumMap = {
  HomeStyle.CELL: 2,
  HomeStyle.COLLECTION: 3,
  HomeStyle.HOT: 10,
  HomeStyle.UNKNOWN: 'UNKNOWN',
};
