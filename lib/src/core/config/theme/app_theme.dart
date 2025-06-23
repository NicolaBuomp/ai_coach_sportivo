import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppTheme {
  // Colori personalizzati
  static const _primaryColor = Color(0xFF38E07B);

  // Colori tema chiaro
  static const _lightBackground = Color(0xFFF8FBFA);
  static const _lightSecondary = Color(0xFFE8F2EC);
  static const _lightTextPrimary = Color(0xFF111714);
  static const _lightTextSecondary = Color(0xFF546155);

  // Colori tema scuro
  static const _darkBackground = Color(0xFF111714);
  static const _darkSecondary = Color(0xFF29382F);
  static const _darkTextPrimary = Colors.white;
  static const _darkTextSecondary = Color(0xFFA4B6A8);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: _lightBackground,
      primaryColor: _primaryColor,
      colorScheme: const ColorScheme.light(
        primary: _primaryColor,
        secondary: _lightSecondary,
        surface: _lightBackground,
        onSurface: _lightTextPrimary,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: _lightTextPrimary),
        bodyMedium: TextStyle(color: _lightTextSecondary),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: _lightBackground,
        surfaceTintColor: Colors.transparent,
        foregroundColor: _lightTextPrimary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(48),
          backgroundColor: _primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(48),
          backgroundColor: _lightSecondary,
          foregroundColor: _lightTextPrimary,
          side: const BorderSide(color: _lightSecondary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _primaryColor,
          minimumSize: const Size.fromHeight(48),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _lightSecondary,
        hintStyle: const TextStyle(color: _lightTextSecondary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: _primaryColor, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
      cardTheme: CardThemeData(
        color: _lightSecondary,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: _darkBackground,
      primaryColor: _primaryColor,
      colorScheme: const ColorScheme.dark(
        primary: _primaryColor,
        secondary: _darkSecondary,
        surface: _darkBackground,
        onSurface: _darkTextPrimary,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: _darkTextPrimary),
        bodyMedium: TextStyle(color: _darkTextSecondary),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: _darkBackground,
        surfaceTintColor: Colors.transparent,
        foregroundColor: _darkTextPrimary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(48),
          backgroundColor: _primaryColor,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(48),
          backgroundColor: _darkSecondary,
          foregroundColor: _darkTextPrimary,
          side: const BorderSide(color: _darkSecondary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _primaryColor,
          minimumSize: const Size.fromHeight(48),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _darkSecondary,
        hintStyle: const TextStyle(color: _darkTextSecondary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: _primaryColor, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
      cardTheme: CardThemeData(
        color: _darkSecondary,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}

// Provider Riverpod per gestire lo stato del tema
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);
