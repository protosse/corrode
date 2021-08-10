import 'dart:convert';

import 'package:corrode/util/util.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  static User? _current;
  static User? share() {
    if (_current == null) {
      String? str = Util.sp.getString(DefaultKey.user);
      if (str != null) {
        _current = User.fromJson(jsonDecode(str));
      }
    }
    return _current;
  }

  @JsonKey(defaultValue: 0)
  int id;

  User({required this.id});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
