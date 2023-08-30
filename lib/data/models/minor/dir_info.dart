import 'dart:io';

class DirInfo {
  Directory tempDir;
  Directory appSupDir;
  Directory appDocDir;
  DirInfo({
    required this.tempDir,
    required this.appSupDir,
    required this.appDocDir,
  });
}
