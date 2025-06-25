/// Costanti per le durate delle animazioni
class AppDurations {
  // === ANIMAZIONI STANDARD ===
  static const Duration instant = Duration.zero;
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration verySlow = Duration(milliseconds: 800);

  // === TRANSIZIONI DI PAGINA ===
  static const Duration pageTransition = Duration(milliseconds: 300);
  static const Duration modalTransition = Duration(milliseconds: 250);
  static const Duration bottomSheetTransition = Duration(milliseconds: 300);

  // === ANIMAZIONI UI ===
  static const Duration buttonPress = Duration(milliseconds: 100);
  static const Duration buttonRelease = Duration(milliseconds: 150);
  static const Duration ripple = Duration(milliseconds: 300);
  static const Duration fade = Duration(milliseconds: 200);
  static const Duration scale = Duration(milliseconds: 200);
  static const Duration slide = Duration(milliseconds: 300);

  // === LOADING & FEEDBACK ===
  static const Duration loading = Duration(milliseconds: 1500);
  static const Duration toast = Duration(seconds: 3);
  static const Duration snackbar = Duration(seconds: 4);
  static const Duration splash = Duration(seconds: 2);

  // === SPORT SPECIFIC ===
  static const Duration workoutTimer = Duration(seconds: 1);
  static const Duration restTimer = Duration(milliseconds: 500);
  static const Duration progressUpdate = Duration(milliseconds: 100);
  static const Duration heartRateUpdate = Duration(milliseconds: 250);

  // === GLASSMORPHISM ===
  static const Duration glassAppear = Duration(milliseconds: 400);
  static const Duration glassDisappear = Duration(milliseconds: 200);
}
