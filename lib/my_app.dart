import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/common/dynamic/theme/app_theme.dart';
import 'package:portfolio/routes/route_generator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('kisWeb =  $kIsWeb');

    return ScreenUtilInit(
      designSize: kIsWeb ? const Size(1728, 1117) : const Size(390, 844),
      builder: (context, child) {
        return MaterialApp(
          title: 'DevTech Monster',
          // theme: ThemeData(
          //   colorScheme: AppTheme.lightColorScheme,
          //   useMaterial3: true
          // ),
          darkTheme: ThemeData(
              colorScheme: AppTheme.darkColorScheme,
              textTheme: AppTheme.textThemeDark,
              useMaterial3: true),
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      },
    );
  }

  Size size() {
    if (Platform.isIOS || Platform.isAndroid) {
      return const Size(390, 844);
    } else if (Platform.isLinux ||
        Platform.isMacOS ||
        Platform.isWindows ||
        kIsWeb) {
      return const Size(1728, 1117);
    } else {
      return const Size(1728, 1117);
    }
  }
}
