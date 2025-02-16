// lib/features/document_list/presentation/bloc/document_list_event.dart

import 'dart:io';

import '../../domain/models/document_type.dart';

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
