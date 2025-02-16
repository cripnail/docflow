import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:docflow/core/shared/widgets/error_view.dart';
import 'package:docflow/core/shared/widgets/loading_indicator.dart';
import 'package:docflow/features/subscription/domain/models/subscription_state.dart';
import 'package:docflow/features/subscription/presentation/bloc/subscription_bloc.dart';
import 'package:docflow/features/subscription/presentation/widgets/components/subscription_active_view.dart';
import 'package:docflow/features/subscription/presentation/widgets/paywall_view.dart';

class SubscriptionView extends StatelessWidget {
  const SubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SubscriptionBloc, SubscriptionState>(
        builder: (context, state) {
          return switch (state) {
            SubscriptionLoading() => const LoadingIndicator(),
            SubscriptionActive() => const SubscriptionActiveView(),
            SubscriptionInactive() => const PaywallView(),
            SubscriptionError(message: final message) =>
              ErrorView(message: message),
            _ => const SizedBox.shrink(),
          };
        },
      ),
    );
  }
}
