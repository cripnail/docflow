import 'package:docflow/features/subscription/presentation/widgets/subscription_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:docflow/core/services/revenue_cat_service.dart';
import 'package:docflow/features/subscription/domain/models/subscription_event.dart';
import 'package:docflow/features/subscription/presentation/bloc/subscription_bloc.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubscriptionBloc(
        context.read<RevenueCatService>(),
      )..add(const CheckSubscriptionStatus()),
      child: const SubscriptionView(),
    );
  }
}
