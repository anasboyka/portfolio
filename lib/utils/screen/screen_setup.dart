import 'package:flutter/material.dart';
import 'package:portfolio/common/dynamic/value/dyn_value.dart';
import 'package:portfolio/utils/screen/screen.dart';

class ScreenSetup {
  static Screen init(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double safeArea = MediaQuery.of(context).padding.top;
    double btmNavigationBar = rbtmNavigationBarHeight;
    double appbar = AppBar().preferredSize.height;
    return Screen(
      screenSize: size,
      safeArea: safeArea,
      btmNavigationBar: btmNavigationBar,
      appbar: appbar,
    );
  }
}
