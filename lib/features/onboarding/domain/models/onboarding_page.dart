class OnboardingPage {
  final String title;
  final String description;
  final String imagePath;
  final double imageScale;

  const OnboardingPage({
    required this.title,
    required this.description,
    required this.imagePath,
    this.imageScale = 1.0,
  });
}
