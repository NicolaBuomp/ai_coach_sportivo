import 'package:ai_coach_sportivo/src/core/config/l10n/app_localizations.dart';

/// Utility per la gestione e localizzazione degli errori di autenticazione
class AuthErrorUtils {
  AuthErrorUtils._();

  /// Mappa degli errori di autenticazione localizzati
  static String getLocalizedErrorMessage(
    AppLocalizations l10n,
    String errorKey,
  ) {
    switch (errorKey) {
      case 'invalidEmailOrPassword':
        return l10n.invalidEmailOrPassword;
      case 'pleaseVerifyEmail':
        return l10n.pleaseVerifyEmail;
      case 'emailAlreadyExists':
        return l10n.emailAlreadyExists;
      case 'googleSignInFailed':
        return l10n.googleSignInFailed;
      case 'appleSignInFailed':
        return l10n.appleSignInFailed;
      case 'authenticationCancelled':
        return l10n.authenticationCancelled;
      case 'unexpectedError':
      default:
        return l10n.unexpectedError;
    }
  }

  /// Mappa dei messaggi di successo localizzati
  static String getLocalizedSuccessMessage(
    AppLocalizations l10n,
    String messageKey,
  ) {
    switch (messageKey) {
      case 'accountCreatedSuccessfully':
        return l10n.accountCreatedSuccessfully;
      case 'loginSuccessful':
        return l10n.welcomeBack;
      default:
        return getLocalizedErrorMessage(l10n, messageKey);
    }
  }

  /// Ottiene il messaggio di validazione per l'email
  static String? getEmailValidationMessage(
    AppLocalizations l10n,
    String? value,
  ) {
    if (value == null || value.isEmpty) {
      return l10n.pleaseEnterEmail;
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return l10n.pleaseEnterValidEmail;
    }
    return null;
  }

  /// Ottiene il messaggio di validazione per la password
  static String? getPasswordValidationMessage(
    AppLocalizations l10n,
    String? value,
  ) {
    if (value == null || value.isEmpty) {
      return l10n.pleaseEnterPassword;
    }
    if (value.length < 6) {
      return l10n.passwordMinLength;
    }
    return null;
  }

  /// Ottiene il messaggio di validazione per la conferma password
  static String? getConfirmPasswordValidationMessage(
    AppLocalizations l10n,
    String? value,
    String? password,
  ) {
    if (value == null || value.isEmpty) {
      return l10n.pleaseConfirmPassword;
    }
    if (value != password) {
      return l10n.passwordsDoNotMatch;
    }
    return null;
  }
}
