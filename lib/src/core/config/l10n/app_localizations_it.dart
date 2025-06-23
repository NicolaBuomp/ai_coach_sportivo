// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'AI Coach Sportivo';

  @override
  String get welcomeBack => 'Bentornato';

  @override
  String get signInToAccount => 'Accedi al tuo account AI Coach';

  @override
  String get createAccount => 'Crea Account';

  @override
  String get joinAiCoach => 'Unisciti ad AI Coach oggi';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get confirmPassword => 'Conferma Password';

  @override
  String get signIn => 'Accedi';

  @override
  String get signUp => 'Registrati';

  @override
  String get alreadyHaveAccount => 'Hai già un account? Accedi';

  @override
  String get dontHaveAccount => 'Non hai un account? Registrati';

  @override
  String get verifyYourEmail => 'Verifica la tua Email';

  @override
  String emailSentTo(String email) {
    return 'Abbiamo inviato un\'email di verifica a $email';
  }

  @override
  String get checkEmailAndClick =>
      'Controlla la tua email e clicca sul link di verifica per continuare';

  @override
  String get resendEmail => 'Invia di Nuovo';

  @override
  String get checkStatus => 'Controlla Stato';

  @override
  String get emailVerifiedSuccessfully =>
      'Email verificata con successo! Reindirizzamento...';

  @override
  String get pleaseEnterEmail => 'Inserisci la tua email';

  @override
  String get pleaseEnterValidEmail => 'Inserisci un\'email valida';

  @override
  String get pleaseEnterPassword => 'Inserisci la tua password';

  @override
  String get passwordMinLength =>
      'La password deve essere di almeno 6 caratteri';

  @override
  String get pleaseConfirmPassword => 'Conferma la tua password';

  @override
  String get passwordsDoNotMatch => 'Le password non coincidono';

  @override
  String loginFailed(String error) {
    return 'Login fallito: $error';
  }

  @override
  String signUpFailed(String error) {
    return 'Registrazione fallita: $error';
  }

  @override
  String get pleaseVerifyEmail => 'Verifica prima il tuo indirizzo email.';

  @override
  String get emailNotVerified =>
      'Email non ancora verificata. Controlla la tua email.';

  @override
  String failedToResendEmail(String error) {
    return 'Impossibile reinviare l\'email: $error';
  }
}
