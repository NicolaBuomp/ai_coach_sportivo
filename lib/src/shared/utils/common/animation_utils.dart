import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Utility per feedback tattili e animazioni
class FeedbackUtils {
  FeedbackUtils._();

  /// Feedback tattile leggero
  static void lightImpact() {
    HapticFeedback.lightImpact();
  }

  /// Feedback tattile medio
  static void mediumImpact() {
    HapticFeedback.mediumImpact();
  }

  /// Feedback tattile pesante
  static void heavyImpact() {
    HapticFeedback.heavyImpact();
  }

  /// Feedback per selezione
  static void selectionClick() {
    HapticFeedback.selectionClick();
  }

  /// Feedback per successo
  static void successFeedback() {
    HapticFeedback.lightImpact();
  }

  /// Feedback per errore
  static void errorFeedback() {
    HapticFeedback.heavyImpact();
  }
}

/// Mixin per animazioni comuni nei widget di autenticazione
mixin AuthAnimationMixin<T extends StatefulWidget>
    on State<T>, TickerProviderStateMixin<T> {
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startEntryAnimation();
  }

  void _initializeAnimations() {
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );
  }

  void _startEntryAnimation() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        _fadeController.forward();
        _scaleController.forward();
      }
    });
  }

  /// Animazione per il successo
  void playSuccessAnimation() {
    FeedbackUtils.successFeedback();
    _scaleController.forward().then((_) {
      _scaleController.reverse().then((_) {
        _scaleController.forward();
      });
    });
  }

  /// Animazione per l'errore
  void playErrorAnimation() {
    FeedbackUtils.errorFeedback();
    // Shake animation
    for (int i = 0; i < 3; i++) {
      _scaleController.reverse().then((_) {
        _scaleController.forward();
      });
    }
  }

  /// Widget builder con animazioni
  Widget buildAnimatedChild(Widget child) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: ScaleTransition(scale: _scaleAnimation, child: child),
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  // Getters per le animazioni
  Animation<double> get fadeAnimation => _fadeAnimation;
  Animation<double> get scaleAnimation => _scaleAnimation;
  AnimationController get fadeController => _fadeController;
  AnimationController get scaleController => _scaleController;
}
