import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
