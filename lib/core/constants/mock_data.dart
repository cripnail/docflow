import 'dart:io';
import 'package:docflow/features/document_list/data/models/document_model.dart';
import 'package:docflow/features/document_list/domain/models/document_type.dart';
import 'package:docflow/core/constants/strings.dart';

abstract class MockData {
  static List<DocumentModel> testDocuments = [
    DocumentModel(
      id: AppStrings.mockDocumentId1,
      name: AppStrings.mockDocumentName1,
      type: DocumentType.file,
      file: File(''),
      // пустой путь
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    DocumentModel(
      id: AppStrings.mockDocumentId2,
      name: AppStrings.mockDocumentName2,
      type: DocumentType.file,
      file: File(''),
      // пустой путь
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
    DocumentModel(
      id: AppStrings.mockDocumentId3,
      name: AppStrings.mockDocumentName3,
      type: DocumentType.file,
      file: File(''),
      // пустой путь
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
    ),
  ];
}
