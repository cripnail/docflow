import 'package:flutter/material.dart';

abstract class AppColors {
  static const backgroundGray = Color(0xFFF2F4FF);
  static const buttonBlue = Color(0xFF364EFF);
  static const buttonPurple = Color(0xFF5436FF);
  static const inactiveGray = Color(0xFFF5F5F5);

  static final buttonGradient = LinearGradient(
    colors: [buttonBlue, buttonPurple],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // Primary Colors
  static const primary = Color(0xFFFF6B00);
  static const secondary = Color(0xFF2C3E50);
  static const searchBackground = Color(0xFFF5F5F5);
  static const textPrimary = Color(0xFF000000);
  static const textSecondary = Color(0xFF757575);

  // Background Colors
  static const background = Color(0xFFFFFFFF);
  static const overlayBackground = Color(0x99000000);

  // Onboarding specific
  static const onboardingBackground = Color(0xFF4B5EFC);
  static const onboardingDotInactive = Colors.white54;

  // Status Colors
  static const success = Color(0xFF27AE60);
  static const error = Color(0xFFE74C3C);
  static const warning = Color(0xFFF1C40F);

  static const textLight = Color(0xFFFFFFFF);
  static const primaryOrange = Color(0xFFFF6B00);
  static const cardBackground = Color(0xFFF5F5F5);

  // Paywall colors
  static const paywallBackground = Color(0xFF4B5EFC);
  static const paywallProBadge = Color(0xFFFFBE3C);
  static const paywallText = Color(0xFFFFFFFF);
  static const paywallButton = Color(0xFFFFFFFF);
  static const paywallButtonText = Color(0xFF4B5EFC);
  static const paywallOverlay = Color(0x1AFFFFFF);
  static const paywallProText = Color(0xFF000000);

  // Feature item colors
  static const featureItemBackground = Color(0x1AFFFFFF);
  static const featureItemIcon = Color(0xFFFFFFFF);
  static const featureItemText = Color(0xFFFFFFFF);

  // Paywall specific colors
  static const paywallCard = Color(0xFF4B5EFC);
  static const paywallListTileBackground = Color(0xFFF5F7FF);
  static const paywallLightText = Color(0xFFFFFFFF);

  // Scanner
  static const guidelineColor = Color(0xFFFF6B00);
  static const overlayScrim = Color(0x99000000);

  // Indicator colors
  static const dotIndicatorActive = primary;
  static const dotIndicatorInactive = Color(0xFFE0E0E0);
}
