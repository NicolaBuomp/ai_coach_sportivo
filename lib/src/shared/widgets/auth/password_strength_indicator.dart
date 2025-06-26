import 'package:flutter/material.dart';
import 'package:ai_coach_sportivo/src/shared/utils/auth/validation_utils.dart';
import 'package:ai_coach_sportivo/src/core/constants/app_constants.dart';

/// Widget per mostrare la forza della password
class PasswordStrengthIndicator extends StatelessWidget {
  const PasswordStrengthIndicator({
    super.key,
    required this.password,
    this.showLabel = true,
  });

  final String password;
  final bool showLabel;

  @override
  Widget build(BuildContext context) {
    final strength = ValidationUtils.getPasswordStrength(password);
    final colorScheme = Theme.of(context).colorScheme;

    if (strength == PasswordStrength.empty) {
      return const SizedBox.shrink();
    }

    Color getStrengthColor() {
      switch (strength) {
        case PasswordStrength.weak:
          return colorScheme.error;
        case PasswordStrength.fair:
          return Colors.orange;
        case PasswordStrength.good:
          return Colors.blue;
        case PasswordStrength.strong:
          return Colors.green;
        case PasswordStrength.empty:
          return Colors.transparent;
      }
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Barra di progresso
          Container(
            height: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: colorScheme.outline.withValues(alpha: 0.3),
            ),
            child: LinearProgressIndicator(
              value: strength.progress,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(getStrengthColor()),
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          if (showLabel) ...[
            const SizedBox(height: 4),
            Text(
              '${AppConstants.passwordStrengthLabel}: ${strength.label}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: getStrengthColor(),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
