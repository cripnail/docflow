import 'package:flutter/material.dart';
import 'package:docflow/core/constants/dimensions.dart';
import 'package:docflow/core/constants/strings.dart';
import 'package:docflow/features/document_scanner/domain/models/scan_result.dart';

import '../../../../core/constants/enums.dart';

class ScanStatusView extends StatelessWidget {
  final ScanResult result;
  final VoidCallback onRetry;
  final VoidCallback onSave;

  const ScanStatusView({
    super.key,
    required this.result,
    required this.onRetry,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          result.status == ScanStatus.success
              ? AppStrings.scanSuccess
              : AppStrings.scanFailed,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: AppDimensions.spacingM),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: onRetry,
              child: Text(AppStrings.retryScanning),
            ),
            if (result.status == ScanStatus.success) ...[
              SizedBox(width: AppDimensions.spacingS),
              ElevatedButton(
                onPressed: onSave,
                child: Text(AppStrings.saveDocument),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
