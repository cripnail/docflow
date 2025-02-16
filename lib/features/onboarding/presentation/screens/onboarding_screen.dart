import 'package:docflow/features/subscription/presentation/screens/paywall_screen.dart';
import 'package:flutter/material.dart';
import 'package:docflow/core/constants/assets.dart';
import 'package:docflow/core/constants/colors.dart';
import 'package:docflow/core/constants/dimensions.dart';
import 'package:docflow/core/constants/strings.dart';
import 'package:docflow/features/onboarding/domain/models/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      title: AppStrings.onboardingSignTitle,
      description: AppStrings.onboardingSignDesc,
      imagePath: AppAssets.onboardingOne,
    ),
    OnboardingPage(
      title: AppStrings.onboardingCreateTitle,
      description: AppStrings.onboardingCreateDesc,
      imagePath: AppAssets.onboardingTwo,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onboardingBackground,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (page) => setState(() => _currentPage = page),
                itemBuilder: (context, index) => _buildPage(_pages[index]),
              ),
            ),
            _buildBottomSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(OnboardingPage page) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.onboardingPaddingHorizontal,
        vertical: AppDimensions.onboardingPaddingVertical,
      ),
      child: Column(
        children: [
          Text(
            page.title,
            style: TextStyle(
              fontSize: AppDimensions.onboardingTitleSize,
              fontWeight: FontWeight.bold,
              color: AppColors.textLight,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppDimensions.spacingM),
          Text(
            page.description,
            style: TextStyle(
              fontSize: AppDimensions.onboardingDescSize,
              color: AppColors.textLight,
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Image.asset(
            page.imagePath,
            height: MediaQuery.of(context).size.height *
                AppDimensions.onboardingImageHeightFactor,
            fit: BoxFit.contain,
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildBottomSection() {
    return Padding(
      padding: EdgeInsets.all(AppDimensions.onboardingBottomPadding),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: AppDimensions.onboardingButtonHeight,
            child: ElevatedButton(
              onPressed: _onContinuePressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.background,
                foregroundColor: AppColors.onboardingBackground,
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
              _pages.length,
              (index) => GestureDetector(
                onTap: () => _onDotTapped(index),
                child: Container(
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
          ),
        ],
      ),
    );
  }

  void _onDotTapped(int index) {
    _pageController.animateToPage(
      index,
      duration:
          Duration(milliseconds: AppDimensions.onboardingAnimationDuration),
      curve: Curves.easeInOut,
    );
  }

  void _onContinuePressed() {
    if (_currentPage < _pages.length - 1) {
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
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
