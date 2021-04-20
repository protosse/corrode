import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum StoryType { top, new_, jobs, show, ask, best }

class Tabs {
  String name;
  StoryType type;
  Tabs(this.name, this.type);
}

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  final tabs = [
    Tabs("Top", StoryType.top),
    Tabs("New", StoryType.new_),
    Tabs("Job", StoryType.jobs),
    Tabs("Show", StoryType.show),
    Tabs("Ask", StoryType.ask),
    Tabs("Best", StoryType.best),
  ];

  TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
