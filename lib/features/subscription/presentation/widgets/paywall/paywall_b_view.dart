import 'package:docflow/core/constants/colors.dart';
import 'package:docflow/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:docflow/core/constants/dimensions.dart';

class PaywallBView extends StatelessWidget {
  final VoidCallback? onTryFreePressed;
  final VoidCallback? onRestorePressed;

  const PaywallBView({
    super.key,
    this.onTryFreePressed,
    this.onRestorePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.paywallBackground,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.paddingM),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppStrings.premiumDocumentSignature,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.paywallText,
                    ),
                textAlign: TextAlign.center,
              ),
              Text(
                AppStrings.signDocumentsAnywhere,
                style: TextStyle(color: AppColors.paywallText),
                textAlign: TextAlign.center,
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.paywallButton,
                  foregroundColor: AppColors.paywallButtonText,
                ),
                onPressed: onTryFreePressed,  // Убеждаемся что колбэк вызывается
                child: Text(AppStrings.tryForFree),
              )
            ],
          ),
        ),
      ),
    );
  }
}
