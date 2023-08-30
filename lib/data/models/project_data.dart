import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:portfolio/common/constant/enum/enum.dart';
import 'package:portfolio/common/constant/enum/extension.dart';

class ProjectData {
  List<String> imageUrl;
  String title;
  String description;
  double rating;
  List<String> techUsed;
  List<ProjCategory> categories;
  String? playStoreLink;
  String? appStoreLink;
  String? projectLink;
  String? projectDemo;
  ProjectData({
    this.imageUrl = const [],
    this.title = '',
    this.description = '',
    this.rating = 0,
    this.techUsed = const [],
    this.categories = const [],
    this.playStoreLink,
    this.appStoreLink,
    this.projectLink,
    this.projectDemo,
  });

  ProjectData copyWith({
    List<String>? imageUrl,
    String? title,
    String? description,
    double? rating,
    List<String>? techUsed,
    List<ProjCategory>? categories,
    String? playStoreLink,
    String? appStoreLink,
    String? projectLink,
    String? projectDemo,
  }) {
    return ProjectData(
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      description: description ?? this.description,
      rating: rating ?? this.rating,
      techUsed: techUsed ?? this.techUsed,
      categories: categories ?? this.categories,
      playStoreLink: playStoreLink ?? this.playStoreLink,
      appStoreLink: appStoreLink ?? this.appStoreLink,
      projectLink: appStoreLink ?? this.projectLink,
      projectDemo: projectDemo ?? this.projectDemo,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'imageUrl': imageUrl});
    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'rating': rating});
    result.addAll({'techUsed': techUsed});
    result.addAll({'categories': categories.map((x) => x.text).toList()});
    result.addAll({'playStoreLink': playStoreLink});
    result.addAll({'appStoreLink': appStoreLink});
    result.addAll({'projectLink': projectLink});
    result.addAll({'projectDemo': projectDemo});

    return result;
  }

  factory ProjectData.fromMap(Map<String, dynamic> map) {
    return ProjectData(
      imageUrl: map['imageUrl'] != null
          ? (map['imageUrl'] as List<dynamic>).map((e) => e.toString()).toList()
          : const [],
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      rating: map['rating'] ?? 0,
      techUsed: map['techUsed'] != null
          ? (map['techUsed'] as List<dynamic>).map((e) => e.toString()).toList()
          : const [],
      categories: map['categories'] != null
          ? (map['categories'] as List<dynamic>)
              .map((x) => ProjCategoryEx.fromString(x))
              .toList()
          : [],
      playStoreLink: map['playStoreLink'],
      appStoreLink: map['appStoreLink'],
      projectLink: map['projectLink'],
      projectDemo: map['projectDemo'],
    );
  }

  factory ProjectData.fromFirestore(QueryDocumentSnapshot snapshot) {
    return ProjectData(
      imageUrl: snapshot['imageUrl'] != null
          ? (snapshot['imageUrl'] as List<dynamic>)
              .map((e) => e.toString())
              .toList()
          : const [],
      title: snapshot['title'] ?? '',
      description: snapshot['description'] ?? '',
      rating: snapshot['rating'] ?? 0,
      techUsed: snapshot['techUsed'] != null
          ? (snapshot['techUsed'] as List<dynamic>)
              .map((e) => e.toString())
              .toList()
          : const [],
      categories: snapshot['categories'] != null
          ? (snapshot['categories'] as List<dynamic>)
              .map((x) => ProjCategoryEx.fromString(x))
              .toList()
          : [],
      playStoreLink: snapshot['playStoreLink'],
      appStoreLink: snapshot['appStoreLink'],
      projectLink: snapshot['projectLink'],
      projectDemo: snapshot['projectDemo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectData.fromJson(String source) =>
      ProjectData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProjectData(imageUrl: $imageUrl, title: $title, description: $description, rating: $rating, techUsed: $techUsed, categories: $categories, playStoreLink: $playStoreLink, appStoreLink: $appStoreLink, projectLink $projectLink, projectDemo $projectDemo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProjectData &&
        other.imageUrl == imageUrl &&
        other.title == title &&
        other.description == description &&
        listEquals(other.techUsed, techUsed) &&
        listEquals(other.categories, categories) &&
        other.playStoreLink == playStoreLink &&
        other.appStoreLink == appStoreLink;
  }

  @override
  int get hashCode {
    return imageUrl.hashCode ^
        title.hashCode ^
        description.hashCode ^
        techUsed.hashCode ^
        categories.hashCode ^
        playStoreLink.hashCode ^
        appStoreLink.hashCode;
  }
}
