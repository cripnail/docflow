import 'dart:io';

import 'package:bloc/bloc.dart';

import 'package:docflow/core/constants/strings.dart';
import 'package:docflow/core/services/pdf_converter.dart';
import 'package:docflow/features/document_list/data/repositories/document_repository_impl.dart';
import 'package:docflow/features/document_list/domain/models/document_status.dart';
import 'package:docflow/features/document_list/domain/models/document_type.dart';
import 'package:docflow/features/document_list/presentation/bloc/document_list_event.dart';
import 'package:docflow/features/document_list/presentation/bloc/document_list_state.dart';

import 'package:docflow/core/constants/mock_data.dart';

class DocumentListBloc extends Bloc<DocumentListEvent, DocumentListState> {
  final DocumentRepository _repository;
  final PDFConverterService _pdfConverter;

  DocumentListBloc({
    required DocumentRepository repository,
    required PDFConverterService pdfConverter,
  })  : _repository = repository,
        _pdfConverter = pdfConverter,
        super(const DocumentListState()) {
    on<LoadDocuments>(_onLoadDocuments);
    on<AddDocument>(_onAddDocument);
    on<DeleteDocument>(_onDeleteDocument);
  }

  Future<void> _onLoadDocuments(
    LoadDocuments event,
    Emitter<DocumentListState> emit,
  ) async {
    emit(state.copyWith(status: DocumentStatus.loading));
    try {
      // Добавим тестовые документы
      emit(state.copyWith(
        status: DocumentStatus.success,
        documents: MockData.testDocuments,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: DocumentStatus.failure,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onDeleteDocument(
    DeleteDocument event,
    Emitter<DocumentListState> emit,
  ) async {
    try {
      await _repository.deleteDocument(event.id);
      final documents = await _repository.getDocuments();
      emit(state.copyWith(documents: documents));
    } catch (e) {
      emit(state.copyWith(
        status: DocumentStatus.failure,
        error: e.toString(),
      ));
    }
  }

  bool _shouldConvert(File file) {
    final extension =
        file.path.split(AppStrings.extensionSeparator).last.toLowerCase();
    return AppStrings.convertibleExtensions.contains(extension);
  }

  Future<void> _onAddDocument(
    AddDocument event,
    Emitter<DocumentListState> emit,
  ) async {
    emit(state.copyWith(status: DocumentStatus.loading));
    try {
      final file = event.file;
      final fileName = event.type == DocumentType.scan
          ? AppStrings.scanDocument
          : event.type == DocumentType.gallery
              ? AppStrings.galleryDocument
              : file.path.split(AppStrings.pathSeparator).last;
      final pdfFile =
          _shouldConvert(file) ? await _pdfConverter.convertToPDF(file) : file;

      await _repository.saveDocument(
        fileName: fileName,
        file: pdfFile,
        type: event.type,
      );

      final documents = await _repository.getDocuments();
      emit(state.copyWith(
        status: DocumentStatus.success,
        documents: documents,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: DocumentStatus.failure,
        error: e.toString(),
      ));
    }
  }
}
