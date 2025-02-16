import 'dart:io';

import 'package:docflow/features/document_list/data/repositories/document_repository_impl.dart';
import 'package:docflow/features/document_list/domain/models/document_type.dart';
import 'package:docflow/features/document_scanner/domain/repositories/scanner_repository.dart';

class DocumentScannerRepositoryImpl implements DocumentScannerRepository {
  final DocumentRepository _documentRepository;

  DocumentScannerRepositoryImpl(this._documentRepository);

  Future<File> scanDocument(File image) async {
    // В реальном приложении здесь была бы логика обработки отсканированного изображения
    return image;
  }

  Future<void> saveScanResult(File document, String fileName) async {
    await _documentRepository.saveDocument(
      fileName: fileName,
      file: document,
      type: DocumentType.scan,
    );
  }
}
