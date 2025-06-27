import 'package:flutter/material.dart';
import 'package:ai_coach_sportivo/src/core/config/l10n/app_localizations.dart';
import 'package:ai_coach_sportivo/src/core/constants/error_messages.dart';

/// Helper function to get localized message from key
String _getLocalizedMessage(BuildContext context, String messageKey) {
  final l10n = AppLocalizations.of(context);

  if (l10n == null) {
    // Fallback to hardcoded message if localization is not available
    return ErrorMessages.fallbackMessages[messageKey] ?? messageKey;
  }

  // Try to get the localized message using reflection-like approach
  // Since we can't use reflection in Flutter, we'll use a switch statement
  switch (messageKey) {
    case 'invalidEmailOrPassword':
      return l10n.invalidEmailOrPassword;
    case 'unexpectedError':
      return l10n.unexpectedError;
    case 'emailAlreadyExists':
      return l10n.emailAlreadyExists;
    case 'googleSignInFailed':
      return l10n.googleSignInFailed;
    case 'appleSignInFailed':
      return l10n.appleSignInFailed;
    case 'authenticationCancelled':
      return l10n.authenticationCancelled;
    case 'accountCreatedSuccessfully':
      return l10n.accountCreatedSuccessfully;
    case 'pleaseEnterEmail':
      return l10n.pleaseEnterEmail;
    case 'pleaseEnterValidEmail':
      return l10n.pleaseEnterValidEmail;
    case 'pleaseEnterPassword':
      return l10n.pleaseEnterPassword;
    case 'passwordMinLength':
      return l10n.passwordMinLength;
    case 'passwordsDoNotMatch':
      return l10n.passwordsDoNotMatch;
    case 'emailVerifiedSuccessfully':
      return l10n.emailVerifiedSuccessfully;
    case 'pleaseVerifyEmail':
      return l10n.pleaseVerifyEmail;
    case 'emailNotVerified':
      return l10n.emailNotVerified;
    // Additional error keys
    case 'signupDisabled':
    case 'emailRateLimit':
    case 'passwordTooShort':
    case 'invalidEmailFormat':
    case 'userNotFound':
    case 'networkError':
    case 'serverError':
    case 'timeoutError':
    case 'emailNotConfirmed':
    case 'weakPassword':
    case 'emailAlreadyInUse':
    case 'tooManyRequests':
    case 'passwordResetEmailSent':
    case 'passwordResetFailed':
      // For now, use fallback messages until we add getters to AppLocalizations
      return ErrorMessages.fallbackMessages[messageKey] ?? messageKey;
    default:
      // If the key is not found, try fallback or return the key itself
      return ErrorMessages.fallbackMessages[messageKey] ?? messageKey;
  }
}

/// Widget riutilizzabile per mostrare messaggi di errore
class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    super.key,
    required this.message,
    this.margin = const EdgeInsets.only(bottom: 16),
  });

  final String message;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    // Get localized message from key
    final localizedMessage = _getLocalizedMessage(context, message);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: margin,
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.errorContainer,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Icon(
                Icons.error_outline,
                color: Theme.of(context).colorScheme.onErrorContainer,
                size: 20,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  localizedMessage,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onErrorContainer,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Widget riutilizzabile per mostrare messaggi di successo
class SuccessMessage extends StatelessWidget {
  const SuccessMessage({
    super.key,
    required this.message,
    this.margin = const EdgeInsets.only(bottom: 16),
  });

  final String message;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    // Get localized message from key
    final localizedMessage = _getLocalizedMessage(context, message);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: margin,
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Icon(
                Icons.check_circle_outline,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                size: 20,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  localizedMessage,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
