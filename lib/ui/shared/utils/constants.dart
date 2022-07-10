import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import 'size_config.dart';

const kPrimaryColor = MaterialColor(
  0xFF04540f,
  <int, Color>{
    50: Color(0xFF04540f),
    100: Color(0xFF04540f),
    200: Color(0xFF04540f),
    300: Color(0xFF04540f),
    400: Color(0xFF04540f),
    500: Color(0xFF04540f),
    600: Color(0xFF04540f),
    700: Color(0xFF04540f),
    800: Color(0xFF04540f),
    900: Color(0xFF04540f),
  },
);
const kPrimaryLightColor = Color(0xffcbe6c9);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Colors.green, Colors.lightGreen],
);
const kSecondaryColor = Colors.greenAccent;
const kTextColor = Color(0xff5c5c5c);
const kLightGray = Color(0xfff5f5f5);
const kDangerColor = Color(0xfff8d7d9);
double kScreenPadding = 10.sp;

const kAnimationDuration = Duration(milliseconds: 200);

var money = NumberFormat("#,##0.00", "en_US");

var kPanelBorderRadius = const RoundedRectangleBorder(
  borderRadius: BorderRadius.vertical(
    top: Radius.circular(10.0),
  ),
);

var kCardDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.1),
      offset: const Offset(0, 3),
      blurRadius: 15,
    )
  ],
);

List<BoxShadow> kCardShadow = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 1,
    blurRadius: 2,
    offset: const Offset(0, 2), // changes position of shadow
  ),
];

final inputDigitBoxDecoration = InputDecoration(
  counterText: "",
  contentPadding: EdgeInsets.symmetric(
    vertical: getProportionateScreenHeight(0),
    horizontal: getProportionateScreenWidth(5.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(color: kPrimaryColor),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(color: kPrimaryColor),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(color: kPrimaryColor),
  ),
);

final FilteringTextInputFormatter kUsernameFormatter = FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9-_@.]'));
final FilteringTextInputFormatter kDenySpacingFormatter = FilteringTextInputFormatter.deny(RegExp(r' +'));
