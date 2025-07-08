import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../config/theme/app_colors.dart';

/// A collection of modern, sporty shadows for the app design system (2025).
class AppShadows {
  // === SUBTLE UI SHADOWS ===

  /// A very light shadow for subtle depth on UI elements like cards or containers.
  static final List<BoxShadow> subtle = [
    BoxShadow(
      color: AppColors.darkGrey.withOpacity(0.05),
      offset: const Offset(0, 4),
      blurRadius: 12,
      spreadRadius: -2,
    ),
  ];

  /// A slightly more pronounced shadow for interactive elements or highlighted cards.
  static final List<BoxShadow> medium = [
    BoxShadow(
      color: AppColors.darkGrey.withOpacity(0.1),
      offset: const Offset(0, 6),
      blurRadius: 16,
      spreadRadius: -4,
    ),
  ];

  /// A strong shadow for elevated elements like modals, dialogs, or floating action buttons.
  static final List<BoxShadow> strong = [
    BoxShadow(
      color: AppColors.darkGrey.withOpacity(0.15),
      offset: const Offset(0, 12),
      blurRadius: 24,
      spreadRadius: -6,
    ),
  ];

  // === COLORED GLOW SHADOWS ===

  /// A soft, colored glow effect using the primary color. Ideal for focused or active states.
  static final List<BoxShadow> primaryGlow = [
    BoxShadow(
      color: AppColors.primary.withOpacity(0.3),
      offset: const Offset(0, 5),
      blurRadius: 20,
      spreadRadius: -5,
    ),
  ];

  /// A vibrant glow effect using the accent color. Perfect for calls-to-action or special highlights.
  static final List<BoxShadow> accentGlow = [
    BoxShadow(
      color: AppColors.accent.withOpacity(0.35),
      offset: const Offset(0, 5),
      blurRadius: 20,
      spreadRadius: -5,
    ),
  ];

  /// A glow effect for success states.
  static final List<BoxShadow> successGlow = [
    BoxShadow(
      color: AppColors.success.withOpacity(0.3),
      offset: const Offset(0, 5),
      blurRadius: 20,
      spreadRadius: -5,
    ),
  ];

  /// A glow effect for error states.
  static final List<BoxShadow> errorGlow = [
    BoxShadow(
      color: AppColors.error.withOpacity(0.3),
      offset: const Offset(0, 5),
      blurRadius: 20,
      spreadRadius: -5,
    ),
  ];

  // === SPECIALTY SHADOWS ===

  /// An inner shadow to create a pressed or inset effect on buttons or text fields.
  static final List<BoxShadow> inner = [
    BoxShadow(
      color: AppColors.darkGrey.withOpacity(0.2),
      // Note: Inner shadows are typically simulated and might require specific container setups.
      // This is a standard shadow that can be used inside a decorated container.
    ),
  ];

  /// A text shadow for better readability on complex backgrounds.
  static const List<Shadow> text = [
    Shadow(color: Color(0x4D000000), offset: Offset(0, 1), blurRadius: 3),
  ];

  /// A darker text shadow for light text on dark backgrounds.
  static const List<Shadow> darkText = [
    Shadow(color: Color(0x66000000), offset: Offset(0, 2), blurRadius: 4),
  ];
}
