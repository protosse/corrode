import 'package:corrode/models/article.dart';
import 'package:flutter/material.dart';
import 'package:corrode/util/screen.dart';

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
          15, topSafeHeight + 30, 10, Screen.bottomSafeHeight + 30),
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
