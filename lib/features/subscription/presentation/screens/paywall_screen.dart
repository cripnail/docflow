import 'package:docflow/core/constants/strings.dart';
import 'package:docflow/core/di/injection_container.dart' as di;
import 'package:docflow/core/services/revenue_cat_service.dart';
import 'package:docflow/core/shared/widgets/loading_indicator.dart';
import 'package:docflow/features/documents/presentation/screens/documents_screen.dart';
import 'package:docflow/features/subscription/presentation/widgets/paywall/paywall_a_view.dart';
import 'package:docflow/features/subscription/presentation/widgets/paywall/paywall_b_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:docflow/features/subscription/domain/models/subscription_event.dart';
import 'package:docflow/features/subscription/domain/models/subscription_state.dart';
import 'package:docflow/features/subscription/presentation/bloc/subscription_bloc.dart';

class PaywallScreen extends StatelessWidget {
  final bool showCloseButton;
  final VoidCallback? onSuccess;
  final bool isModal;

  const PaywallScreen({
    super.key,
    this.showCloseButton = true,
    this.onSuccess,
    this.isModal = false,
  });

  void _handleSubscriptionSuccess(BuildContext context, bool isRestore) {
    if (isModal) {
      onSuccess?.call();
      Navigator.of(context).pop(true);
    } else {
      print("Navigating to Documents Screen");
      final documentsScreen = const DocumentsScreen();
      print("Screen to navigate: ${documentsScreen.runtimeType}");

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => documentsScreen,
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          di.sl<SubscriptionBloc>()..add(const CheckSubscriptionStatus()),
      child: BlocConsumer<SubscriptionBloc, SubscriptionState>(
        listener: (context, state) {
          if (state is SubscriptionActive) {
            _handleSubscriptionSuccess(context, state.isRestore);
          } else if (state is SubscriptionError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: showCloseButton
                ? AppBar(
                    leading: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  )
                : null,
            body: Stack(
              children: [
                FutureBuilder<String>(
                  future: di.sl<RevenueCatService>().getMetadataString(
                        AppStrings.paywallKeyMetadata,
                        AppStrings.variantDefaultValue,
                      ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const LoadingIndicator();
                    }
                    final variant =
                        snapshot.data ?? AppStrings.variantDefaultValue;

                    if (variant == AppStrings.variantBValue) {
                      return PaywallBView(
                        onTryFreePressed: () => context
                            .read<SubscriptionBloc>()
                            .add(const PurchaseSubscription()),
                        onRestorePressed: () => context
                            .read<SubscriptionBloc>()
                            .add(const RestoreSubscription()),
                      );
                    }

                    return PaywallA(
                      onPurchase: () => context
                          .read<SubscriptionBloc>()
                          .add(const PurchaseSubscription()),
                      onRestore: () => context
                          .read<SubscriptionBloc>()
                          .add(const RestoreSubscription()),
                    );
                  },
                ),
                if (state is SubscriptionLoading)
                  Container(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
