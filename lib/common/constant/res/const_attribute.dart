import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/common/common.dart';

const kcfextralight = FontWeight.w200;
const kcflight = FontWeight.w300;
const kcfregular = FontWeight.w400;
const kcfmedium = FontWeight.w500;
const kcfsemibold = FontWeight.w600;
const kcfbold = FontWeight.bold;
const kcfextrabold = FontWeight.w800;
const kcfblack = FontWeight.w900;

const kcftitleMediumSize = 40.0;
const kcftitleLargeSize = 50.0;
const kcfbodyMediumSize = 18.0;
const kcfbodyLargeSize = 36.0;

TextStyle kcfStyleDisplayLarge({bool r = false}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? 50.sp : 50, //57,
      fontWeight: kcfbold,
    );

TextStyle kcfStyleDisplaySmall({bool r = false}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? 50.sp : 50, //57,
      fontWeight: kcfbold,
    );
TextStyle kcfStyleHeadlineLarge({bool r = false}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? 50.sp : 50, //57,
      fontWeight: kcfbold,
    );
TextStyle kcfStyleHeadlineMedium({bool r = false}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? 50.sp : 50, //57,
      fontWeight: kcfbold,
    );
TextStyle kcfStyleHeadlineSmall({bool r = false}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? 50.sp : 50, //57,
      fontWeight: kcfbold,
    );
TextStyle kcfStyleTitleLarge({bool r = false}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? 50.sp : 50, //57,
      fontWeight: kcfbold,
    );
TextStyle kcfStyleTitleMedium({bool r = false}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? 50.sp : 50, //57,
      fontWeight: kcfbold,
    );
TextStyle kcfStyleTitleSmall({bool r = false}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? 50.sp : 50, //57,
      fontWeight: kcfbold,
    );
TextStyle kcfStyleLabelLarge({bool r = false}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? 50.sp : 50, //57,
      fontWeight: kcfbold,
    );

TextStyle kcfStyleLabelMedium({bool r = false}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? 50.sp : 50, //57,
      fontWeight: kcfbold,
    );
TextStyle kcfStyleLabelSmall({bool r = false}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? 50.sp : 50, //57,
      fontWeight: kcfbold,
    );
TextStyle kcfStyleBodyLarge({bool r = false}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? 50.sp : 50, //57,
      fontWeight: kcfbold,
    );
TextStyle kcfStyleBodyMedium({bool r = false}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? 50.sp : 50, //57,
      fontWeight: kcfbold,
    );
TextStyle kcfStyleBodySmall({bool r = false}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? 50.sp : 50, //57,
      fontWeight: kcfbold,
    );
const double kcaLargeScreenMinWidth = 1024;
const double kcaMediumScreenMinWidth = 430;

const kcaInset0 = EdgeInsets.zero;

List<BoxShadow> kcaboxShadow1 = [
  BoxShadow(
    offset: const Offset(0, 2),
    blurRadius: 10,
    color: Colors.black.withOpacity(0.1),
  ),
];

List<BoxShadow> kcaboxShadow2 = [
  BoxShadow(
    offset: const Offset(0, 1),
    blurRadius: 4,
    color: Colors.black.withOpacity(0.2),
  ),
];

List<BoxShadow> kcaboxShadow3 = [
  BoxShadow(
    offset: const Offset(0, 3),
    blurRadius: 6,
    color: Colors.black.withOpacity(0.16),
  ),
];

List<BoxShadow> kcaboxShadow4 = [
  BoxShadow(
    offset: const Offset(0, 2),
    blurRadius: 5,
    spreadRadius: 1,
    color: Colors.black.withOpacity(0.15),
  ),
];
List<BoxShadow> kcaboxShadow5 = [
  BoxShadow(
    offset: const Offset(0, 2),
    blurRadius: 5,
    spreadRadius: 1,
    color: Colors.black.withOpacity(0.1),
  ),
];
//ipad
const kcasizeipadpro6thgen12 = Size(1024, 1366);
const kcasizeipadpro6thgen = Size(834, 1194);
const kcasizeipad10thgen = Size(820, 1180);
const kcasizeipadair5thgen = Size(820, 1180);
const kcasizeipad9thgen = Size(810, 1080);
const kcasizeipadpro5thgen12 = Size(1024, 1366);
const kcasizeipadpro5thgen11 = Size(834, 1194);
const kcasizeipadair4thgen11 = Size(820, 1180);

//iphone
const ksizeiphone14plus = Size(428, 926);
const ksizeiphone14promax = Size(430, 932);
const ksizeiphone14pro = Size(393, 852);
const ksizeiphone14 = Size(390, 844);
const ksizeiphonese3rdgen = Size(375, 667);
const ksizeiphone13 = Size(390, 844);
const ksizeiphone13mini = Size(375, 812);
const ksizeiphone13promax = Size(428, 926);
const ksizeiphone12 = Size(390, 844);
const ksizeiphone12mini = Size(375, 812);
const ksizeiphone12promax = Size(428, 926);
const ksizeiphone12pro = Size(390, 844);
const ksizeiphone11promax = Size(414, 896);
const ksizeiphone11pro = Size(375, 812);
const ksizeiphone11 = Size(414, 896);
const ksizeiphonexr = Size(414, 896);
const ksizeiphonexsmax = Size(414, 896);
const ksizeiphonexs = Size(375, 812);
const ksizeiphonex = Size(375, 812);
const ksizeiphone8plus = Size(414, 736);
const ksizeiphone8 = Size(375, 667);
