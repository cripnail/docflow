import 'dart:io';
import 'package:docflow/features/document_scanner/presentation/widgets/scan_status_view.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:docflow/core/constants/enums.dart';
import 'package:docflow/core/constants/strings.dart';
import 'package:docflow/features/document_scanner/presentation/bloc/scanner_bloc.dart';
import 'package:docflow/features/document_scanner/presentation/bloc/scanner_event.dart';
import 'package:docflow/features/document_scanner/presentation/bloc/scanner_state.dart';
import 'package:docflow/features/document_scanner/presentation/widgets/camera_preview.dart';

class DocumentScannerScreen extends StatefulWidget {
  const DocumentScannerScreen({super.key});

  @override
  State<DocumentScannerScreen> createState() => _DocumentScannerScreenState();
}

class _DocumentScannerScreenState extends State<DocumentScannerScreen> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(AppStrings.cameraError)),
          );
        }
        return;
      }

      final firstCamera = cameras.first;
      final controller = CameraController(
        firstCamera,
        ResolutionPreset.high,
      );

      _initializeControllerFuture = controller.initialize();

      if (mounted) {
        setState(() {
          _controller = controller;
        });
      }

      await _initializeControllerFuture;
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${AppStrings.cameraError}$e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.scannerTitle)),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              _controller != null &&
              _controller!.value.isInitialized) {
            return BlocBuilder<DocumentScannerBloc, ScannerState>(
              builder: (context, state) {
                return Stack(
                  children: [
                    DocumentCameraPreview(
                      controller: _controller!,
                      onCapture: () => _handleCapture(context),
                      isProcessing: state.result.status == ScanStatus.scanning,
                    ),
                    if (state.result.status == ScanStatus.success)
                      ScanStatusView(
                        result: state.result,
                        onRetry: () {
                          context.read<DocumentScannerBloc>().add(
                                const StartScanning(),
                              );
                        },
                        onSave: () => Navigator.pop(context),
                      ),
                  ],
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future<void> _handleCapture(BuildContext context) async {
    if (_controller == null || !_controller!.value.isInitialized) {
      return;
    }

    try {
      final image = await _controller!.takePicture();
      if (!mounted) return;

      context.read<DocumentScannerBloc>().add(
            ProcessImage(File(image.path)),
          );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${AppStrings.cameraError}$e')),
        );
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
