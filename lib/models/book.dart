import 'package:corrode/util/model_helper.dart';
import 'package:json_annotation/json_annotation.dart';

import 'book_chapter.dart';
import 'book_tag.dart';

part 'book.g.dart';

@JsonSerializable()
class Book {
  @JsonKey(name: 'book_id')
  int bookId;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'cover')
  String cover;
  @JsonKey(name: 'width')
  int width;
  @JsonKey(name: 'height')
  int height;
  @JsonKey(name: 'author')
  String author;
  @JsonKey(name: 'description')
  String description;
  @JsonKey(name: 'views')
  int views;
  @JsonKey(name: 'total_favors', fromJson: dynamicToString)
  String totalFavors;
  @JsonKey(name: 'display_label')
  String displayLabel;
  @JsonKey(name: 'tag')
  List<BookTag> tag;
  @JsonKey(name: 'finished')
  String finished;
  @JsonKey(name: 'flag')
  String flag;
  @JsonKey(name: 'total_words')
  String totalWords;
  @JsonKey(name: 'words_price')
  int wordsPrice;
  @JsonKey(name: 'chapter_price')
  int chapterPrice;
  @JsonKey(name: 'like_num')
  String likeNum;
  @JsonKey(name: 'status')
  int status;
  @JsonKey(name: 'total_comment')
  String totalComment;
  @JsonKey(name: 'share_num')
  String shareNum;
  @JsonKey(name: 'total_chapter')
  int totalChapter;
  @JsonKey(name: 'last_chapter_time')
  String lastChapterTime;
  @JsonKey(name: 'last_chapter')
  String lastChapter;
  @JsonKey(name: 'is_vip')
  int isVip;
  @JsonKey(name: 'is_baoyue')
  int isBaoyue;
  @JsonKey(name: 'is_finished')
  int isFinished;
  @JsonKey(name: 'property')
  List<String> property;
  @JsonKey(name: 'hot_num', fromJson: dynamicToString)
  String hotNum;
  @JsonKey(name: 'language')
  String language;
  @JsonKey(name: 'chapter')
  BookChapter chapter;

  Book({
    this.bookId,
    this.name,
    this.cover,
    this.width,
    this.height,
    this.author,
    this.description,
    this.views,
    this.totalFavors,
    this.displayLabel,
    this.tag,
    this.finished,
    this.flag,
    this.totalWords,
    this.wordsPrice,
    this.chapterPrice,
    this.likeNum,
    this.status,
    this.totalComment,
    this.shareNum,
    this.totalChapter,
    this.lastChapterTime,
    this.lastChapter,
    this.isVip,
    this.isBaoyue,
    this.isFinished,
    this.property,
    this.hotNum,
    this.language,
    this.chapter,
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);
}
