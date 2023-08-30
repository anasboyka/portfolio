
import 'package:portfolio/data/models/gen/isar/icu_note_file_isar.dart';
import 'package:isar/isar.dart';

class IsarDb {
  static Future<Isar> init(String dirPath) async {
    final isar = await Isar.open(
      [portfolioFileIsarSchema],
      directory: dirPath,
    );
    return isar;
  }
}
