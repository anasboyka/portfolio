import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

class Storagedb {
  final String? uid;
  Storagedb({
    this.uid,
  });

  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<Reference> uploadImageInData(
    Uint8List data,
    String fileName,
    String storageRef,
    Function(double value)? onProgress,
  ) async {
    final ref = storage.ref().child(storageRef).child('/$fileName');
    try {
      final fileExtension = fileName.split('.')[1];
      String contentType = getContentType(fileExtension);
      UploadTask uploadTask =
          ref.putData(data, SettableMetadata(contentType: contentType));
      if (onProgress != null) {
        uploadTask.snapshotEvents.listen((event) {
          print(event.bytesTransferred / event.totalBytes);
          onProgress(event.bytesTransferred / event.totalBytes);
        });
      }

      await uploadTask.then((snapshot) => snapshot.ref);

      //return ref;
    } catch (e) {
      print(e);
    }
    return ref;
  }

  String getContentType(String fileExtension) {
    switch (fileExtension) {
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'gif':
        return 'image/gif';
      // Add more cases for different file extensions as needed
      default:
        return 'application/octet-stream';
    }
  }
}
