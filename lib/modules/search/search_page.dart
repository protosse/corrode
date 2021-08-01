import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'search_controller.dart';

class SearchPage extends GetView<SearchController> {
  @override
  Widget build(Object context) {
    return GetBuilder<SearchController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(),
          body: Container(),
        );
      },
    );
  }
}
