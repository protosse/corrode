import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorReload extends StatelessWidget {
  final String text;
  final Function onTap;

  ErrorReload({this.text = "", @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Woops, something bad happened",
              style: TextStyle(fontSize: 16),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text(
              text,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            CupertinoButton(
              onPressed: onTap,
              child: Text('Reload'),
            )
          ],
        ),
      ),
    );
  }
}
