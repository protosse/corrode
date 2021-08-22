import 'package:corrode/theme/colors.dart';
import 'package:flutter/material.dart';

ThemeData get appThemeData => ThemeData.light().copyWith(
      colorScheme: ThemeData.light().colorScheme.copyWith(
            primary: Colours.main,
            secondary: Colours.main,
          ),
      primaryColor: Colours.main,
      accentColor: Colours.main,
      highlightColor: Colours.main,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: ThemeData.light().appBarTheme.copyWith(
            elevation: 0,
            centerTitle: true,
          ),
      textSelectionTheme: ThemeData.light().textSelectionTheme.copyWith(
            cursorColor: Colours.main,
          ),
    );
