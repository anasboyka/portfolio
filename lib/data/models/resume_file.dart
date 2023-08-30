import 'dart:convert';

class ResumeFile {
  final String fileName;
  final String url;
  final double version;
  ResumeFile({
    this.fileName = '',
    this.url = '',
    this.version = 0.0,
  });

  ResumeFile copyWith({
    String? fileName,
    String? url,
    double? version,
  }) {
    return ResumeFile(
      fileName: fileName ?? this.fileName,
      url: url ?? this.url,
      version: version ?? this.version,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'fileName': fileName});
    result.addAll({'url': url});
    result.addAll({'version': version});

    return result;
  }

  factory ResumeFile.fromMap(Map<String, dynamic> map) {
    return ResumeFile(
      fileName: map['fileName'] ?? '',
      url: map['url'] ?? '',
      version: map['version']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResumeFile.fromJson(String source) =>
      ResumeFile.fromMap(json.decode(source));

  @override
  String toString() =>
      'ResumeFile(fileName: $fileName, url: $url, version: $version)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResumeFile &&
        other.fileName == fileName &&
        other.url == url &&
        other.version == version;
  }

  @override
  int get hashCode => fileName.hashCode ^ url.hashCode ^ version.hashCode;
}
