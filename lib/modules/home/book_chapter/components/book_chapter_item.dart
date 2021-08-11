import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../models/chapter.dart';
import '../../../../theme/colors.dart';

class BookChapterItem extends StatelessWidget {
  final Chapter model;

  BookChapterItem({required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Text(
        model.chapter,
        style: TextStyle(fontSize: 14, color: Colours.text3),
      ),
    );
  }
}
