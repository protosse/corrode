// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) {
  return Book(
    bookId: json['book_id'] as int?,
    name: json['name'] as String?,
    cover: json['cover'] as String?,
    width: json['width'] as int?,
    height: json['height'] as int?,
    author: json['author'] as String?,
    description: json['description'] as String?,
    views: json['views'] as int?,
    totalFavors: dynamicToString(json['total_favors']),
    displayLabel: json['display_label'] as String?,
    tag: (json['tag'] as List<dynamic>?)
        ?.map((e) => BookTag.fromJson(e as Map<String, dynamic>))
        .toList(),
    finished: json['finished'] as String?,
    flag: json['flag'] as String?,
    totalWords: json['total_words'] as String?,
    wordsPrice: json['words_price'] as int?,
    chapterPrice: json['chapter_price'] as int?,
    likeNum: json['like_num'] as String?,
    status: json['status'] as int?,
    totalComment: json['total_comment'] as String?,
    shareNum: json['share_num'] as String?,
    totalChapter: json['total_chapter'] as int?,
    lastChapterTime: json['last_chapter_time'] as String?,
    lastChapter: json['last_chapter'] as String?,
    isVip: json['is_vip'] as int?,
    isBaoyue: json['is_baoyue'] as int?,
    isFinished: json['is_finished'] as int?,
    property:
        (json['property'] as List<dynamic>?)?.map((e) => e as String).toList(),
    hotNum: dynamicToString(json['hot_num']),
    language: json['language'] as String?,
    chapter: json['chapter'] == null
        ? null
        : BookChapter.fromJson(json['chapter'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'book_id': instance.bookId,
      'name': instance.name,
      'cover': instance.cover,
      'width': instance.width,
      'height': instance.height,
      'author': instance.author,
      'description': instance.description,
      'views': instance.views,
      'total_favors': instance.totalFavors,
      'display_label': instance.displayLabel,
      'tag': instance.tag,
      'finished': instance.finished,
      'flag': instance.flag,
      'total_words': instance.totalWords,
      'words_price': instance.wordsPrice,
      'chapter_price': instance.chapterPrice,
      'like_num': instance.likeNum,
      'status': instance.status,
      'total_comment': instance.totalComment,
      'share_num': instance.shareNum,
      'total_chapter': instance.totalChapter,
      'last_chapter_time': instance.lastChapterTime,
      'last_chapter': instance.lastChapter,
      'is_vip': instance.isVip,
      'is_baoyue': instance.isBaoyue,
      'is_finished': instance.isFinished,
      'property': instance.property,
      'hot_num': instance.hotNum,
      'language': instance.language,
      'chapter': instance.chapter,
    };
