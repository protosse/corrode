import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String about;
  int created;
  int delay;
  String id;
  int karma;
  List<int> submitted;
  User({
    this.about,
    this.created,
    this.delay,
    this.id,
    this.karma,
  });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
