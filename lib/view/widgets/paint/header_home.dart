import 'package:flutter/material.dart';
import 'package:portfolio/common/constant/res/const_color.dart';

class HeaderPainter extends CustomPainter {
  // final double hPercent;
  // final double mpPercent;
  HeaderPainter(
      //   {
      //   required this.hPercent,
      //   required this.mpPercent,
      // }
      );

  @override
  void paint(Canvas canvas, Size size) {
    // print('${size.height} size');
    // print('${size.height * hPercent} draw');
    final h = size.height;
    final w = size.width;
    Paint paint = Paint();
    Path ovalheader = Path();
    ovalheader.moveTo(0, -h*2);
    //ovalheader.lineTo(0, h * hPercent);
    ovalheader.lineTo(0, 146);
    // ovalheader.quadraticBezierTo(
    //     w * 0.25, h * mpPercent, w * 0.5, h * mpPercent);
    ovalheader.quadraticBezierTo(w * 0.25, 189, w * 0.5, 189);
    // ovalheader.quadraticBezierTo(w * 0.75, h * mpPercent, w, h * hPercent);
    ovalheader.quadraticBezierTo(w * 0.75, 189, w, 146);
    ovalheader.lineTo(w, -h*2);
    ovalheader.close();
    paint.color = kccBlue3;
    canvas.drawPath(ovalheader, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }
}
