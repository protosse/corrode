// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBanner _$HomeBannerFromJson(Map<String, dynamic> json) {
  return HomeBanner(
    image: json['image'] as String?,
    action: json['action'] as int?,
    content: json['content'] as String?,
    color: json['color'] as String?,
    isLogin: json['is_login'] as int?,
  );
}

Map<String, dynamic> _$HomeBannerToJson(HomeBanner instance) =>
    <String, dynamic>{
      'image': instance.image,
      'action': instance.action,
      'content': instance.content,
      'color': instance.color,
      'is_login': instance.isLogin,
    };
