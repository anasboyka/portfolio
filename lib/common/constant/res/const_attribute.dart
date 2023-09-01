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

// const kcftitleMediumSize = 40.0;
// const kcftitleLargeSize = 50.0;
// const kcfbodyMediumSize = 18.0;
// const kcfbodyLargeSize = 36.0;

const double kcfLDisplayLargeSize = 50; //57
const double kcfLDisplayMediumSize = 40; //45
const double kcfLDisplaySmallSize = 36;

const double kcfLHeadlineLargeSize = 32;
const double kcfLHeadlineMediumSize = 28;
const double kcfLHeadlineSmallSize = 24;

const double kcfLTitleLargeSize = 22;
const double kcfLTitleMediumSize = 20; //16
const double kcfLTitleSmallSize = 18; //14

const double kcfLLabelLargeSize = 14;
const double kcfLLabelMediumize = 12;
const double kcfLLabelSmallSize = 11;

const double kcfLBodyLargeSize = 24; //16
const double kcfLBodyMediumize = 20; //14
const double kcfLBodySmallSize = 18; //12

const double kcfSTitleMediumSize = 16;
const double kcfSTitleSmallSize = 14;

const double kcfSBodyLargeSize = 16;
const double kcfSBodyMediumize = 14;
const double kcfSBodySmallSize = 12;

TextStyle kcfLDisplayLarge({bool r = true}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? kcfLDisplayLargeSize.sp : kcfLDisplayLargeSize, //50
      fontWeight: kcfregular,
    );

TextStyle kcfLDisplayMedium({bool r = true}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? kcfLDisplayMediumSize.sp : kcfLDisplayMediumSize, //40
      fontWeight: kcfregular,
    );
TextStyle kcfLDisplaySmall({bool r = true}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? kcfLDisplaySmallSize.sp : kcfLDisplaySmallSize, //36
      fontWeight: kcfregular,
    );

TextStyle kcfLHeadlineLarge({bool r = true}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? kcfLHeadlineLargeSize.sp : kcfLHeadlineLargeSize, //32
      fontWeight: kcfregular,
    );
TextStyle kcfLHeadlineMedium({bool r = true}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? kcfLHeadlineMediumSize.sp : kcfLHeadlineMediumSize, //28
      fontWeight: kcfregular,
    );
TextStyle kcfLHeadlineSmall({bool r = true}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? kcfLHeadlineSmallSize.sp : kcfLHeadlineSmallSize, //24
      fontWeight: kcfregular,
    );
TextStyle kcfLTitleLarge({bool r = true}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? kcfLTitleLargeSize.sp : kcfLTitleLargeSize, //22
      fontWeight: kcfregular,
    );
TextStyle kcfLTitleMedium({bool r = true}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? kcfLTitleMediumSize.sp : kcfLTitleMediumSize, //20
      fontWeight: kcfmedium,
    );
TextStyle kcfLTitleSmall({bool r = true}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? kcfLTitleSmallSize.sp : kcfLTitleSmallSize, //18
      fontWeight: kcfmedium,
    );
TextStyle kcfLLabelLarge({bool r = true}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? kcfLLabelLargeSize.sp : kcfLLabelLargeSize, //14
      fontWeight: kcfmedium,
    );

TextStyle kcfLLabelMedium({bool r = true}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? kcfLLabelMediumize.sp : kcfLLabelMediumize, //12
      fontWeight: kcfmedium,
    );
TextStyle kcfLLabelSmall({bool r = true}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? kcfLLabelSmallSize.sp : kcfLLabelSmallSize, //11
      fontWeight: kcfmedium,
    );
TextStyle kcfLBodyLarge({bool r = true}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? kcfLBodyLargeSize.sp : kcfLBodyLargeSize, //24
      fontWeight: kcfregular,
    );
TextStyle kcfLBodyMedium({bool r = true}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? kcfLBodyMediumize.sp : kcfLBodyMediumize, //20
      fontWeight: kcfregular,
    );
TextStyle kcfLBodySmall({bool r = true}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? kcfLBodySmallSize.sp : kcfLBodySmallSize, //18
      fontWeight: kcfregular,
    );

TextStyle kcfSBodyLarge({bool r = true}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? kcfSBodyLargeSize.sp : kcfSBodyLargeSize, //16
      fontWeight: kcfregular,
    );
TextStyle kcfSBodyMedium({bool r = true}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? kcfSBodyMediumize.sp : kcfSBodyMediumize, //14
      fontWeight: kcfregular,
    );
TextStyle kcfSBodySmall({bool r = true}) => GoogleFonts.inter(
      color: kccWhite,
      fontSize: r ? kcfSBodySmallSize.sp : kcfSBodySmallSize, //12
      fontWeight: kcfregular,
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
