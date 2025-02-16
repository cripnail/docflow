import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/strings.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../../core/constants/styles.dart';
import '../../../domain/models/subscription_event.dart';
import '../../bloc/subscription_bloc.dart';

class SubscriptionButtons extends StatelessWidget {
  const SubscriptionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDimensions.paddingS),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            style: AppStyles.elevatedButtonStyle,
            onPressed: () {
              context
                  .read<SubscriptionBloc>()
                  .add(const PurchaseSubscription());
            },
            child: Text(AppStrings.subscribe),
          ),
          SizedBox(height: AppDimensions.spacingS),
          TextButton(
            style: AppStyles.textButtonStyle,
            onPressed: () {
              context.read<SubscriptionBloc>().add(const RestoreSubscription());
            },
            child: Text(AppStrings.restorePurchase),
          ),
        ],
      ),
    );
  }
}
