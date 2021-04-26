import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
