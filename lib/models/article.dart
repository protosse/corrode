import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(defaultValue: 0, name: "articleId")
  int bookId;
  @JsonKey(defaultValue: "")
  String chapter;
  @JsonKey(defaultValue: "")
  String content;
  @JsonKey(defaultValue: 0)
  int nextArticleId;
  @JsonKey(defaultValue: 0)
  int preArticleId;

  @JsonKey(ignore: true)
  late int index;

  @JsonKey(ignore: true)
  late List<Map<String, int>> pageOffsets;

  Article({
    required this.id,
    required this.bookId,
    required this.chapter,
    required this.content,
    required this.nextArticleId,
    required this.preArticleId,
  }) {
    content = content.replaceAll('<br/>\r\n', '\n');
  }

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);

  String stringAtPageIndex(int index) {
    var offset = pageOffsets[index];
    return this.content.substring(offset['start'] ?? 0, offset['end']);
  }

  int get pageCount {
    return pageOffsets.length;
  }
}
