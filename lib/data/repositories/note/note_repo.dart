import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class NoteRepo {
  Future fetchfilefromAsset() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = jsonDecode(manifestContent);
    final icuPaths = manifestMap.keys
        .where((String key) => key.startsWith('assets/pdf/content/'))
        .toList();
    final quickRefPaths = manifestMap.keys
        .where((String key) => key.startsWith('assets/pdf/quickref/'))
        .toList();
    icuPaths.removeWhere((element) => element.contains('.DS_Store'));
    quickRefPaths.removeWhere((element) => element.contains('.DS_Store'));
  }
  
}
