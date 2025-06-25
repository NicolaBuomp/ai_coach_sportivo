import 'package:flutter/material.dart';
import '../config/theme/app_colors.dart';

/// Gradienti personalizzati per l'app sportiva
class AppGradients {
  // === GRADIENTI PRIMARI ===
  static const LinearGradient primary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.primary, Color(0xFF1E88E5)],
  );

  static const LinearGradient secondary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.secondary, Color(0xFF37474F)],
  );

  // === GRADIENTI SPORTIVI ===

  /// Gradiente per attività cardio (rosso energico)
  static const LinearGradient cardio = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFF6B6B), Color(0xFFEE5A52)],
  );

  /// Gradiente per forza/pesi (arancione potenza)
  static const LinearGradient strength = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFF9500), Color(0xFFFF7043)],
  );

  /// Gradiente per yoga/flessibilità (viola rilassante)
  static const LinearGradient flexibility = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF9C27B0), Color(0xFF673AB7)],
  );

  /// Gradiente per corsa (verde natura)
  static const LinearGradient running = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF4CAF50), Color(0xFF66BB6A)],
  );

  /// Gradiente per ciclismo (blu cielo)
  static const LinearGradient cycling = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF2196F3), Color(0xFF42A5F5)],
  );

  /// Gradiente per nuoto (azzurro acqua)
  static const LinearGradient swimming = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF00BCD4), Color(0xFF26C6DA)],
  );

  // === GRADIENTI UI ===

  /// Gradiente per successo
  static const LinearGradient success = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.successColor, Color(0xFF66BB6A)],
  );

  /// Gradiente per errore
  static const LinearGradient error = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.errorColor, Color(0xFFE57373)],
  );

  /// Gradiente per warning
  static const LinearGradient warning = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.warningColor, Color(0xFFFFB74D)],
  );

  /// Gradiente per informazioni
  static const LinearGradient info = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.infoColor, Color(0xFF64B5F6)],
  );

  // === GRADIENTI GLASSMORPHISM ===

  /// Gradiente glassmorphism chiaro
  static LinearGradient get lightGlass => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.white.withValues(alpha: 0.25),
      Colors.white.withValues(alpha: 0.1),
    ],
  );

  /// Gradiente glassmorphism scuro
  static LinearGradient get darkGlass => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.white.withValues(alpha: 0.15),
      Colors.white.withValues(alpha: 0.05),
    ],
  );

  // === GRADIENTI SFONDO ===

  /// Gradiente sfondo mattina
  static const LinearGradient morning = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFFFE082), Color(0xFFFFCC02)],
  );

  /// Gradiente sfondo sera
  static const LinearGradient evening = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFFF7043), Color(0xFFD84315)],
  );

  /// Gradiente sfondo notte
  static const LinearGradient night = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF303F9F), Color(0xFF1A237E)],
  );

  // === GRADIENTI ANIMATI ===

  /// Lista di gradienti per animazioni cicliche
  static const List<LinearGradient> animated = [
    primary,
    cardio,
    strength,
    running,
    cycling,
  ];

  // === METODI HELPER ===

  /// Crea un gradiente personalizzato con opacità
  static LinearGradient createWithOpacity(
    LinearGradient gradient,
    double opacity,
  ) {
    return LinearGradient(
      begin: gradient.begin,
      end: gradient.end,
      colors: gradient.colors
          .map((color) => color.withValues(alpha: opacity))
          .toList(),
    );
  }

  /// Crea un gradiente radiale
  static RadialGradient createRadial(
    List<Color> colors, {
    Alignment center = Alignment.center,
    double radius = 0.5,
  }) {
    return RadialGradient(center: center, radius: radius, colors: colors);
  }
}
