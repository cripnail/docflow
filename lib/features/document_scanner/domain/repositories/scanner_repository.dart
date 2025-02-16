import 'dart:io';

abstract class DocumentScannerRepository {
  Future<File> scanDocument(File image);

  Future<void> saveScanResult(File document, String fileName);
}
