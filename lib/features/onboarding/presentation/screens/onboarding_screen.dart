import 'package:flutter/material.dart';
import 'package:docflow/core/constants/assets.dart';
import 'package:docflow/core/constants/colors.dart';
import 'package:docflow/core/constants/dimensions.dart';
import 'package:docflow/core/constants/strings.dart';
import 'package:docflow/features/subscription/presentation/screens/paywall_screen.dart';
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
        duration: Duration(milliseconds: AppDimensions.onboardingAnimationDuration),
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
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: _pageController,
        itemCount: _images.length,
        onPageChanged: (page) => setState(() => _currentPage = page),
        itemBuilder: (context, index) => Center(
          child: Image.asset(
            _images[index],
            fit: BoxFit.contain,
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(AppDimensions.paddingM),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: _onNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.buttonBlue,
                minimumSize: Size(double.infinity, AppDimensions.buttonHeight),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimensions.buttonRadius),
                ),
              ),
              child: Text(
                AppStrings.onboardingContinueButton,
                style: TextStyle(
                  color: AppColors.textLight,
                  fontSize: AppDimensions.bodySize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: AppDimensions.spacingM),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _images.length,
                    (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: AppDimensions.spacingXS),
                  width: AppDimensions.dotIndicatorSize,
                  height: AppDimensions.dotIndicatorSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? AppColors.dotIndicatorActive
                        : AppColors.dotIndicatorInactive,
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
