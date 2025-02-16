import 'package:flutter/material.dart';
import 'package:docflow/core/constants/dimensions.dart';
import 'package:docflow/core/constants/strings.dart';

class SubscriptionActiveView extends StatelessWidget {
  const SubscriptionActiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.check_circle_outline,
            size: AppDimensions.iconL,
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(height: AppDimensions.spacingM),
          Text(
            AppStrings.subscriptionActive,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
