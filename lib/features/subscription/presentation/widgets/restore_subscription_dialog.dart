import 'package:docflow/core/constants/strings.dart';
import 'package:flutter/material.dart';

class RestoreSubscriptionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppStrings.noActiveSubscription),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(AppStrings.maybeLaterButton),
        ),
      ],
    );
  }
}
