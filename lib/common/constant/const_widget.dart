import 'package:flutter/material.dart';
import 'package:portfolio/common/constant/res/const_color.dart';

const kcwDivider = Divider(
  color: kccgrey6,
  endIndent: 0,
  height: 0,
  indent: 0,
  thickness: 1,
);

Container testWidget(
    {double height = 300, double width = 100, Color color = kccGreen1}) {
  return Container(
    height: height,
    width: width,
    color: color,
  );
}
