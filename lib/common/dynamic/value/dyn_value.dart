// screen size
// safe area size
//

import 'dart:io';

import 'package:flutter/material.dart';

double rbtmNavigationBarHeight =
    Platform.isAndroid ? kBottomNavigationBarHeight : 90;

double calculateSingleLineHeight(TextStyle textStyle) {
  // Calculate the height of a single line of text using the TextStyle
  final textPainter = TextPainter(
    text: TextSpan(text: 'A', style: textStyle),
    textDirection: TextDirection.ltr,
  );
  textPainter.layout();
  return textPainter.height;
}
