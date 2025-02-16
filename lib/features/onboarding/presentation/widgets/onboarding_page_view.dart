import 'package:docflow/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:docflow/core/constants/dimensions.dart';
import 'package:docflow/features/onboarding/domain/models/onboarding_page.dart';

class OnboardingPageView extends StatelessWidget {
  final OnboardingPage page;

  const OnboardingPageView({
    super.key,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDimensions.paddingM),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            page.title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.background,
                ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppDimensions.spacingM),
          Text(
            page.description,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.background,
                ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppDimensions.spacingXL),
          Expanded(
            child: Image.asset(
              page.imagePath,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
