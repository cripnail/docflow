import 'dart:io';

import '../../../../core/constants/enums.dart';

class ScanResult {
  final ScanStatus status;
  final File? document;
  final String? errorMessage;

  const ScanResult({
    required this.status,
    this.document,
    this.errorMessage,
  });

  factory ScanResult.initial() => const ScanResult(status: ScanStatus.initial);

  factory ScanResult.scanning() =>
      const ScanResult(status: ScanStatus.scanning);

  factory ScanResult.success(File document) => ScanResult(
        status: ScanStatus.success,
        document: document,
      );

  factory ScanResult.failure(String message) => ScanResult(
        status: ScanStatus.failure,
        errorMessage: message,
      );
}
