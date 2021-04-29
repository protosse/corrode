import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

mixin RefreshState {
  int page = 1;
  int perPage = 10;

  List dataSource = [];
  bool _pullDown;

  var refreshController = RefreshController(initialRefresh: false);

  request({bool pullDown = true}) {
    _pullDown = pullDown;
    if (pullDown) {
      dataSource.clear();
    }
  }

  configDataSource(List data) {
    if (_pullDown) {
      dataSource = data;
    } else {
      dataSource.addAll(data);
    }
    if (refreshController.isRefresh) {
      refreshController.refreshCompleted();
    }
    if (refreshController.isLoading) {
      if (data.length < perPage) {
        refreshController.loadNoData();
      } else {
        refreshController.loadComplete();
      }
    }
  }

  endRefreshing() {
    if (refreshController.isRefresh) {
      refreshController.refreshCompleted();
    }
    if (refreshController.isLoading) {
      refreshController.loadComplete();
    }
  }
}

class RefreshStateView extends StatelessWidget {
  final RefreshState state;
  final Widget child;
  final bool enablePullDown;
  final bool enablePullUp;

  RefreshStateView(
      {this.state,
      this.child,
      this.enablePullDown = true,
      this.enablePullUp = true});

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: enablePullDown,
      enablePullUp: enablePullUp,
      controller: state.refreshController,
      onRefresh: () => state.request(),
      onLoading: () => state.request(pullDown: false),
      child: child,
    );
  }
}
