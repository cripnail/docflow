import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:docflow/core/constants/assets.dart';
import 'package:docflow/core/constants/strings.dart';
import 'package:docflow/core/constants/dimensions.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              AppAssets.loaderAnimation,
              width: AppDimensions.loaderSize,
              height: AppDimensions.loaderSize,
            ),
            SizedBox(height: AppDimensions.spacingM),
            Text(
              AppStrings.loading,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}