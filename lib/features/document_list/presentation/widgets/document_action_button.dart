import 'package:flutter/material.dart';
import 'package:docflow/core/constants/dimensions.dart';
import 'package:docflow/core/constants/colors.dart';

class DocumentActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const DocumentActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimensions.borderRadiusM),
      child: Container(
        padding: EdgeInsets.all(AppDimensions.paddingM),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppDimensions.borderRadiusM),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: AppDimensions.iconM),
            SizedBox(height: AppDimensions.spacingS),
            Text(label),
          ],
        ),
      ),
    );
  }
}
