import 'package:flutter/material.dart';

const kccWhite = Color(0xffffffff);
const kccBlack = Color(0xff000000);
const kccPrimary = Color(0xff272727);
const kccOnPrimary = Color(0xff312F2F);
const kccSecondary = Color(0xff018790);
const kccOnSecondary = Color(0xFFFFFFFF);
const kccTertiary = Color(0xffF7F7F7);
const kccOnTertiary = Color(0x00000000);
const kccGreen1 = Color(0xffD1EEEA);
const kccPurple1 = Color(0xffD1CDE9);
const kccYellow = Color(0xffFADB00);
const kccBlue1 = Color(0xff244F71);
const kccBlue2 = Color(0xff234E6F);
const kccBlue3 = Color(0xff234E70);
const kcctest = Color(0xff234E70);

//grey
const kccgrey1 = Color(0xffA4A4A4);
const kccgrey2 = Color(0xffB1B3B4);
const kccgrey3 = Color(0xff8A8A8A);
const kccgrey4 = Color(0xff808080);
const kccgrey5 = Color(0xffEBEEF0);
const kccgrey6 = Color(0xffF1F1F1);
const kccgrey7 = Color(0xffF4F4F4);
const kccgrey8 = Color(0xff707070);
const kccgrey9 = Color(0xffA7A7A7);
const kccgrey10 = Color(0xffA7A7A7);

//black
const kccBlack1 = Color(0xff343434);
const kccBlack2 = Color(0xffB1B3B4);
const kccBlack3 = Color(0xff020202);
const kccBlack4 = Color(0xff555555);
const kccBlack5 = Color(0xffB1B3B4);
const kccBlack6 = Color(0xff272727);
const kccBlack7 = Color(0xffB1B3B4);

//white
const kccTransparent = Colors.transparent;
const kccWhite1 = Color(0xffFAFAFB);
const kccWhite2 = Color(0xffEBEEF0);
const kccWhite3 = Color(0xffd9d9d9);

const kccBtnLight = Color(0xff923423);
const kccBtnDark = Color(0xff454545);
const kccBtnDisabled = Color(0xFFE0E0E0);

MaterialColor kccPrimarySwatch = createMaterialColor(kccPrimary);
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
