import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

mixin RefreshState<T> {
  int page = 1;
  int perPage = 10;
  List<T> _dataSource = [];

  var refreshController = RefreshController(initialRefresh: false);

  request({bool pullDown = true});

  List<T> get dataSource => _dataSource;
  set dataSource(List<T> data) {
    _dataSource = data;
    if (refreshController.isRefresh) {
      refreshController.refreshCompleted();
    } else if (refreshController.isLoading) {
      if (data.length < perPage) {
        refreshController.loadNoData();
      } else {
        refreshController.loadComplete();
      }
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
      this.enablePullUp = false});

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
