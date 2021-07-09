import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late bool isTabletDevice;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static late double safeAreaHorizontal;
  static late double safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;
  static late bool isLargeScreen;
  static late bool isCustomLargeScreen;
  static late bool isIPadProScreen;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

    safeBlockHorizontal = (screenWidth - safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - safeAreaVertical) / 100;

    isTabletDevice = ((_mediaQueryData.orientation == Orientation.portrait)
                ? screenWidth
                : screenHeight) >
            700
        ? true
        : false;

    // To manage font size
    isLargeScreen = screenWidth > 1024 ? true : false;
    isCustomLargeScreen =
        screenWidth > 539 && screenWidth < 1024 ? true : false;
    isIPadProScreen = screenWidth == 1024 ? true : false;
  }
}

class SizeValues {
  static double k8 = 8.0;
  static double k12 = 12.0;
  static double k20 = 20.0;
}
