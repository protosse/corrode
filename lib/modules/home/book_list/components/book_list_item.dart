import 'package:flutter/material.dart';

import '../../../../models/book.dart';
import '../../../../theme/colors.dart';
import '../../../../constants/flutter_assets.dart';

class BookListItem extends StatelessWidget {
  final Book model;

  BookListItem({required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      padding: EdgeInsets.only(top: 30, left: 15, right: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: FadeInImage(
              width: 85,
              fit: BoxFit.cover,
              placeholder: AssetImages.defaultPlaceholder,
              image: AssetImages.defaultPlaceholder,
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
                  style: TextStyle(fontSize: 14, color: Colours.text3),
                ),
                Text(
                  "作者：${model.author}",
                  style: TextStyle(fontSize: 12, color: Colours.text9),
                ),
                Text(
                  model.intro,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: Colours.text9),
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
