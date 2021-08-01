import 'package:corrode/models/book.dart';
import 'package:corrode/models/chapter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookReadParam {
  late Book book;
  List<Chapter> chapters = [];
  int index = 0;
}

class BookReadController extends GetxController {
  BookReadParam param;

  BookReadController({required this.param});

  int pageIndex = 0;
  bool isMenuVisible = false;
  bool isLoading = false;
  PageController pageController = PageController(keepPage: false);

  Chapter? preArticle;
  Chapter? currentArticle;
  Chapter? nextArticle;

// Future<Article> fetchArticle() async {
//   if(param.chapters.isNotEmpty) {
//
//   }
// }
}
