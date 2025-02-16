import 'package:docflow/features/document_list/presentation/widgets/empty_state_painter.dart';
import 'package:flutter/material.dart';
import 'package:docflow/core/constants/dimensions.dart';

class EmptyStateIllustration extends StatelessWidget {
  const EmptyStateIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(
        AppDimensions.emptyStateWidth,
        AppDimensions.emptyStateHeight,
      ),
      painter: EmptyStatePainter(),
    );
  }
}
