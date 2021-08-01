import 'package:json_annotation/json_annotation.dart';

part 'book_category.g.dart';

@JsonSerializable()
class BookCategory {
  @JsonKey(defaultValue: "")
  String name;

  BookCategory({required this.name});

  factory BookCategory.fromJson(Map<String, dynamic> json) =>
      _$BookCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$BookCategoryToJson(this);
}
