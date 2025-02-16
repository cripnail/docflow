import 'package:flutter/material.dart';

import '../../../../../core/constants/dimensions.dart';
import '../../../../../core/constants/strings.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDimensions.paddingS),
      child: Column(
        children: [
          Text(
            AppStrings.upgradeTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: AppDimensions.spacingXS),
          Text(
            AppStrings.upgradeSubtitle,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
