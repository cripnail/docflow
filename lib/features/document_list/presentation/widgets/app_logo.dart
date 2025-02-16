import 'package:flutter/material.dart';
import 'package:docflow/core/constants/colors.dart';
import 'package:docflow/core/constants/dimensions.dart';
import 'package:docflow/core/constants/strings.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDimensions.paddingM),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.signText,
            style: TextStyle(
              fontSize: AppDimensions.titleSize,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            AppStrings.itText,
            style: TextStyle(
              fontSize: AppDimensions.titleSize,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
