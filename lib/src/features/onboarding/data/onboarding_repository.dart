import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingRepository {
  OnboardingRepository(this.prefs);
  final SharedPreferences prefs;

  static const String _onboardingCompleteKey = 'onboardingComplete';

  Future<void> setOnboardingComplete() async {
    await prefs.setBool(_onboardingCompleteKey, true);
  }

  bool isOnboardingComplete() {
    return prefs.getBool(_onboardingCompleteKey) ?? false;
  }
}

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError(
    'SharedPreferencesProvider non è stato inizializzato',
  );
});

final onboardingRepositoryProvider = Provider<OnboardingRepository>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return OnboardingRepository(prefs);
});
