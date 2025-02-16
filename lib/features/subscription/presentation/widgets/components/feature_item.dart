import 'package:flutter/material.dart';

import '../../../../../core/constants/dimensions.dart';

class FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const FeatureItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppDimensions.paddingXS),
      child: Row(
        children: [
          Icon(icon, size: AppDimensions.iconS),
          SizedBox(width: AppDimensions.spacingS),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
