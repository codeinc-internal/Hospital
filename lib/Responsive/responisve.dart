import 'package:flutter/material.dart';

class Responsive {
  static double? _screenWidth;
  static double? _screenHeight;
  static double _blockWidth = 0;
  static double _blockHeight = 0;

  static double? get screenWidth => _screenWidth;
  static double? get screenHeight => _screenHeight;
  static double get blockWidth => _blockWidth;
  static double get blockHeight => _blockHeight;

  static void init(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    _screenWidth = mediaQueryData.size.width;
    _screenHeight = mediaQueryData.size.height;
    _blockWidth = _screenWidth! / 100;
    _blockHeight = _screenHeight! / 100;
  }

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1200;
  }
}
