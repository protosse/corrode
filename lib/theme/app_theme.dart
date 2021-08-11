import 'package:corrode/theme/colors.dart';
import 'package:flutter/material.dart';

ThemeData get appThemeData => ThemeData.light().copyWith(
      // primarySwatch: white,
      primaryColor: Colours.main,
      accentColor: Colours.main,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: appBarTheme,
    );

AppBarTheme get appBarTheme => AppBarTheme(
      elevation: 0,
    );
