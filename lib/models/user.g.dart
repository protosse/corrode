// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    about: json['about'] as String,
    created: json['created'] as int,
    delay: json['delay'] as int,
    id: json['id'] as String,
    karma: json['karma'] as int,
  )..submitted = (json['submitted'] as List)?.map((e) => e as int)?.toList();
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'about': instance.about,
      'created': instance.created,
      'delay': instance.delay,
      'id': instance.id,
      'karma': instance.karma,
      'submitted': instance.submitted,
    };
