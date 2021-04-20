import 'package:flutter/material.dart';

ThemeData get appThemeData => ThemeData(
    primaryColor: Colors.white,
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(bodyText2: TextStyle(fontSize: 14)));

AppBarTheme get appBarTheme => AppBarTheme();
