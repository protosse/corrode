import 'package:flutter/material.dart';

import '../../../../models/book.dart';
import '../../../../theme/colors.dart';
import '../../../../util/constants/images.dart';
import '../../../../util/extensions/color_extension.dart';

class BookListItem extends StatelessWidget {
  final Book model;

  BookListItem({required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 115,
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: FadeInImage(
              width: 85,
              fit: BoxFit.cover,
              placeholder: Images.placeholder,
              image: Images.placeholder,
              // image: NetworkImage(model.img),
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 15)),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: TextStyle(fontSize: 14, color: Colours.text_dark),
                ),
                Text(
                  model.intro,
                  // maxLines: 3,
                  style: TextStyle(fontSize: 12, color: Colours.text_gray),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget _tags(BuildContext context) {
  //   return Wrap(
  //     spacing: 4,
  //     children: (model. ?? [])
  //         .map((e) => Container(
  //             padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
  //             child: Text(
  //               e.tab ?? "",
  //               style: TextStyle(
  //                 fontSize: 10,
  //                 color: HexColor.fromHex(e.color ?? ""),
  //               ),
  //             ),
  //             decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(4),
  //                 color: Colours.divider)))
  //         .toList(),
  //   );
  // }
}
