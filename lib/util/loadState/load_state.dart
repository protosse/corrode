import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'widgets/empty.dart';
import 'widgets/error_reload.dart';
import 'widgets/loading.dart';

mixin LoadState {
  var isFirstLoad = true;
  var isFirstLoadError = false;

  int page = 1;
  int perPage = 10;

  List dataSource = [];
  bool _pullDown = true;

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

class LoadStateView extends StatelessWidget {
  final LoadState state;
  final Widget child;
  final bool enablePullDown;
  final bool enablePullUp;
  final bool enableEmpty;

  LoadStateView(
      {required this.state,
      required this.child,
      this.enablePullDown = true,
      this.enablePullUp = true,
      this.enableEmpty = true});

  @override
  Widget build(BuildContext context) {
    if (state.isFirstLoad) {
      if (state.isFirstLoadError) {
        return ErrorReload(onTap: () => state.request());
      } else {
        return Loading();
      }
    } else {
      if (enablePullDown || enablePullUp) {
        return SmartRefresher(
          enablePullDown: enablePullDown,
          enablePullUp: enablePullUp,
          controller: state.refreshController,
          onRefresh: () => state.request(),
          onLoading: () => state.request(pullDown: false),
          child:
              enableEmpty && state.dataSource.isEmpty ? EmptyWidget() : child,
        );
      } else {
        return child;
      }
    }
  }
}
