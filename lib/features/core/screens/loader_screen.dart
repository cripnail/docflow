import 'package:flutter/material.dart';
import 'package:docflow/core/widgets/app_loader.dart';
import 'package:docflow/features/onboarding/presentation/screens/onboarding_screen.dart';

class LoaderScreen extends StatefulWidget {
  const LoaderScreen({super.key});

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  @override
  void initState() {
    super.initState();
    _initAndNavigate();
  }

  Future<void> _initAndNavigate() async {
    // Simulate initialization delay
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;

    // Navigate to onboarding
    _navigateToOnboarding();
  }

  void _navigateToOnboarding() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const OnboardingScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AppLoader(),
    );
  }
}
