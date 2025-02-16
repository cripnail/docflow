import 'dart:io';
import 'package:docflow/features/document_list/domain/models/document_type.dart';

class DocumentModel {
  final String id;
  final String name;
  final DocumentType type;
  final File file;
  final DateTime createdAt;

  DocumentModel({
    required this.id,
    required this.name,
    required this.type,
    required this.file,
    required this.createdAt,
  });
}
