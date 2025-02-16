import 'package:docflow/features/document_scanner/domain/models/scan_result.dart';

class ScannerState {
  final ScanResult result;
  final bool isCameraInitialized;

  const ScannerState({
    required this.result,
    this.isCameraInitialized = false,
  });

  factory ScannerState.initial() => ScannerState(
        result: ScanResult.initial(),
      );

  ScannerState copyWith({
    ScanResult? result,
    bool? isCameraInitialized,
  }) =>
      ScannerState(
        result: result ?? this.result,
        isCameraInitialized: isCameraInitialized ?? this.isCameraInitialized,
      );
}
