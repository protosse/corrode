import 'package:flutter/material.dart';

import 'widgets/error_reload.dart';
import 'widgets/loading.dart';

mixin LoadState {
  var isFirstLoad = true;
  var isFirstLoadError = false;

  request();
}

class LoadStateView extends StatelessWidget {
  final LoadState state;
  final Widget child;

  LoadStateView({this.state, this.child});

  @override
  Widget build(BuildContext context) {
    if (state.isFirstLoad) {
      if (state.isFirstLoadError) {
        return ErrorReload(onTap: () => state.request());
      } else {
        return Loading();
      }
    } else {
      return child;
    }
  }
}
