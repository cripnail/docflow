import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:docflow/core/constants/dimensions.dart';
import 'package:docflow/core/constants/colors.dart';
import 'package:docflow/features/document_scanner/presentation/widgets/shared/scanning_animation.dart';

class DocumentCameraPreview extends StatelessWidget {
  final CameraController controller;
  final VoidCallback onCapture;
  final bool isProcessing;

  const DocumentCameraPreview({
    super.key,
    required this.controller,
    required this.onCapture,
    this.isProcessing = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (controller.value.isInitialized)
          ClipRRect(
            borderRadius: BorderRadius.circular(AppDimensions.borderRadiusL),
            child: CameraPreview(controller),
          ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.overlayScrim,
            ),
            child: Center(
              child: SizedBox(
                width: AppDimensions.scanFrameSize,
                height: AppDimensions.scanFrameSize,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.guidelineColor,
                      width: AppDimensions.guidelineThickness,
                    ),
                    borderRadius: BorderRadius.circular(
                      AppDimensions.borderRadiusL,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        if (!isProcessing)
          Positioned(
            bottom: AppDimensions.paddingL,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: AppDimensions.actionButtonSize,
                height: AppDimensions.actionButtonSize,
                child: FloatingActionButton(
                  onPressed: onCapture,
                  backgroundColor: AppColors.primary,
                  child: const Icon(Icons.camera_alt),
                ),
              ),
            ),
          ),
        if (isProcessing) const ScanningAnimation(),
      ],
    );
  }
}
