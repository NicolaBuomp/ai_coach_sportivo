import 'package:flutter/material.dart';

class AppColors {
  // === PALETTE 2025 - SPORTY & MODERN ===

  // --- Primary & Accent Colors ---
  static const Color primary = Color(
    0xFF007BFF,
  ); // Un blu più vibrante e moderno
  static const Color accent = Color(
    0xFFFFD233,
  ); // Un giallo/oro energetico per accenti
  static const Color secondary = Color(
    0xFF1A2E40,
  ); // Un blu scuro/grigio per contrasto

  // --- Neutral Tones ---
  static const Color pureWhite = Color(0xFFFFFFFF);
  static const Color pureBlack = Color(0xFF000000);
  static const Color lightGrey = Color(
    0xFFF5F7FA,
  ); // Sfondo chiaro, più luminoso
  static const Color midGrey = Color(0xFFD8DEE4); // Bordi, divisori
  static const Color darkGrey = Color(
    0xFF3D4F60,
  ); // Testo secondario, icone inattive
  static const Color darkerGrey = Color(0xFF2C3A47); // Superfici scure
  static const Color almostBlack = Color(0xFF121212); // Sfondo scuro profondo

  // --- Semantic Colors ---
  static const Color success = Color(0xFF28A745);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFDC3545);
  static const Color info = Color(0xFF17A2B8);

  // === THEME-SPECIFIC COLORS ===

  // --- Light Theme ---
  static const Color lightBackground = lightGrey;
  static const Color lightSurface = pureWhite;
  static const Color lightPrimaryText = almostBlack;
  static const Color lightSecondaryText = darkGrey;
  static const Color lightBorder = midGrey;
  static const Color lightDivider = midGrey;

  // --- Dark Theme ---
  static const Color darkBackground = almostBlack;
  static const Color darkSurface = darkerGrey;
  static const Color darkPrimaryText = pureWhite;
  static const Color darkSecondaryText = midGrey;
  static const Color darkBorder = darkGrey;
  static const Color darkDivider = darkGrey;

  // --- On-Colors (for text/icons on colored backgrounds) ---
  static const Color onPrimary = pureWhite;
  static const Color onAccent = almostBlack;
  static const Color onSecondary = pureWhite;
  static const Color onSuccess = pureWhite;
  static const Color onWarning = almostBlack;
  static const Color onError = pureWhite;
  static const Color onInfo = pureWhite;

  // === UI COMPONENT STATES ===

  // --- Hover, Press, Splash ---
  static final Color primaryHover = primary.withOpacity(0.9);
  static final Color primarySplash = primary.withOpacity(0.1);
  static final Color darkHover = pureWhite.withOpacity(0.08);
  static final Color darkSplash = pureWhite.withOpacity(0.05);
  static final Color lightHover = pureBlack.withOpacity(0.08);
  static final Color lightSplash = pureBlack.withOpacity(0.05);

  // --- Glassmorphism & Transparency ---
  static final Color lightGlass = pureWhite.withOpacity(0.7);
  static final Color darkGlass = darkGrey.withOpacity(0.6);
  static final Color lightGlassBorder = pureWhite.withOpacity(0.3);
  static final Color darkGlassBorder = pureWhite.withOpacity(0.2);

  // === GRADIENT COLORS ===
  // Definisci qui i colori da usare nei gradienti, poi costruisci i gradienti in `app_gradients.dart`
  static const Color gradientStart = Color(0xFF007BFF);
  static const Color gradientEnd = Color(0xFF0056b3);
  static const Color accentGradientStart = Color(0xFFFFD233);
  static const Color accentGradientEnd = Color(0xFFFFA000);
}
