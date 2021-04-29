import 'package:corrode/util/loadState/refresh_state.dart';
import 'package:flutter/material.dart';
import 'book_list_controller.dart';
import 'package:get/get.dart';

class BookListPage extends StatelessWidget {
  final String tag;
  BookListPage({@required this.tag});

  @override
  Widget build(Object context) {
    return GetBuilder<BookListController>(
        tag: tag,
        builder: (controller) {
          return Scaffold(
            body: RefreshStateView(
              state: controller,
              child: ListView.builder(
                  itemCount: controller.dataSource.length,
                  itemBuilder: (_, index) {
                    var model = controller.dataSource[index];
                    return Container(
                      child: Text(model.name),
                    );
                  }),
            ),
          );
        });
  }
}
