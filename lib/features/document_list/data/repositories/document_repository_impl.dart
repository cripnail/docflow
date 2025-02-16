import 'dart:io';
import 'package:docflow/core/services/pdf_converter.dart';
import 'package:docflow/features/document_list/domain/models/document_type.dart';
import 'package:docflow/core/constants/strings.dart';

import 'package:docflow/features/document_list/data/models/document_model.dart';
import 'package:docflow/features/document_scanner/data/services/metadata_storage_service.dart';
import 'package:docflow/features/document_scanner/domain/models/document_metadata.dart';
import 'package:docflow/features/document_scanner/domain/models/document_source.dart';

class DocumentRepository {
  final PDFConverterService _pdfConverter;
  final MetadataStorageService _metadataStorage;

  DocumentRepository(this._pdfConverter, this._metadataStorage);

  Future<void> saveDocument({
    required String fileName,
    required File file,
    required DocumentType type,
  }) async {
    // Конвертируем в PDF если нужно
    final pdfFile =
        _shouldConvert(file) ? await _pdfConverter.convertToPDF(file) : file;

    // Создаем метаданные
    final metadata = DocumentMetadata(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      fileName: _getFileName(fileName, type),
      filePath: pdfFile.path,
      createdAt: DateTime.now(),
      source: _getDocumentSource(type),
    );

    // Сохраняем метаданные
    await _metadataStorage.saveMetadata(metadata);
  }

  String _getFileName(String originalName, DocumentType type) {
    switch (type) {
      case DocumentType.scan:
        return AppStrings.scanDocument;
      case DocumentType.gallery:
        return AppStrings.galleryDocument;
      case DocumentType.file:
        return originalName;
    }
  }

  DocumentSource _getDocumentSource(DocumentType type) {
    switch (type) {
      case DocumentType.scan:
        return DocumentSource.scan;
      case DocumentType.gallery:
        return DocumentSource.gallery;
      case DocumentType.file:
        return DocumentSource.file;
    }
  }

  Future<List<DocumentModel>> getDocuments() async {
    final metadata = await _metadataStorage.getAllMetadata();
    return metadata
        .map((meta) => DocumentModel(
              id: meta.id,
              name: meta.fileName,
              type: _getDocumentType(meta.source),
              file: File(meta.filePath),
              createdAt: meta.createdAt,
            ))
        .toList();
  }

  Future<void> deleteDocument(String id) async {
    await _metadataStorage.deleteMetadata(id);
  }

  bool _shouldConvert(File file) {
    final extension =
        file.path.split(AppStrings.extensionSeparator).last.toLowerCase();
    return AppStrings.convertibleExtensions.contains(extension);
  }

  DocumentType _getDocumentType(DocumentSource source) {
    switch (source) {
      case DocumentSource.scan:
        return DocumentType.scan;
      case DocumentSource.gallery:
        return DocumentType.gallery;
      case DocumentSource.file:
        return DocumentType.file;
    }
  }
}
