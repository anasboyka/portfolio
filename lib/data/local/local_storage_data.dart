import 'package:portfolio/data/local/hive_db.dart';
import 'package:portfolio/data/local/isar_db.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sp_util/sp_util.dart';

class LocalStorageData {
  static SpUtil? spUtil;
  static Isar? isar;


  static Future init() async {
    spUtil = await SpUtil.getInstance();
    var dir = await getApplicationDocumentsDirectory();
    HiveDb.init(dir.path);
    isar = await IsarDb.init(dir.path);
  }
}
