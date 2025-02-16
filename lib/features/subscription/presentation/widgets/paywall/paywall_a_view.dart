import 'package:docflow/core/constants/colors.dart';
import 'package:docflow/core/constants/dimensions.dart';
import 'package:docflow/core/constants/strings.dart';
import 'package:docflow/core/widgets/app_loader.dart';
import 'package:flutter/material.dart';

class PaywallA extends StatefulWidget {
  final VoidCallback onPurchase;
  final VoidCallback onRestore;

  const PaywallA({
    super.key,
    required this.onPurchase,
    required this.onRestore,
  });

  @override
  State<PaywallA> createState() => _PaywallAState();
}

class _PaywallAState extends State<PaywallA> {
  bool _isLoading = false;

  void _handlePurchase() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 500));
    widget.onPurchase();
    if (mounted) setState(() => _isLoading = false);
  }

  void _handleRestore() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 500));
    widget.onRestore();
    if (mounted) setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: Colors.white,
        body: AppLoader(),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Добавлено изображение
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppDimensions.paddingL),
                child: Image.asset(
                  'assets/images/paywall_top.png',
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(AppDimensions.paddingL),
                child: Column(
                  children: [
                    _buildSubscriptionOption(
                      title: AppStrings.threeDayTrial,
                      subtitle: AppStrings.weeklyPrice,
                      price: AppStrings.trialPrice,
                      onTap: _handlePurchase,
                      isPrimary: true,
                    ),
                    SizedBox(height: AppDimensions.spacingM),
                    _buildSubscriptionOption(
                      title: AppStrings.annualPlan,
                      subtitle: AppStrings.enjoyAccess,
                      price: AppStrings.annualPrice,
                      onTap: _handlePurchase,
                      isPrimary: false,
                    ),
                    SizedBox(height: AppDimensions.spacingL),
                    ElevatedButton(
                      onPressed: _handlePurchase,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonBlue,
                        minimumSize:
                            Size(double.infinity, AppDimensions.buttonHeight),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(AppDimensions.buttonRadius),
                        ),
                      ),
                      child: Text(
                        AppStrings.tryForFree,
                        style: TextStyle(
                          color: AppColors.textLight,
                          // Изменен цвет текста на белый
                          fontSize: AppDimensions.bodySize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimensions.spacingM),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(AppStrings.terms),
                        ),
                        SizedBox(width: AppDimensions.spacingM),
                        TextButton(
                          onPressed: () {},
                          child: Text(AppStrings.privacy),
                        ),
                        SizedBox(width: AppDimensions.spacingM),
                        TextButton(
                          onPressed: _handleRestore,
                          child: Text(AppStrings.restore),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubscriptionOption({
    required String title,
    required String subtitle,
    required String price,
    required VoidCallback onTap,
    required bool isPrimary,
  }) {
    return Material(
      color: isPrimary ? AppColors.buttonBlue : AppColors.cardBackground,
      borderRadius: BorderRadius.circular(AppDimensions.borderRadiusM),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimensions.borderRadiusM),
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.paddingM),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: AppDimensions.bodySize,
                      fontWeight: FontWeight.bold,
                      color: isPrimary
                          ? AppColors.textLight
                          : Colors.black,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: AppDimensions.fontSizeXS,
                      color: isPrimary
                          ? AppColors.textLight.withOpacity(0.7)
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
              Text(
                price,
                style: TextStyle(
                  fontSize: AppDimensions.headlineSize,
                  fontWeight: FontWeight.bold,
                  color: isPrimary
                      ? AppColors.textLight
                      : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
