import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(defaultValue: 0)
  int articleId;
  @JsonKey(defaultValue: 0)
  int num;
  @JsonKey(defaultValue: "")
  String chapter;
  @JsonKey(defaultValue: "")
  String content;
  @JsonKey(defaultValue: "")
  String src;
  @JsonKey(defaultValue: 0)
  int addTime;

  late List<Map<String, int>> pageOffsets;

  Article(
      {required this.id,
      required this.articleId,
      required this.num,
      required this.chapter,
      required this.content,
      required this.src,
      required this.addTime}) {
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
