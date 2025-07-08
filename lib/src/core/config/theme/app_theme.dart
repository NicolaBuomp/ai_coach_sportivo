import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import '../../constants/app_dimensions.dart';

export 'theme_provider.dart';

class AppTheme {
  // === FONT THEME - INTER ===
  // Using Inter font for its modern and clean aesthetic, suitable for a sports app.
  static final TextTheme _baseTextTheme = GoogleFonts.interTextTheme();

  // --- Text Theme for Light Mode ---
  static final TextTheme _lightTextTheme = _baseTextTheme.copyWith(
    displayLarge: _baseTextTheme.displayLarge?.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w800,
      color: AppColors.lightPrimaryText,
      height: 1.2,
    ),
    displayMedium: _baseTextTheme.displayMedium?.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: AppColors.lightPrimaryText,
      height: 1.2,
    ),
    headlineLarge: _baseTextTheme.headlineLarge?.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColors.lightPrimaryText,
      height: 1.3,
    ),
    headlineMedium: _baseTextTheme.headlineMedium?.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.lightPrimaryText,
      height: 1.3,
    ),
    titleLarge: _baseTextTheme.titleLarge?.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.lightPrimaryText,
      height: 1.4,
    ),
    titleMedium: _baseTextTheme.titleMedium?.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.lightPrimaryText,
      height: 1.4,
    ),
    bodyLarge: _baseTextTheme.bodyLarge?.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.lightPrimaryText,
      height: 1.5,
    ),
    bodyMedium: _baseTextTheme.bodyMedium?.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.lightSecondaryText,
      height: 1.5,
    ),
    bodySmall: _baseTextTheme.bodySmall?.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.lightSecondaryText,
      height: 1.4,
    ),
    labelLarge: _baseTextTheme.labelLarge?.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.lightPrimaryText,
      letterSpacing: 0.5,
    ),
  );

  // --- Text Theme for Dark Mode ---
  static final TextTheme _darkTextTheme = _baseTextTheme.copyWith(
    displayLarge: _baseTextTheme.displayLarge?.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w800,
      color: AppColors.darkPrimaryText,
      height: 1.2,
    ),
    displayMedium: _baseTextTheme.displayMedium?.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: AppColors.darkPrimaryText,
      height: 1.2,
    ),
    headlineLarge: _baseTextTheme.headlineLarge?.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColors.darkPrimaryText,
      height: 1.3,
    ),
    headlineMedium: _baseTextTheme.headlineMedium?.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.darkPrimaryText,
      height: 1.3,
    ),
    titleLarge: _baseTextTheme.titleLarge?.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.darkPrimaryText,
      height: 1.4,
    ),
    titleMedium: _baseTextTheme.titleMedium?.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.darkPrimaryText,
      height: 1.4,
    ),
    bodyLarge: _baseTextTheme.bodyLarge?.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.darkPrimaryText,
      height: 1.5,
    ),
    bodyMedium: _baseTextTheme.bodyMedium?.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.darkSecondaryText,
      height: 1.5,
    ),
    bodySmall: _baseTextTheme.bodySmall?.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.darkSecondaryText,
      height: 1.4,
    ),
    labelLarge: _baseTextTheme.labelLarge?.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.darkPrimaryText,
      letterSpacing: 0.5,
    ),
  );

  // === MODERN LIGHT THEME (2025) ===
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBackground,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        surface: AppColors.lightSurface,
        onSurface: AppColors.lightPrimaryText,
        background: AppColors.lightBackground,
        onBackground: AppColors.lightPrimaryText,
        error: AppColors.error,
        onError: AppColors.onError,
        tertiary: AppColors.accent,
        onTertiary: AppColors.onAccent,
      ),
      textTheme: _lightTextTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.lightBackground.withAlpha(
          240,
        ), // Slight transparency
        elevation: 0,
        scrolledUnderElevation: 1,
        shadowColor: AppColors.darkGrey.withOpacity(0.1),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: AppColors.lightPrimaryText,
          size: AppDimensions.appBarIconSize,
        ),
        actionsIconTheme: IconThemeData(
          color: AppColors.primary,
          size: AppDimensions.appBarIconSize,
        ),
        titleTextStyle: _lightTextTheme.titleLarge,
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
        ),
      ),
      iconTheme: IconThemeData(
        color: AppColors.primary,
        size: AppDimensions.iconM,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spacingL,
            vertical: AppDimensions.spacingM,
          ),
          textStyle: _lightTextTheme.labelLarge,
          elevation: 2,
          shadowColor: AppColors.primary.withOpacity(0.2),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spacingL,
            vertical: AppDimensions.spacingM,
          ),
          textStyle: _lightTextTheme.labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusS),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spacingM,
            vertical: AppDimensions.spacingS,
          ),
          textStyle: _lightTextTheme.labelLarge,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightSurface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.inputPadding,
          vertical: AppDimensions.spacingM,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.inputRadius),
          borderSide: const BorderSide(color: AppColors.lightBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.inputRadius),
          borderSide: const BorderSide(color: AppColors.lightBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.inputRadius),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        labelStyle: _lightTextTheme.bodyMedium,
        hintStyle: _lightTextTheme.bodyMedium?.copyWith(
          color: AppColors.lightSecondaryText,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: AppColors.lightSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
          side: BorderSide(color: AppColors.lightBorder.withOpacity(0.5)),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.lightGlass,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.darkGrey,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: _lightTextTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: _lightTextTheme.bodySmall,
        selectedIconTheme: const IconThemeData(
          size: AppDimensions.bottomNavIconSize,
        ),
        unselectedIconTheme: const IconThemeData(
          size: AppDimensions.bottomNavIconSize,
        ),
        enableFeedback: true,
      ),
      dividerTheme: const DividerThemeData(
        thickness: 1,
        color: AppColors.lightDivider,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.lightSurface,
        disabledColor: AppColors.lightGrey,
        selectedColor: AppColors.primary,
        secondarySelectedColor: AppColors.accent,
        labelStyle: _lightTextTheme.labelLarge?.copyWith(
          color: AppColors.lightPrimaryText,
        ),
        secondaryLabelStyle: _lightTextTheme.labelLarge?.copyWith(
          color: AppColors.onAccent,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusS),
        ),
        side: const BorderSide(color: AppColors.lightBorder),
        brightness: Brightness.light,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.accent,
        foregroundColor: AppColors.onAccent,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusL),
        ),
      ),
    );
  }

  // === MODERN DARK THEME (2025) ===
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBackground,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        surface: AppColors.darkSurface,
        onSurface: AppColors.darkPrimaryText,
        background: AppColors.darkBackground,
        onBackground: AppColors.darkPrimaryText,
        error: AppColors.error,
        onError: AppColors.onError,
        tertiary: AppColors.accent,
        onTertiary: AppColors.onAccent,
      ),
      textTheme: _darkTextTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkBackground.withAlpha(
          240,
        ), // Slight transparency
        elevation: 0,
        scrolledUnderElevation: 1,
        shadowColor: AppColors.pureBlack.withOpacity(0.2),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: AppColors.darkPrimaryText,
          size: AppDimensions.appBarIconSize,
        ),
        actionsIconTheme: IconThemeData(
          color: AppColors.primary,
          size: AppDimensions.appBarIconSize,
        ),
        titleTextStyle: _darkTextTheme.titleLarge,
        systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
        ),
      ),
      iconTheme: IconThemeData(
        color: AppColors.primary,
        size: AppDimensions.iconM,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spacingL,
            vertical: AppDimensions.spacingM,
          ),
          textStyle: _darkTextTheme.labelLarge,
          elevation: 2,
          shadowColor: AppColors.primary.withOpacity(0.3),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spacingL,
            vertical: AppDimensions.spacingM,
          ),
          textStyle: _darkTextTheme.labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusS),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spacingM,
            vertical: AppDimensions.spacingS,
          ),
          textStyle: _darkTextTheme.labelLarge,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkSurface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.inputPadding,
          vertical: AppDimensions.spacingM,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.inputRadius),
          borderSide: const BorderSide(color: AppColors.darkBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.inputRadius),
          borderSide: const BorderSide(color: AppColors.darkBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.inputRadius),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        labelStyle: _darkTextTheme.bodyMedium,
        hintStyle: _darkTextTheme.bodyMedium?.copyWith(
          color: AppColors.darkSecondaryText,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: AppColors.darkSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
          side: BorderSide(color: AppColors.darkBorder.withOpacity(0.7)),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkGlass,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.midGrey,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: _darkTextTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: _darkTextTheme.bodySmall,
        selectedIconTheme: const IconThemeData(
          size: AppDimensions.bottomNavIconSize,
        ),
        unselectedIconTheme: const IconThemeData(
          size: AppDimensions.bottomNavIconSize,
        ),
        enableFeedback: true,
      ),
      dividerTheme: const DividerThemeData(
        thickness: 1,
        color: AppColors.darkDivider,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.darkSurface,
        disabledColor: AppColors.darkerGrey,
        selectedColor: AppColors.primary,
        secondarySelectedColor: AppColors.accent,
        labelStyle: _darkTextTheme.labelLarge?.copyWith(
          color: AppColors.darkPrimaryText,
        ),
        secondaryLabelStyle: _darkTextTheme.labelLarge?.copyWith(
          color: AppColors.onAccent,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusS),
        ),
        side: const BorderSide(color: AppColors.darkBorder),
        brightness: Brightness.dark,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.accent,
        foregroundColor: AppColors.onAccent,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusL),
        ),
      ),
    );
  }
}
