import 'package:corrode/theme/colors.dart';
import 'package:corrode/util/util.dart';
import 'package:corrode/models/article.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'battery_view.dart';

class ReaderOverlayer extends StatelessWidget {
  final Article article;
  final int page;
  final double topSafeHeight;

  ReaderOverlayer(
      {required this.article, required this.page, required this.topSafeHeight});

  @override
  Widget build(BuildContext context) {
    var format = DateFormat('HH:mm');
    var time = format.format(DateTime.now());

    return Container(
      padding: EdgeInsets.fromLTRB(
          15, 10 + topSafeHeight, 15, 10 + Screen.bottomSafeHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(article.chapter,
              style: TextStyle(fontSize: 14, color: Colours.golden)),
          Expanded(child: Container()),
          Row(
            children: <Widget>[
              BatteryView(),
              SizedBox(width: 10),
              Text(time, style: TextStyle(fontSize: 11, color: Colours.golden)),
              Expanded(child: Container()),
              Text('第${page + 1}页',
                  style: TextStyle(fontSize: 11, color: Colours.golden)),
            ],
          ),
        ],
      ),
    );
  }
}
