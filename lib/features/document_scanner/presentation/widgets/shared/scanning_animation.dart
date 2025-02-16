import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:docflow/core/constants/assets.dart';
import 'package:docflow/core/constants/dimensions.dart';
import 'package:docflow/core/constants/colors.dart';

class ScanningAnimation extends StatelessWidget {
  const ScanningAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: AppDimensions.scanAnimationSize,
        height: AppDimensions.scanAnimationSize,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(AppDimensions.borderRadiusL),
        ),
        child: Lottie.asset(
          AppAssets.loaderAnimation,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
