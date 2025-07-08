import 'package:flutter/material.dart';
import '../config/theme/app_colors.dart';

/// A collection of modern, sporty gradients for the app design system (2025).
class AppGradients {
  // === CORE GRADIENTS ===

  /// A vibrant, modern gradient for primary buttons and key UI elements.
  static const LinearGradient primary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.gradientStart, AppColors.gradientEnd],
  );

  /// An energetic gradient for accents, highlights, and calls-to-action.
  static const LinearGradient accent = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.accentGradientStart, AppColors.accentGradientEnd],
  );

  // === UI & BACKGROUND GRADIENTS ===

  /// A subtle gradient for card backgrounds to add depth.
  static final LinearGradient card = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.lightSurface, AppColors.lightSurface.withOpacity(0.95)],
  );

  /// A subtle gradient for dark mode card backgrounds.
  static final LinearGradient cardDark = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.darkSurface, AppColors.darkSurface.withOpacity(0.95)],
  );

  /// A soft gradient for the main app background in light mode.
  static final LinearGradient backgroundLight = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.lightBackground,
      AppColors.lightBackground.withOpacity(0.98),
    ],
    stops: const [0.0, 1.0],
  );

  /// A deep, subtle gradient for the main app background in dark mode.
  static final LinearGradient backgroundDark = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.almostBlack,
      const Color(0xFF1A1A1A), // Slightly lighter than pure black
    ],
  );

  // === SPECIALTY GRADIENTS ===

  /// A shimmer gradient for loading placeholders and skeleton screens.
  static final LinearGradient shimmer = LinearGradient(
    begin: const Alignment(-1.0, -0.5),
    end: const Alignment(1.0, 0.5),
    colors: <Color>[
      AppColors.midGrey.withOpacity(0.1),
      AppColors.midGrey.withOpacity(0.3),
      AppColors.midGrey.withOpacity(0.1),
    ],
    stops: const <double>[0.4, 0.5, 0.6],
  );

  /// A shimmer gradient for loading placeholders in dark mode.
  static final LinearGradient shimmerDark = LinearGradient(
    begin: const Alignment(-1.0, -0.5),
    end: const Alignment(1.0, 0.5),
    colors: <Color>[
      AppColors.darkGrey.withOpacity(0.2),
      AppColors.darkGrey.withOpacity(0.5),
      AppColors.darkGrey.withOpacity(0.2),
    ],
    stops: const <double>[0.4, 0.5, 0.6],
  );

  /// A gradient overlay for images to ensure text readability.
  static const LinearGradient imageOverlay = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [Color(0xCC000000), Color(0x00000000)],
    stops: [0.0, 0.6],
  );
}
