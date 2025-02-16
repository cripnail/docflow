import 'document_source.dart';

class DocumentMetadata {
  final String id;
  final String fileName;
  final String filePath;
  final DateTime createdAt;
  final DocumentSource source;

  const DocumentMetadata({
    required this.id,
    required this.fileName,
    required this.filePath,
    required this.createdAt,
    required this.source,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'fileName': fileName,
        'filePath': filePath,
        'createdAt': createdAt.toIso8601String(),
        'source': source.name,
      };

  factory DocumentMetadata.fromJson(Map<String, dynamic> json) =>
      DocumentMetadata(
        id: json['id'] as String,
        fileName: json['fileName'] as String,
        filePath: json['filePath'] as String,
        createdAt: DateTime.parse(json['createdAt'] as String),
        source: DocumentSource.values.firstWhere(
          (e) => e.name == json['source'],
          orElse: () => DocumentSource.scan,
        ),
      );
}
