import 'package:docflow/core/constants/colors.dart';
import 'package:docflow/core/constants/dimensions.dart';
import 'package:docflow/core/constants/strings.dart';
import 'package:flutter/material.dart';

class ToolsScreen extends StatelessWidget {
  const ToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(AppDimensions.paddingM),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.toolsTitle,
                    style: TextStyle(
                      fontSize: AppDimensions.headlineSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      size: AppDimensions.iconM,
                      color: AppColors.textPrimary,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(AppDimensions.paddingM),
                children: [
                  _buildToolItem(
                    icon: Icons.document_scanner,
                    title: AppStrings.scan,
                    onTap: () {},
                  ),
                  SizedBox(height: AppDimensions.spacingM),
                  _buildToolItem(
                    icon: Icons.photo_library,
                    title: AppStrings.gallery,
                    onTap: () {},
                  ),
                  SizedBox(height: AppDimensions.spacingM),
                  _buildToolItem(
                    icon: Icons.folder_open,
                    title: AppStrings.files,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToolItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Material(
      color: AppColors.cardBackground,
      borderRadius: BorderRadius.circular(AppDimensions.borderRadiusM),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimensions.borderRadiusM),
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.paddingM),
          child: Row(
            children: [
              Icon(
                icon,
                size: AppDimensions.iconM,
                color: AppColors.buttonBlue,
              ),
              SizedBox(width: AppDimensions.spacingM),
              Text(
                title,
                style: TextStyle(
                  fontSize: AppDimensions.bodySize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: AppDimensions.iconS,
                color: AppColors.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
