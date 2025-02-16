import 'package:docflow/features/onboarding/presentation/widgets/onboarding_item_widget.dart';
import 'package:docflow/features/subscription/presentation/screens/paywall_screen.dart';
import 'package:flutter/material.dart';
import 'package:docflow/core/constants/assets.dart';
import 'package:docflow/core/constants/colors.dart';
import 'package:docflow/core/constants/dimensions.dart';
import 'package:docflow/core/constants/strings.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _images = [
    AppAssets.onboardingOne,
    AppAssets.onboardingTwo,
  ];

  void _onNext() {
    if (_currentPage < _images.length - 1) {
      _pageController.nextPage(
        duration:
            Duration(milliseconds: AppDimensions.onboardingAnimationDuration),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const PaywallScreen(
            showCloseButton: false,
            isModal: false,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onboardingBackground,
      body: PageView.builder(
        controller: _pageController,
        itemCount: _images.length,
        onPageChanged: (page) => setState(() => _currentPage = page),
        itemBuilder: (context, index) => OnboardingItemWidget(
          imagePath: _images[index],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(AppDimensions.onboardingBottomPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              height: AppDimensions.onboardingButtonHeight,
              child: ElevatedButton(
                onPressed: _onNext,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5436FF),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppDimensions.onboardingButtonRadius,
                    ),
                  ),
                ),
                child: Text(
                  AppStrings.onboardingContinueButton,
                  style: TextStyle(
                    fontSize: AppDimensions.onboardingButtonTextSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: AppDimensions.onboardingBottomPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _images.length,
                (index) => Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: AppDimensions.onboardingDotSpacing,
                  ),
                  width: AppDimensions.onboardingDotSize,
                  height: AppDimensions.onboardingDotSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? AppColors.background
                        : AppColors.onboardingDotInactive,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
