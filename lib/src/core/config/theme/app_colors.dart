import 'package:flutter/material.dart';

class AppColors {
  // === COLORI PRIMARI GLASSMORPHISM ===
  static const Color primary = Color(0xFF2A8BED); // Blu primario
  static const Color secondary = Color(0xFF283039); // Grigio scuro secondario
  static const Color pureWhite = Color(0xFFFFFFFF);
  static const Color pureBlack = Color(0xFF000000);

  // === SFONDI ===
  static const Color lightBackground = Color(
    0xFFF2F2F2,
  ); // Sport-themed light background
  static const Color darkBackground = Color(
    0xFF121212,
  ); // Sport-themed dark background
  static const Color lightSurface = Color(0xFFFFFFFF); // Card surface light
  static const Color darkSurface = Color(0xFF1E1E1E); // Card surface dark

  // === COLORI SEMANTICI ===
  static const Color successColor = Color(0xFF10B981);
  static const Color warningColor = Color(0xFFF59E0B);
  static const Color errorColor = Color(0xFFEF4444);
  static const Color infoColor = Color(0xFF3B82F6);

  // On-colors for contrast
  static const Color onPrimary = pureWhite;
  static const Color onSecondary = pureWhite;
  static const Color onBackgroundLight = Color(0xFF000000);
  static const Color onBackgroundDark = pureWhite;
  static const Color onSurfaceLight = Color(0xFF000000);
  static const Color onSurfaceDark = pureWhite;

  // === TEMA CHIARO GLASSMORPHISM ===
  static const Color lightOnPrimary = pureWhite;
  static const Color lightOnSecondary = pureWhite;
  static const Color lightOnBackground = Color(0xFF0F172A);
  static const Color lightOnSurface = Color(0xFF1E293B);
  static const Color lightTextPrimary = Color(0xFF0F172A);
  static const Color lightTextSecondary = Color(0xFF64748B);
  static const Color lightDivider = Color(0xFFE2E8F0);
  static const Color lightBorder = Color(0xFFCBD5E1);

  // === COLORI SECONDARI E UI ===
  static const Color lightSecondaryButton = Color(0xFFE7EDF3);
  static const Color lightInactiveIcon = Color(0xFFE7EDF3);

  // === TEMA SCURO GLASSMORPHISM ===
  static const Color darkOnPrimary = pureWhite;
  static const Color darkOnSecondary = pureWhite;
  static const Color darkOnBackground = Color(0xFFF8FAFC);
  static const Color darkOnSurface = Color(0xFFE2E8F0);
  static const Color darkTextPrimary = Color(0xFFF8FAFC);
  static const Color darkTextSecondary = Color(0xFF94A3B8);
  static const Color darkDivider = Color(0xFF374151);
  static const Color darkBorder = Color(0xFF475569);

  // === COLORI SECONDARI E UI SCURI ===
  static const Color darkSecondaryButton = Color(0xFF233648);
  static const Color darkInactiveIcon = Color(0xFF233648);

  // === HOVER & PRESSED STATES ===
  static const Color hoverLight = Color(0x08000000);
  static const Color pressedLight = Color(0x12000000);
  static const Color hoverDark = Color(0x08FFFFFF);
  static const Color pressedDark = Color(0x12FFFFFF);

  // === CONTAINERS ===
  static const Color primaryLightContainer = Color(0xFFDCEEFD);
  static const Color onPrimaryLightContainer = Color(0xFF0A4A7A);
  static const Color primaryDarkContainer = Color(0xFF1A4F7A);
  static const Color onPrimaryDarkContainer = Color(0xFFDCEEFD);

  static const Color secondaryLightContainer = Color(0xFFE8ECF0);
  static const Color onSecondaryLightContainer = Color(0xFF151B20);
  static const Color secondaryDarkContainer = Color(0xFF3F4951);
  static const Color onSecondaryDarkContainer = Color(0xFFE8ECF0);
}
