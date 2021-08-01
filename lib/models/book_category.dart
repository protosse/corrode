import 'package:json_annotation/json_annotation.dart';

part 'book_category.g.dart';

@JsonSerializable()
class BookCategory {
  @JsonKey(defaultValue: 0)
  int id;

  @JsonKey(defaultValue: "", name: "cat_name")
  String catName;

  BookCategory({required this.id, required this.catName});

  factory BookCategory.fromJson(Map<String, dynamic> json) =>
      _$BookCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$BookCategoryToJson(this);

  static BookCategory all() {
    return BookCategory(id: 0, catName: "全部");
  }
}
