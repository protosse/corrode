import 'dart:ffi';
import 'dart:ui' as ui show window;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Screen {
  static double get width {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.size.width;
  }

  static double get height {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.size.height;
  }

  static double get scale {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.devicePixelRatio;
  }

  static double get textScaleFactor {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.textScaleFactor;
  }

  static double get navigationBarHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.padding.top + kToolbarHeight;
  }

  static double get topSafeHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.padding.top;
  }

  static double get bottomSafeHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.padding.bottom;
  }

  static updateStatusBarStyle(SystemUiOverlayStyle style) {
    SystemChrome.setSystemUIOverlayStyle(style);
  }

  /// 仅支持纵屏。
  /// returns the size after adaptation according to the screen width.(unit dp or pt)
  /// 返回根据屏幕宽适配后尺寸（单位 dp or pt）
  /// size 单位 dp or pt
  static double getWidth(double size) {
    return Screen.width == 0.0 ? size : (size * Screen.width / _designW);
  }

  /// 仅支持纵屏。
  /// returns the size after adaptation according to the screen height.(unit dp or pt)
  /// 返回根据屏幕高适配后尺寸（单位 dp or pt）
  /// size unit dp or pt
  static double getHeight(double size) {
    return Screen.height == 0.0 ? size : (size * Screen.height / _designH);
  }
}

extension DoubleExtension on double {
  double get w => Screen.getWidth(this);
  double get h => Screen.getHeight(this);
}

extension IntExtension on int {
  double get w => Screen.getWidth(this.toDouble());
  double get h => Screen.getHeight(this.toDouble());
}

///默认设计稿尺寸（单位 dp or pt）
double _designW = 375.0;
double _designH = 812.0;
