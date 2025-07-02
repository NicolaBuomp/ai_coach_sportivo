import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Widget che gestisce la dismissal automatica della tastiera
/// quando si tocca al di fuori dei campi di input.
/// Implementa le best practices di Flutter 2025 per UX mobile.
class KeyboardDismissWrapper extends StatelessWidget {
  const KeyboardDismissWrapper({
    super.key,
    required this.child,
    this.enableHapticFeedback = true,
  });

  final Widget child;
  final bool enableHapticFeedback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Dismissal della tastiera
        FocusScope.of(context).unfocus();

        // Feedback aptico leggero per confermare l'azione
        if (enableHapticFeedback) {
          HapticFeedback.lightImpact();
        }
      },
      child: child,
    );
  }
}
