/// Error message keys for localization
/// These are the keys that will be used with AppLocalizations
class ErrorMessages {
  ErrorMessages._();

  // Authentication errors
  static const String invalidEmailOrPassword = 'invalidEmailOrPassword';
  static const String unexpectedError = 'unexpectedError';
  static const String emailNotConfirmed = 'emailNotConfirmed';
  static const String weakPassword = 'weakPassword';
  static const String emailAlreadyInUse = 'emailAlreadyInUse';
  static const String tooManyRequests = 'tooManyRequests';
  static const String userNotFound = 'userNotFound';
  static const String passwordResetEmailSent = 'passwordResetEmailSent';
  static const String passwordResetFailed = 'passwordResetFailed';

  // Validation errors
  static const String pleaseEnterEmail = 'pleaseEnterEmail';
  static const String pleaseEnterValidEmail = 'pleaseEnterValidEmail';
  static const String pleaseEnterPassword = 'pleaseEnterPassword';
  static const String passwordMinLength = 'passwordMinLength';
  static const String passwordsDoNotMatch = 'passwordsDoNotMatch';

  // Network errors
  static const String networkError = 'networkError';
  static const String serverError = 'serverError';
  static const String timeoutError = 'timeoutError';

  // Generic fallback messages (used only when localization fails)
  static const Map<String, String> fallbackMessages = {
    invalidEmailOrPassword: 'Email o password non validi',
    unexpectedError: 'Si è verificato un errore imprevisto. Riprova.',
    emailNotConfirmed: 'Email non confermata. Controlla la tua casella email.',
    weakPassword: 'La password deve essere di almeno 6 caratteri',
    emailAlreadyInUse: 'Questa email è già associata a un account',
    tooManyRequests: 'Troppi tentativi. Riprova più tardi.',
    userNotFound: 'Utente non trovato',
    passwordResetEmailSent: 'Email di reset password inviata',
    passwordResetFailed: 'Invio email di reset fallito',
    pleaseEnterEmail: 'Inserisci la tua email',
    pleaseEnterValidEmail: 'Inserisci un\'email valida',
    pleaseEnterPassword: 'Inserisci la tua password',
    passwordMinLength: 'La password deve essere di almeno 6 caratteri',
    passwordsDoNotMatch: 'Le password non corrispondono',
    networkError: 'Errore di rete. Controlla la connessione.',
    serverError: 'Errore del server. Riprova più tardi.',
    timeoutError: 'Timeout della richiesta. Riprova.',
  };
}
