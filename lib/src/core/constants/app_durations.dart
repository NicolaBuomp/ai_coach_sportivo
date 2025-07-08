/// A collection of standardized animation durations for a modern, responsive UI (2025).
class AppDurations {
  // === CORE TIMINGS ===

  /// For animations that need to feel instant, like state changes.
  static const Duration ms100 = Duration(milliseconds: 100);

  /// A very fast animation, suitable for subtle feedback like hovers or fades.
  static const Duration ms200 = Duration(milliseconds: 200);

  /// The standard duration for most UI animations (e.g., transitions, expansions).
  static const Duration ms300 = Duration(milliseconds: 300);

  /// A slightly slower animation for larger or more significant transitions.
  static const Duration ms500 = Duration(milliseconds: 500);

  /// A slow animation, used for background elements or non-critical transitions.
  static const Duration ms800 = Duration(milliseconds: 800);

  // === UI COMPONENT-SPECIFIC DURATIONS ===

  /// Duration for page transitions.
  static const Duration pageTransition = ms300;

  /// Duration for modal, dialog, and bottom sheet transitions.
  static const Duration modalTransition = ms200;

  /// Duration for button press and other tap feedback animations.
  static const Duration tapFeedback = ms100;

  /// Duration for fade-in/out animations.
  static const Duration fade = ms200;

  /// Duration for scale and zoom animations.
  static const Duration scale = ms200;

  /// Duration for slide animations.
  static const Duration slide = ms300;

  // === NOTIFICATION & FEEDBACK DURATIONS ===

  /// How long a toast message is displayed.
  static const Duration toast = Duration(seconds: 3);

  /// How long a snackbar is displayed.
  static const Duration snackbar = Duration(seconds: 4);

  /// Duration for the splash screen.
  static const Duration splash = Duration(seconds: 2);

  /// Duration for shimmer/loading animations.
  static const Duration shimmer = Duration(milliseconds: 1500);
}
