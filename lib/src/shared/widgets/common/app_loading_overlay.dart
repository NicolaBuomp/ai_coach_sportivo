import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ai_coach_sportivo/src/shared/providers/loading_provider.dart';

/// Widget per overlay di caricamento a livello app che copre tutto
/// Utilizzalo una sola volta nel main widget tree (es. MaterialApp)
class AppLoadingOverlay extends ConsumerWidget {
  const AppLoadingOverlay({super.key, required this.child, this.color});

  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadingState = ref.watch(globalLoadingStateProvider);
    final isGlobalLoading = loadingState.isLoading;
    final loadingMessage = loadingState.message;

    return Stack(
      alignment: Alignment.topLeft, // Usa alignment non-direzionale
      children: [
        child,
        if (isGlobalLoading)
          Positioned.fill(
            child: Material(
              color: color ?? Colors.black.withValues(alpha: 0.6),
              child: PopScope(
                canPop: false, // Previene il back durante il loading
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(24.0),
                    margin: const EdgeInsets.symmetric(horizontal: 32.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 12.0,
                          offset: const Offset(0, 6),
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Animazione di loading moderna e accattivante con InkDrop
                        LoadingAnimationWidget.inkDrop(
                          color: Theme.of(context).colorScheme.primary,
                          size: 50,
                        ),
                        if (loadingMessage != null) ...[
                          const SizedBox(height: 16),
                          Text(
                            loadingMessage,
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
    );
  }
}

/// Widget semplificato per loading locale (es. dentro card o sezioni)
class LocalLoadingOverlay extends StatelessWidget {
  const LocalLoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    this.color,
    this.size = 24.0,
  });

  final bool isLoading;
  final Widget child;
  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Positioned.fill(
            child: Container(
              color: color ?? Colors.black.withValues(alpha: 0.2),
              child: Center(
                child: LoadingAnimationWidget.inkDrop(
                  color: Theme.of(context).colorScheme.primary,
                  size: size,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
