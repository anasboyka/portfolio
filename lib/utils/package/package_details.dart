import 'package:flutter/cupertino.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Package with ChangeNotifier {
  String? version;
  String? buildNumber;
  Package({
    this.version,
    this.buildNumber,
  });

  Future<Package> init() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
    return this;
  }
}
