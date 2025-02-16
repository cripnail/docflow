import 'package:flutter/material.dart';

import '../../../../../core/constants/dimensions.dart';
import '../../../../../core/constants/strings.dart';

class PricingSection extends StatelessWidget {
  const PricingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDimensions.paddingS),
      child: Column(
        children: [
          Text(
            AppStrings.subscriptionPrice,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: AppDimensions.spacingXS),
          Text(
            AppStrings.subscriptionPeriod,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
