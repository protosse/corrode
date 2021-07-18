import 'package:json_annotation/json_annotation.dart';

part 'book_tag.g.dart';

@JsonSerializable()
class BookTag {
  @JsonKey(name: 'tab')
  String? tab;
  @JsonKey(name: 'color')
  String? color;

  BookTag({this.tab, this.color});

  factory BookTag.fromJson(Map<String, dynamic> json) =>
      _$BookTagFromJson(json);

  Map<String, dynamic> toJson() => _$BookTagToJson(this);
}
