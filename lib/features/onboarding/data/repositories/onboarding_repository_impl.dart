import 'package:docflow/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final SharedPreferences _prefs;
  static const _keyFirstLaunch = 'is_first_launch';
  static const _keyRatingRequested = 'rating_requested';

  OnboardingRepositoryImpl(this._prefs);

  @override
  Future<bool> isFirstLaunch() async {
    return _prefs.getBool(_keyFirstLaunch) ?? true;
  }

  @override
  Future<void> completeOnboarding() async {
    await _prefs.setBool(_keyFirstLaunch, false);
  }

  @override
  Future<void> requestRating() async {
    await _prefs.setBool(_keyRatingRequested, true);
  }
}
