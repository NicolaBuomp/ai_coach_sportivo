import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

/// Widget per overlay di caricamento globale che copre l'intera schermata
class GlobalLoadingOverlay extends StatelessWidget {
  const GlobalLoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    this.color,
    this.message,
  });

  final bool isLoading;
  final Widget child;
  final Color? color;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          child,
          if (isLoading)
            Positioned.fill(
              child: Container(
                color: color ?? Colors.black.withValues(alpha: 0.6),
                child: Center(
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      padding: const EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 8.0,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Animazione di loading moderna con InkDrop
                          LoadingAnimationWidget.inkDrop(
                            color: Theme.of(context).colorScheme.primary,
                            size: 40,
                          ),
                          if (message != null) ...[
                            const SizedBox(height: 16),
                            Text(
                              message!,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Widget per overlay di caricamento semplice (per uso interno in componenti)
class SimpleLoadingOverlay extends StatelessWidget {
  const SimpleLoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    this.color,
  });

  final bool isLoading;
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Positioned.fill(
            child: Material(
              color: color ?? Colors.black.withValues(alpha: 0.3),
              child: Center(
                child: LoadingAnimationWidget.inkDrop(
                  color: Theme.of(context).colorScheme.primary,
                  size: 30,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
