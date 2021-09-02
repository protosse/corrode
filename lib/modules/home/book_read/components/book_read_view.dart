import 'package:flutter/material.dart';

import '../../../../models/article.dart';
import '../../../../util/screen.dart';
import '../book_read_utils.dart';
import 'book_read_overlayer.dart';

class BookReaderView extends StatelessWidget {
  final Article article;
  final int page;
  final double topSafeHeight;

  BookReaderView(
      {required this.article, required this.page, required this.topSafeHeight});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ReaderOverlayer(
            article: article, page: page, topSafeHeight: topSafeHeight),
        buildContent(article, page),
      ],
    );
  }

  buildContent(Article article, int page) {
    var content = article.stringAtPageIndex(page);

    if (content.startsWith('\n')) {
      content = content.substring(1);
    }
    return Container(
      color: Colors.transparent,
      margin: EdgeInsets.fromLTRB(
          15,
          topSafeHeight + BookReadUtils.share.topOffset,
          10,
          Screen.bottomSafeHeight + BookReadUtils.share.bottomOffset),
      child: Text.rich(
        TextSpan(children: [
          TextSpan(
              text: content,
              style: TextStyle(fontSize: 20 / Screen.textScaleFactor))
        ]),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
