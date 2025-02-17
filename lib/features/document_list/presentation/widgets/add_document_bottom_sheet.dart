import 'package:docflow/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:docflow/core/constants/strings.dart';
import 'package:docflow/core/constants/dimensions.dart';
import 'package:docflow/features/document_scanner/presentation/screens/scanner_screen.dart';
import 'package:docflow/features/gallery/presentation/screens/gallery_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:docflow/core/di/injection_container.dart' as di;
import 'package:docflow/features/document_scanner/presentation/bloc/scanner_bloc.dart';

class AddDocumentBottomSheet extends StatelessWidget {
  const AddDocumentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.paddingM),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(
              Icons.document_scanner,
              size: AppDimensions.iconM,
              color: AppColors.buttonBlue,
            ),
            title: Text(
              AppStrings.scan,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => di.sl<DocumentScannerBloc>(),
                    child: const DocumentScannerScreen(),
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.photo_library, size: AppDimensions.iconM),
            title: const Text(AppStrings.gallery),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GalleryScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.folder_open, size: AppDimensions.iconM),
            title: const Text(AppStrings.files),
            onTap: () {
              Navigator.pop(context);
              // Здесь будет реализована логика работы с файлами
            },
          ),
        ],
      ),
    );
  }
}
