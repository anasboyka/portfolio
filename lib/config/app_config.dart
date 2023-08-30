// app config goes here

import 'package:portfolio/common/constant/enum/enum.dart';
import 'package:portfolio/common/constant/res/define.dart';
import 'package:portfolio/config/config.dart';

class AppConfig {
  late Config config;

  String get appName => Define.appName;
  Env get env => Env.values.firstWhere(
      (element) => element.toString() == "Env.${Define.appEnv}",
      orElse: () => Env.prod);

  AppConfig() {
    switch (env) {
      case Env.dev:
        {
          config = Config();
        }
        break;
      case Env.prod:
        {
          config = Config();
        }
        break;
    }
  }

  @override
  String toString() {
    return "appUrlKey : ${config.appUrlKey}\n"
        "appName : $appName\n"
        "jPushPkgName : ${config.jPushPkgName}\n"
        "jPushAppKey : ${config.jPushAppKey}\n"
        "jPushChannel : ${config.jPushChannel}\n";
  }
}
