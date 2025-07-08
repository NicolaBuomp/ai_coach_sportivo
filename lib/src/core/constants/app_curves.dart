import 'package:flutter/animation.dart';

/// A collection of standardized animation curves for a modern, responsive UI (2025).
class AppCurves {
  // === STANDARD EASING CURVES ===

  /// The default curve for most animations. A good balance of acceleration and deceleration.
  static const Curve standard = Curves.easeInOut;

  /// An ease-out curve, where the animation starts fast and slows down at the end.
  /// Good for elements entering the screen.
  static const Curve easeOut = Curves.easeOut;

  /// An ease-in curve, where the animation starts slow and speeds up at the end.
  /// Good for elements exiting the screen.
  static const Curve easeIn = Curves.easeIn;

  /// A fast-in, slow-out curve. Creates a more energetic and responsive feel.
  static const Curve fastOutSlowIn = Curves.fastOutSlowIn;

  // === DYNAMIC & EXPRESSIVE CURVES ===

  /// An "overshoot" curve that goes slightly beyond its target before settling.
  /// Creates a playful, bouncy effect.
  static const Curve overshoot = Curves.elasticOut;

  /// A curve that simulates a bouncing effect. Use sparingly for high-impact moments.
  static const Curve bounce = Curves.bounceOut;

  /// A custom cubic curve that provides a snappy, responsive feel.
  /// Great for quick interactions and feedback.
  static const Cubic snappy = Cubic(0.3, 1.5, 0.7, 1.0);

  /// A custom cubic curve that creates a smooth, decelerating motion.
  /// Ideal for scrolling or panning animations.
  static const Cubic decelerate = Cubic(0.0, 0.0, 0.2, 1.0);
}
