import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ai_coach_sportivo/src/features/onboarding/data/onboarding_repository.dart';

class LocaleNotifier extends StateNotifier<Locale?> {
  LocaleNotifier(this._prefs) : super(null) {
    _loadSavedLocale();
  }

  final SharedPreferences _prefs;
  static const String _localeKey = 'saved_locale';

  void _loadSavedLocale() {
    final savedLocaleCode = _prefs.getString(_localeKey);
    if (savedLocaleCode != null) {
      state = Locale(savedLocaleCode);
    }
  }

  Future<void> setLocale(Locale locale) async {
    await _prefs.setString(_localeKey, locale.languageCode);
    state = locale;
  }

  Future<void> toggleLocale() async {
    final currentLocale = state?.languageCode ?? 'en';
    final newLocaleCode = currentLocale == 'en' ? 'it' : 'en';
    await setLocale(Locale(newLocaleCode));
  }

  Future<void> resetToSystem() async {
    await _prefs.remove(_localeKey);
    state = null;
  }
}

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale?>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return LocaleNotifier(prefs);
});
