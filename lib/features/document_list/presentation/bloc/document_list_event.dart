import 'dart:io';

import 'package:docflow/features/document_list/domain/models/document_type.dart';

abstract class DocumentListEvent {
  const DocumentListEvent();
}

class LoadDocuments extends DocumentListEvent {
  const LoadDocuments();
}

class AddDocument extends DocumentListEvent {
  final File file;
  final DocumentType type;

  const AddDocument({
    required this.file,
    required this.type,
  });
}

class DeleteDocument extends DocumentListEvent {
  final String id;

  const DeleteDocument(this.id);
}
