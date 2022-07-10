import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData = MediaQueryData();
  static double screenHeight = 0.0;
  static double screenWidth = 0.0;
  static double defaultSize = 0.0;
  static Orientation orientation = Orientation.portrait;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
    orientation = _mediaQueryData.orientation;
  }
}

MediaQueryData getScreenSize(BuildContext context) {
  return MediaQuery.of(context);
}

double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  return (inputHeight / 812.0) * screenHeight;
}

double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  return (inputWidth / 375.0) * screenWidth;
}

double getScreenPixel(double pixel) {
  return pixel.sp;
}

double getScreenHeight(double height) {
  return height.h;
}

double getScreenWidth(double width) {
  return width.w;
}
