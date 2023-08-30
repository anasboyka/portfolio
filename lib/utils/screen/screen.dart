import 'package:flutter/material.dart';

class Screen with ChangeNotifier {
  Size screenSize;
  double safeArea;
  double btmNavigationBar;
  double appbar;
  // double body;
  Screen({
    required this.screenSize,
    this.safeArea = 0.0,
    this.btmNavigationBar = 0.0,
    this.appbar = 0.0,
    // this.body = 0.0,
  });
}
