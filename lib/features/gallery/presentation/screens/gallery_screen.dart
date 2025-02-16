import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:docflow/core/constants/strings.dart';
import 'package:docflow/features/document_scanner/presentation/bloc/scanner_bloc.dart';
import 'package:docflow/features/document_scanner/presentation/bloc/scanner_event.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.createPdfFromGallery),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final imagePicker = ImagePicker();
            final pickedFile = await imagePicker.pickImage(
              source: ImageSource.gallery,
            );

            if (pickedFile != null && context.mounted) {
              context.read<DocumentScannerBloc>().add(
                    CreatePdfFromGallery([File(pickedFile.path)]),
                  );
              Navigator.of(context).pop();
            }
          },
          child: const Text(AppStrings.gallery),
        ),
      ),
    );
  }
}
