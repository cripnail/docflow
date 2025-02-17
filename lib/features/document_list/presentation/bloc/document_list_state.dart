import 'package:docflow/features/document_list/data/models/document_model.dart';
import 'package:docflow/features/document_list/domain/models/document_status.dart';

class DocumentListState {
  final List<DocumentModel> documents;
  final DocumentStatus status;
  final String? error;

  const DocumentListState({
    this.documents = const [],
    this.status = DocumentStatus.initial,
    this.error,
  });

  DocumentListState copyWith({
    List<DocumentModel>? documents,
    DocumentStatus? status,
    String? error,
  }) =>
      DocumentListState(
        documents: documents ?? this.documents,
        status: status ?? this.status,
        error: error,
      );
}
