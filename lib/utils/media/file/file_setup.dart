import 'package:portfolio/data/models/minor/dir_info.dart';
import 'package:path_provider/path_provider.dart';

class FileSetup {
  static Future<DirInfo> setup() async {
    return DirInfo(
        tempDir: await getTemporaryDirectory(),
        appSupDir: await getApplicationSupportDirectory(),
        appDocDir: await getApplicationDocumentsDirectory());
  }
}
