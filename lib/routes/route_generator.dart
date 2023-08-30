import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/view/pages/homepage/homepage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => const MyHomePage());
      default:
        return CupertinoPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('No page for this route'),
                  ),
                ));
    }
  }
}
