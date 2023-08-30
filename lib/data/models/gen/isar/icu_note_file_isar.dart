import 'dart:convert';

import 'package:isar/isar.dart';

part 'icu_note_file_isar.g.dart';

@collection
class portfolioFileIsar {
  Id? id;
  final String title;
  final String fileName;
  final String assetPath;
  final String? image;
  final bool isFavourite;
  final String? category;
  portfolioFileIsar({
    this.title = '',
    this.fileName = '',
    this.assetPath = '',
    this.image,
    this.isFavourite = false,
    this.category,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'fileName': fileName});
    result.addAll({'assetPath': assetPath});
    if (image != null) {
      result.addAll({'image': image});
    }
    result.addAll({'isFavourite': isFavourite});
    if (category != null) {
      result.addAll({'category': category});
    }

    return result;
  }

  factory portfolioFileIsar.fromMap(Map<String, dynamic> map) {
    return portfolioFileIsar(
      title: map['title'] ?? '',
      fileName: map['fileName'] ?? '',
      assetPath: map['assetPath'] ?? '',
      image: map['image'],
      isFavourite: map['isFavourite'] ?? false,
      category: map['category'],
    );
  }

  String toJson() => json.encode(toMap());

  factory portfolioFileIsar.fromJson(String source) =>
      portfolioFileIsar.fromMap(json.decode(source));
}
