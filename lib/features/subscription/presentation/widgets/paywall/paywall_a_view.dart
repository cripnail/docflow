import 'package:docflow/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:docflow/core/constants/dimensions.dart';
import 'package:docflow/core/constants/strings.dart';
import 'package:docflow/core/constants/colors.dart';

class PaywallAView extends StatelessWidget {
  final VoidCallback? onTryFreePressed;
  final VoidCallback? onRestorePressed;

  const PaywallAView({
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
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildFeatureCard(context),
                      SizedBox(height: AppDimensions.spacingL),
                      _buildPricingOptions(),
                    ],
                  ),
                ),
              ),
              _buildBottomSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.paddingM),
      decoration: BoxDecoration(
        color: AppColors.paywallCard,
        borderRadius: BorderRadius.circular(AppDimensions.borderRadiusL),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildLogo(),
          SizedBox(height: AppDimensions.spacingL),
          Text(
            AppStrings.premiumDocumentSignature,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.paywallLightText,
                ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppDimensions.spacingS),
          Text(
            AppStrings.signDocumentsAnywhere,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.paywallLightText,
                ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppDimensions.spacingXL),
          _buildFeaturesList(),
        ],
      ),
    );
  }

  Widget _buildFeaturesList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: _buildFeatureItem(
            icon: Icons.all_inclusive,
            label: AppStrings.unlimitedSignatures,
          ),
        ),
        Expanded(
          child: _buildFeatureItem(
            icon: Icons.document_scanner,
            label: AppStrings.documentScanner,
          ),
        ),
        Expanded(
          child: _buildFeatureItem(
            icon: Icons.block,
            label: AppStrings.adFreeExperience,
          ),
        ),
      ],
    );
  }

  Widget _buildPricingOptions() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildPricingOption(
          title: AppStrings.threeDayTrial,
          subtitle: AppStrings.weeklyPrice,
          price: AppStrings.trialPrice,
        ),
        SizedBox(height: AppDimensions.spacingM),
        _buildPricingOption(
          title: AppStrings.annualPlan,
          subtitle: AppStrings.enjoyAccess,
          price: AppStrings.annualPrice,
        ),
      ],
    );
  }


  Widget _buildBottomSection(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: AppStyles.elevatedButtonStyle.copyWith(
              backgroundColor: WidgetStateProperty.all(AppColors.paywallCard),
              foregroundColor: WidgetStateProperty.all(AppColors.paywallLightText),
            ),
            // Здесь основная проблема - onTryFreePressed не вызывался
            onPressed: onTryFreePressed,  // Теперь вызываем колбэк
            child: Text(AppStrings.tryForFree),
          ),
        ),
        SizedBox(height: AppDimensions.spacingM),
        _buildFooterButtons(context),
      ],
    );
  }

  Widget _buildFooterButtons(BuildContext context) {
    final buttonStyle = AppStyles.textButtonStyle.copyWith(
      minimumSize: MaterialStateProperty.all(const Size(80, 36)),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 8),
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          style: buttonStyle,
          onPressed: () {},
          child: Text(
            AppStrings.terms,
            style: TextStyle(color: AppColors.paywallText),
          ),
        ),
        TextButton(
          style: buttonStyle,
          onPressed: () {},
          child: Text(
            AppStrings.privacy,
            style: TextStyle(color: AppColors.paywallText),
          ),
        ),
        TextButton(
          style: buttonStyle,
          onPressed: onRestorePressed, // Используем переданный колбэк
          child: Text(
            AppStrings.restore,
            style: TextStyle(color: AppColors.paywallText),
          ),
        ),
      ],
    );
  }
}

Widget _buildLogo() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        'Sign',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
      const Text(
        'it',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic,
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 8),
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          color: AppColors.paywallProBadge,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'PRO',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}

Widget _buildFeatureItem({
  required IconData icon,
  required String label,
}) {
  return Column(
    children: [
      Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 32,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
        textAlign: TextAlign.center,
      ),
    ],
  );
}

Widget _buildPricingOption({
  required String title,
  required String subtitle,
  required String price,
}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.1),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 12,
              ),
            ),
          ],
        ),
        Text(
          price,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ],
    ),
  );
}
