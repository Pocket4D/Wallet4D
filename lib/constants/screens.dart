import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// Screens properties.
/// 屏幕属性
class Screens {
  const Screens._();

  /// Get [MediaQueryData] from [ui.window].
  static MediaQueryData get mediaQuery => MediaQueryData.fromWindow(ui.window);

  /// The number of device pixels for each logical pixel.
  static double get scale => mediaQuery.devicePixelRatio;

  /// The horizontal extent of this size.
  static double get width => mediaQuery.size.width;

  /// The horizontal pixels of this size.
  static int get widthPixels => (width * scale).toInt();

  /// The vertical extent of this size.
  static double get height => mediaQuery.size.height;

  /// The vertical pixels of this size.
  static int get heightPixels => (height * scale).toInt();

  /// Top offset in the [ui.window], usually is the notch size.
  static double get topSafeHeight => mediaQuery.padding.top;

  /// Top offset in pixels.
  static int get topSafeHeightPixels => (topSafeHeight * scale).toInt();

  /// Bottom offset in the [ui.window]. Usually the size of full screen's safe
  /// area's bottom height.
  static double get bottomSafeHeight => mediaQuery.padding.bottom;

  /// Bottom offset in pixels.
  static int get bottomSafeHeightPixels => (bottomSafeHeight * scale).toInt();

  /// Height exclude top and bottom safe height.
  static double get safeHeight => height - topSafeHeight - bottomSafeHeight;

  /// Method to update status bar's style.
  static void updateStatusBarStyle(SystemUiOverlayStyle style) {
    SystemChrome.setSystemUIOverlayStyle(style);
  }

  /// Scale factor for the text.
  static double get textScaleFactor => mediaQuery.textScaleFactor;

  /// Return a fixed font size according to text scale factor.
  static double fixedFontSize(double fontSize) => fontSize / textScaleFactor;
}
