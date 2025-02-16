import 'package:docflow/features/subscription/presentation/widgets/paywall/paywall_a_view.dart';
import 'package:docflow/features/subscription/presentation/widgets/paywall/paywall_b_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:docflow/core/services/revenue_cat_service.dart';
import 'package:docflow/core/shared/widgets/loading_indicator.dart';
import 'package:docflow/core/constants/strings.dart';
import 'package:docflow/features/subscription/domain/models/subscription_state.dart';
import 'package:docflow/features/subscription/presentation/bloc/subscription_bloc.dart';

class PaywallView extends StatelessWidget {
  const PaywallView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscriptionBloc, SubscriptionState>(
      builder: (context, state) {
        return FutureBuilder<String>(
          future: context.read<RevenueCatService>().getMetadataString(
                AppStrings.paywallKeyMetadata,
                AppStrings.variantDefaultValue,
              ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingIndicator();
            }
            final variant = snapshot.data ?? AppStrings.variantDefaultValue;
            return variant == AppStrings.variantBValue
                ? const PaywallBView()
                : const PaywallAView();
          },
        );
      },
    );
  }
}
