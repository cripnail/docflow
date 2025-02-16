import 'package:docflow/core/constants/colors.dart';
import 'package:docflow/core/constants/dimensions.dart';
import 'package:docflow/core/constants/text_styles.dart';
import 'package:docflow/features/document_list/presentation/widgets/add_document_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:docflow/core/constants/strings.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const BottomNavigation({
    super.key,
    this.selectedIndex = 0,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(AppDimensions.paddingM),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: _buildTab(
                      isSelected: selectedIndex == 0,
                      label: AppStrings.documents,
                      onTap: () => onItemSelected(0),
                    ),
                  ),
                  SizedBox(width: AppDimensions.spacingS),
                  Expanded(
                    child: _buildTab(
                      isSelected: selectedIndex == 1,
                      label: AppStrings.tools,
                      onTap: () => onItemSelected(1),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: AppDimensions.spacingS),
            Container(
              decoration: BoxDecoration(
                gradient: AppColors.buttonGradient,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const AddDocumentBottomSheet(),
                  );
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: AppDimensions.iconM,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab({
    required bool isSelected,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.navigationHorizontalPadding,
          vertical: AppDimensions.navigationVerticalPadding,
        ),
        decoration: BoxDecoration(
          gradient: isSelected ? AppColors.buttonGradient : null,
          color: isSelected ? null : AppColors.inactiveGray,
          borderRadius:
              BorderRadius.circular(AppDimensions.navigationBorderRadius),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? AppColors.textLight : AppColors.textSecondary,
            fontWeight: AppTextStyles.fontWeightMedium,
          ),
        ),
      ),
    );
  }
}
