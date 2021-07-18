import 'book.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home.g.dart';

enum HomeStyle {
  @JsonValue(2)
  CELL,
  @JsonValue(3)
  COLLECTION,
  @JsonValue(10)
  HOT,
  UNKNOWN,
}

@JsonSerializable()
class Home {
  @JsonKey(name: 'recommend_id')
  int? recommendId;
  @JsonKey(name: 'label')
  String? label;
  @JsonKey(name: 'style', unknownEnumValue: HomeStyle.UNKNOWN)
  HomeStyle? style;
  @JsonKey(name: 'type')
  int? type;
  @JsonKey(name: 'can_more')
  bool? canMore;
  @JsonKey(name: 'can_refresh')
  bool? canRefresh;
  @JsonKey(name: 'total')
  int? total;
  @JsonKey(name: 'list')
  List<Book>? list;

  Home({
    this.recommendId,
    this.label,
    this.style,
    this.type,
    this.canMore,
    this.canRefresh,
    this.total,
    this.list,
  });

  factory Home.fromJson(Map<String, dynamic> json) => _$HomeFromJson(json);

  Map<String, dynamic> toJson() => _$HomeToJson(this);
}
