import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/init.dart';
import 'package:portfolio/my_app.dart';

void main() async {
  await InitTask.initServices();
  print(isMobile);
  runApp(const MyApp());
}
