import 'dart:io';

abstract class ScannerEvent {
  const ScannerEvent();
}

class StartScanning extends ScannerEvent {
  const StartScanning();
}

class ProcessImage extends ScannerEvent {
  final File image;

  const ProcessImage(this.image);
}

class CreatePdfFromGallery extends ScannerEvent {
  final List<File> images;

  const CreatePdfFromGallery(this.images);
}

class CancelScanning extends ScannerEvent {
  const CancelScanning();
}
