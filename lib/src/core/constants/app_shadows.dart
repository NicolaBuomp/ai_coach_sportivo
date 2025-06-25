import 'package:flutter/material.dart';
import '../config/theme/app_colors.dart';

/// Ombre personalizzate per l'app sportiva
class AppShadows {
  // === OMBRE STANDARD ===

  /// Ombra leggera per elementi sottili
  static const List<BoxShadow> light = [
    BoxShadow(
      color: Color(0x0F000000),
      offset: Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 0,
    ),
  ];

  /// Ombra media per card e contenitori
  static const List<BoxShadow> medium = [
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 2),
      blurRadius: 8,
      spreadRadius: 0,
    ),
  ];

  /// Ombra forte per elementi in evidenza
  static const List<BoxShadow> strong = [
    BoxShadow(
      color: Color(0x26000000),
      offset: Offset(0, 4),
      blurRadius: 16,
      spreadRadius: 0,
    ),
  ];

  /// Ombra molto forte per modali e overlay
  static const List<BoxShadow> veryStrong = [
    BoxShadow(
      color: Color(0x33000000),
      offset: Offset(0, 8),
      blurRadius: 24,
      spreadRadius: 0,
    ),
  ];

  // === OMBRE COLORATE SPORTIVE ===

  /// Ombra con colore primario
  static List<BoxShadow> get primary => [
    BoxShadow(
      color: AppColors.primary.withValues(alpha: 0.25),
      offset: const Offset(0, 4),
      blurRadius: 12,
      spreadRadius: 0,
    ),
  ];

  /// Ombra per attività cardio
  static const List<BoxShadow> cardio = [
    BoxShadow(
      color: Color(0x40FF6B6B),
      offset: Offset(0, 4),
      blurRadius: 12,
      spreadRadius: 0,
    ),
  ];

  /// Ombra per attività di forza
  static const List<BoxShadow> strength = [
    BoxShadow(
      color: Color(0x40FF9500),
      offset: Offset(0, 4),
      blurRadius: 12,
      spreadRadius: 0,
    ),
  ];

  /// Ombra per yoga/flessibilità
  static const List<BoxShadow> flexibility = [
    BoxShadow(
      color: Color(0x409C27B0),
      offset: Offset(0, 4),
      blurRadius: 12,
      spreadRadius: 0,
    ),
  ];

  /// Ombra per corsa
  static const List<BoxShadow> running = [
    BoxShadow(
      color: Color(0x404CAF50),
      offset: Offset(0, 4),
      blurRadius: 12,
      spreadRadius: 0,
    ),
  ];

  // === OMBRE PER STATI ===

  /// Ombra per successo
  static List<BoxShadow> get success => [
    BoxShadow(
      color: AppColors.successColor.withValues(alpha: 0.25),
      offset: const Offset(0, 4),
      blurRadius: 12,
      spreadRadius: 0,
    ),
  ];

  /// Ombra per errore
  static List<BoxShadow> get error => [
    BoxShadow(
      color: AppColors.errorColor.withValues(alpha: 0.25),
      offset: const Offset(0, 4),
      blurRadius: 12,
      spreadRadius: 0,
    ),
  ];

  /// Ombra per warning
  static List<BoxShadow> get warning => [
    BoxShadow(
      color: AppColors.warningColor.withValues(alpha: 0.25),
      offset: const Offset(0, 4),
      blurRadius: 12,
      spreadRadius: 0,
    ),
  ];

  // === OMBRE GLASSMORPHISM ===

  /// Ombra per effetto glassmorphism chiaro
  static const List<BoxShadow> glassLight = [
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 8),
      blurRadius: 32,
      spreadRadius: 0,
    ),
  ];

  /// Ombra per effetto glassmorphism scuro
  static const List<BoxShadow> glassDark = [
    BoxShadow(
      color: Color(0x33000000),
      offset: Offset(0, 8),
      blurRadius: 32,
      spreadRadius: 0,
    ),
  ];

  // === OMBRE INTERNE ===

  /// Ombra interna leggera
  static const List<BoxShadow> innerLight = [
    BoxShadow(
      color: Color(0x0D000000),
      offset: Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
    ),
  ];

  /// Ombra interna media
  static const List<BoxShadow> innerMedium = [
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    ),
  ];

  // === OMBRE PER BOTTONI ===

  /// Ombra per bottoni normali
  static const List<BoxShadow> button = [
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    ),
  ];

  /// Ombra per bottoni premuti
  static const List<BoxShadow> buttonPressed = [
    BoxShadow(
      color: Color(0x26000000),
      offset: Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
    ),
  ];

  /// Ombra per bottoni flottanti
  static const List<BoxShadow> floating = [
    BoxShadow(
      color: Color(0x26000000),
      offset: Offset(0, 6),
      blurRadius: 20,
      spreadRadius: 0,
    ),
  ];

  // === METODI HELPER ===

  /// Crea un'ombra personalizzata
  static List<BoxShadow> custom({
    required Color color,
    required Offset offset,
    required double blurRadius,
    double spreadRadius = 0,
    double opacity = 1.0,
  }) {
    return [
      BoxShadow(
        color: color.withValues(alpha: opacity),
        offset: offset,
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
      ),
    ];
  }

  /// Crea un'ombra colorata basata su un colore
  static List<BoxShadow> colored(
    Color color, {
    double opacity = 0.25,
    Offset offset = const Offset(0, 4),
    double blurRadius = 12,
    double spreadRadius = 0,
  }) {
    return [
      BoxShadow(
        color: color.withValues(alpha: opacity),
        offset: offset,
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
      ),
    ];
  }
}
