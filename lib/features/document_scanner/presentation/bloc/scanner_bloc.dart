import 'package:docflow/features/document_scanner/data/services/metadata_storage_service.dart';
import 'package:docflow/features/document_scanner/domain/models/document_metadata.dart';
import 'package:docflow/features/document_scanner/domain/models/document_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:docflow/core/constants/strings.dart';
import 'package:docflow/features/document_scanner/domain/models/scan_result.dart';
import 'package:docflow/features/document_scanner/domain/repositories/scanner_repository.dart';
import 'package:docflow/features/document_scanner/presentation/bloc/scanner_event.dart';
import 'package:docflow/features/document_scanner/presentation/bloc/scanner_state.dart';

class DocumentScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  final DocumentScannerRepository _repository;
  final MetadataStorageService _metadataStorage;

  DocumentScannerBloc(this._repository, this._metadataStorage)
      : super(ScannerState.initial()) {
    on<StartScanning>(_onStartScanning);
    on<ProcessImage>(_onProcessImage);
    on<CancelScanning>(_onCancelScanning);
  }

  Future<void> _onStartScanning(
    StartScanning event,
    Emitter<ScannerState> emit,
  ) async {
    emit(state.copyWith(
      result: ScanResult.scanning(),
    ));
  }

  Future<void> _onProcessImage(
    ProcessImage event,
    Emitter<ScannerState> emit,
  ) async {
    try {
      emit(state.copyWith(result: ScanResult.scanning()));

      // Сканируем документ
      final document = await _repository.scanDocument(event.image);

      // Создаем метаданные
      final metadata = DocumentMetadata(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        fileName: AppStrings.scanDocument,
        filePath: document.path,
        createdAt: DateTime.now(),
        source: DocumentSource.scan,
      );

      // Сохраняем метаданные
      await _metadataStorage.saveMetadata(metadata);

      emit(state.copyWith(
        result: ScanResult.success(document),
      ));
    } catch (e) {
      emit(state.copyWith(
        result: ScanResult.failure(e.toString()),
      ));
    }
  }

  Future<void> _onCancelScanning(
    CancelScanning event,
    Emitter<ScannerState> emit,
  ) async {
    emit(ScannerState.initial());
  }
}
