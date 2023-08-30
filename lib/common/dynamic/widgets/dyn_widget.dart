import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/common/constant/res/const_color.dart';

TextStyle kwtextStyleRD(
    {double fs = 12,
    Color c = Colors.black,
    double? h,
    FontWeight? fw,
    String ff = 'SF Pro Text'}) {
  return TextStyle(
    fontFamily: ff,
    fontSize: fs.sp,
    color: c,
    height: h,
    fontWeight: fw,
  );
}

TextStyle kwtextStyleD(
    {double fs = 12, Color c = Colors.black, double? h, FontWeight? fw,String ff = 'SF Pro Text'}) {
  return TextStyle(
    fontFamily: ff,
    fontSize: fs,
    color: c,
    height: h,
    fontWeight: fw,
  );
}

SizedBox gapwr({double w = 20}) {
  return SizedBox(width: w.w);
}

SizedBox gaphr({double h = 20}) {
  return SizedBox(height: h.h);
}

SizedBox gapw({double w = 20}) {
  return SizedBox(width: w);
}

SizedBox gaph({double h = 20}) {
  return SizedBox(height: h);
}

Future kwShowSnackbar(BuildContext context, String message,
    {int seconds = 4}) async {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: Duration(seconds: seconds),
  ));
}

Container dividerC({Color c = kccgrey6, double t = 1}) {
  return Container(
    color: c,
    height: t,
    width: double.infinity,
  );
}

Divider divider({Color c = kccgrey6, double t = 1}) {
  return Divider(
    color: c,
    thickness: t,
    endIndent: 0,
    height: 0,
    indent: 0,
  );
}

EdgeInsetsGeometry padSymR({double h = 20, double v = 0}) {
  return EdgeInsets.symmetric(horizontal: h.w, vertical: v.h);
}

EdgeInsetsGeometry padSym({h = 20, v = 0}) {
  return EdgeInsets.symmetric(horizontal: h, vertical: v);
}

EdgeInsetsGeometry padOnlyR({
  double l = 0,
  double t = 0,
  double r = 0,
  double b = 0,
}) {
  return EdgeInsets.only(left: l.w, top: t.h, right: r.w, bottom: b.h);
}

EdgeInsetsGeometry padOnly({
  double l = 0,
  double t = 0,
  double r = 0,
  double b = 0,
}) {
  return EdgeInsets.only(left: l, top: t, right: r, bottom: b);
}

BorderRadius borderRadiuscR({double r = 10}) {
  return BorderRadius.circular(r.r);
}

RoundedRectangleBorder cornerR({double r = 10}) {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(r.r),
  );
}

RoundedRectangleBorder corner({double r = 10}) {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(r),
  );
}
