import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  String by;
  int descendants;
  int id;
  List<int> kids;
  int parent;
  int score;
  int time;
  String title;
  String text;
  bool deleted;
  String type;
  String url;
  List<int> parts;
  int poll;

  Item({
    this.by,
    this.descendants,
    this.id,
    this.kids,
    this.parent,
    this.score,
    this.time,
    this.title,
    this.text,
    this.type,
    this.url,
    this.parts,
    this.poll,
  });
  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
