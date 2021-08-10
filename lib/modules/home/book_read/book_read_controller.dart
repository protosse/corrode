import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../api/api.dart';
import '../../../models/article.dart';
import '../../../models/book.dart';
import '../../../models/chapter.dart';
import '../../../util/extensions/future_extension.dart';
import '../../../util/screen.dart';
import 'book_read_utils.dart';

class BookReadParam {
  late Book book;

  // chapterId就是后面的articleId
  late int chapterId;
}

class BookReadController extends FullLifeCycleController {
  BookReadParam param;

  BookReadController({required this.param});

  List<Chapter> chapters = [];

  int pageIndex = 0;
  bool isMenuVisible = false;
  bool isLoading = false;
  PageController pageController = PageController(keepPage: false);

  Article? preArticle;
  Article? currentArticle;
  Article? nextArticle;

  double topSafeHeight = 0;

  bool isFirstIn = true;

  int get itemCount {
    return (preArticle?.pageCount ?? 0) +
        (currentArticle?.pageCount ?? 0) +
        (nextArticle?.pageCount ?? 0);
  }

  @override
  void onReady() {
    super.onReady();
    pageController.addListener(onScroll);

    setup();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  setup() async {
    pageController.addListener(onScroll);
    await SystemChrome.setEnabledSystemUIOverlays([]);
    await Future.delayed(const Duration(milliseconds: 100), () {});
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    topSafeHeight = Screen.topSafeHeight;

    await fetchChapters();
    await resetContent(param.chapterId);
  }

  fetchChapters() async {
    var id = param.book.id;
    chapters = await Api.share.chapterList(id: id).toastWhenError();
  }

  resetContent(int articleId) async {
    currentArticle = await fetchArticle(articleId);
    if (currentArticle == null) {
      return;
    }
    if (currentArticle!.preArticleId > 0) {
      preArticle = await fetchArticle(currentArticle!.preArticleId);
    } else {
      preArticle = null;
    }
    if (currentArticle!.nextArticleId > 0) {
      nextArticle = await fetchArticle(currentArticle!.nextArticleId);
    } else {
      nextArticle = null;
    }

    pageIndex = 0;
    if (!isFirstIn) {
      pageController.jumpToPage(
          (preArticle != null ? preArticle!.pageCount : 0) + pageIndex);
      isFirstIn = false;
    }

    update();
  }

  Future<Article> fetchArticle(int chapterId) async {
    var index = chapters.indexWhere((element) => element.id == chapterId);
    if (index == -1) {
      throw FlutterError("无法找到章节");
    }
    Chapter chapter = chapters[index];
    Article article = await Api.share.article(id: chapterId);
    article.bookId = chapter.bookId;
    article.chapter = chapter.chapter;
    if (index + 1 <= chapters.length - 1) {
      article.nextArticleId = chapters[index + 1].id;
    } else {
      article.nextArticleId = 0;
    }

    if (index - 1 > 0 && index - 1 <= chapters.length - 1) {
      article.preArticleId = chapters[index - 1].id;
    } else {
      article.preArticleId = 0;
    }

    var contentHeight = Screen.height -
        topSafeHeight -
        BookReadUtils.share.topOffset -
        Screen.bottomSafeHeight -
        BookReadUtils.share.bottomOffset -
        20;
    var contentWidth = Screen.width - 15 - 10;
    article.pageOffsets = BookReadUtils.getPageOffsets(
        article.content, contentHeight, contentWidth, 20);
    return Future.value(article);
  }

  fetchNextArticle() async {
    if (currentArticle == null ||
        nextArticle != null ||
        isLoading ||
        currentArticle!.nextArticleId == 0) {
      return;
    }
    nextArticle = await fetchArticle(currentArticle!.nextArticleId);
    update();
  }

  fetchPreviousArticle() async {
    if (currentArticle == null ||
        preArticle != null ||
        isLoading ||
        currentArticle!.preArticleId == 0) {
      return;
    }
    //TODO: isLoading
    preArticle = await fetchArticle(currentArticle!.preArticleId);
    update();
  }

  onScroll() {
    if (currentArticle == null) {
      return;
    }
    var page = pageController.offset / Screen.width;

    var nextArticlePage =
        currentArticle!.pageCount + (preArticle?.pageCount ?? 0);
    if (page >= nextArticlePage) {
      print('到达下个章节了');

      preArticle = currentArticle;
      currentArticle = nextArticle;
      nextArticle = null;
      pageIndex = 0;
      pageController.jumpToPage(preArticle!.pageCount);
      fetchNextArticle();
    }

    if (preArticle != null && page <= preArticle!.pageCount - 1) {
      print('到达上个章节了');

      nextArticle = currentArticle;
      currentArticle = preArticle;
      preArticle = null;
      pageIndex = currentArticle!.pageCount - 1;
      pageController.jumpToPage(currentArticle!.pageCount - 1);
      fetchPreviousArticle();
    }
  }

  onPageChanged(int index) {
    if (currentArticle == null) {
      return;
    }
    var page = index - (preArticle?.pageCount ?? 0);
    if (page < currentArticle!.pageCount && page >= 0) {
      pageIndex = page;
    }
  }
}
