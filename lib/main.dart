import 'package:flutter/material.dart';
import 'package:portfolio/init.dart';
import 'package:portfolio/my_app.dart';

void main() async {
  await InitTask.initServices();
  runApp(const MyApp());
}
