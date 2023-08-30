import 'package:hive/hive.dart';

class HiveDb {
  static Future init(String? dirPath) async {
    Hive.init(dirPath);
    await Hive.openBox('icu-note');
    await Hive.openBox('quickref');
  }
}
