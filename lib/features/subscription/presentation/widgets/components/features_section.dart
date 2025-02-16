import 'package:flutter/material.dart';

import '../../../../../core/constants/dimensions.dart';
import '../../../../../core/constants/strings.dart';
import 'feature_item.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingS,
        vertical: AppDimensions.paddingM,
      ),
      child: Column(
        children: [
          FeatureItem(
            icon: Icons.file_copy,
            title: AppStrings.featureUnlimitedDocs,
          ),
          FeatureItem(
            icon: Icons.share,
            title: AppStrings.featureSharing,
          ),
          FeatureItem(
            icon: Icons.print,
            title: AppStrings.featurePrinting,
          ),
        ],
      ),
    );
  }
}
