/// A collection of standardized dimensions for a modern, responsive UI (2025).
class AppDimensions {
  // === SPACING & PADDING SYSTEM (based on a 4px grid) ===
  static const double spacingXXS = 2.0; // 2px
  static const double spacingXS = 4.0; // 4px
  static const double spacingS = 8.0; // 8px
  static const double spacingM = 12.0; // 12px
  static const double spacingL = 16.0; // 16px
  static const double spacingXL = 24.0; // 24px
  static const double spacingXXL = 32.0; // 32px
  static const double spacingXXXL = 48.0; // 48px

  // Legacy constants for backward compatibility
  static const double spacing8 = spacingS;
  static const double spacing16 = spacingL;
  static const double spacing24 = spacingXL;
  static const double spacing32 = spacingXXL;
  static const double spacing48 = spacingXXXL;

  // === BORDER RADIUS ===
  static const double radiusS = 8.0;
  static const double radiusM = 16.0;
  static const double radiusL = 24.0;
  static const double radiusXL = 32.0;
  static const double radiusCircle = 100.0;

  // === ICON SIZES ===
  static const double iconS = 18.0;
  static const double iconM = 24.0;
  static const double iconL = 32.0;
  static const double iconXL = 40.0;

  // === BUTTON HEIGHTS ===
  static const double buttonHeightS = 40.0;
  static const double buttonHeightM = 48.0;
  static const double buttonHeightL = 54.0;
  static const double buttonHeightXL = 60.0;

  // === APP BAR ===
  static const double appBarHeight = 64.0;
  static const double appBarElevation = 0.0;
  static const double appBarIconSize = 24.0;

  // === CARD DIMENSIONS ===
  static const double cardRadius = 20.0;
  static const double cardPadding = 16.0;

  // === BOTTOM NAVIGATION ===
  static const double bottomNavHeight = 72.0;
  static const double bottomNavIconSize = 28.0;

  // === FORM ELEMENTS ===
  static const double inputRadius = 16.0;
  static const double inputPadding = 16.0;

  // === AVATAR SIZES ===
  static const double avatarS = 32.0;
  static const double avatarM = 48.0;
  static const double avatarL = 64.0;
  static const double avatarXL = 96.0;

  // === SPORT SPECIFIC ===
  static const double progressBarHeight = 10.0;
  static const double progressBarRadius = 5.0;
}
