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
  String get signInWithGoogle => 'Continua con Google';

  @override
  String get signInWithApple => 'Continua con Apple';

  @override
  String get signUp => 'Registrati';

  @override
  String get signUpWithGoogle => 'Registrati con Google';

  @override
  String get signUpWithApple => 'Registrati con Apple';

  @override
  String get signUpDescription =>
      'Unisciti ad AI Coach oggi e inizia il tuo percorso!';

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

  @override
  String get onboardingTitle1 => 'Benvenuto in AI Coach';

  @override
  String get onboardingDescription1 =>
      'Il tuo allenatore personale basato sull\'intelligenza artificiale per raggiungere i tuoi obiettivi.';

  @override
  String get onboardingTitle2 => 'Traccia i Tuoi Progressi';

  @override
  String get onboardingDescription2 =>
      'Monitora le tue performance, analizza i dati e migliora costantemente.';

  @override
  String get onboardingTitle3 => 'Piani Personalizzati';

  @override
  String get onboardingDescription3 =>
      'Ricevi piani di allenamento su misura per le tue esigenze e il tuo livello.';

  @override
  String get skip => 'Salta';

  @override
  String get next => 'Avanti';

  @override
  String get getStarted => 'Inizia';

  @override
  String get accountCreatedSuccessfully =>
      'Account creato con successo! Controlla la tua email per verificare il tuo account.';

  @override
  String get invalidEmailOrPassword => 'Email o password non validi';

  @override
  String get emailAlreadyExists => 'Esiste già un account con questa email';

  @override
  String get unexpectedError =>
      'Si è verificato un errore imprevisto. Riprova.';

  @override
  String get googleSignInFailed => 'Accesso con Google fallito. Riprova.';

  @override
  String get appleSignInFailed => 'Accesso con Apple fallito. Riprova.';

  @override
  String get authenticationCancelled => 'Autenticazione annullata.';

  @override
  String get quickActions => 'Azioni Rapide';

  @override
  String get startWorkout => 'Inizia Allenamento';

  @override
  String get beginTraining => 'Inizia il tuo allenamento';

  @override
  String get viewProgress => 'Visualizza Progressi';

  @override
  String get trackStats => 'Traccia le tue statistiche';

  @override
  String get schedule => 'Programma';

  @override
  String get planWeek => 'Pianifica la tua settimana';

  @override
  String get settings => 'Impostazioni';

  @override
  String get customizeApp => 'Personalizza app';

  @override
  String get aiCoachReady =>
      'Il tuo AI Coach è pronto ad aiutarti a raggiungere i tuoi obiettivi!';

  @override
  String get home => 'Home';

  @override
  String get training => 'Allenamento';

  @override
  String get calendar => 'Calendario';

  @override
  String get profile => 'Profilo';

  @override
  String get editProfile => 'Modifica Profilo';

  @override
  String get logout => 'Logout';

  @override
  String get changeTheme => 'Cambia Tema';

  @override
  String get changeLanguage => 'Cambia Lingua';

  @override
  String get plans => 'Piani';

  @override
  String get activities => 'Attività';

  @override
  String get settingsPage => 'Pagina delle impostazioni.';

  @override
  String get yourPlans => 'Qui verranno mostrati i tuoi piani di allenamento.';

  @override
  String get yourActivities => 'Qui verranno mostrate le tue attività.';

  @override
  String helloUser(Object user) {
    return 'Ciao, $user';
  }

  @override
  String get personalInformation => 'Informazioni Personali';

  @override
  String get physicalInformation => 'Informazioni Fisiche';

  @override
  String get sportingInformation => 'Informazioni Sportive';

  @override
  String get preferences => 'Preferenze';

  @override
  String get name => 'Nome';

  @override
  String get surname => 'Cognome';

  @override
  String get dateOfBirth => 'Data di nascita';

  @override
  String get gender => 'Genere';

  @override
  String get male => 'Maschio';

  @override
  String get female => 'Femmina';

  @override
  String get other => 'Altro';

  @override
  String get height => 'Altezza';

  @override
  String get weight => 'Peso';

  @override
  String get heightCm => 'Altezza (cm)';

  @override
  String get weightKg => 'Peso (kg)';

  @override
  String get sportingLevel => 'Livello sportivo';

  @override
  String get beginner => 'Principiante';

  @override
  String get intermediate => 'Intermedio';

  @override
  String get advanced => 'Avanzato';

  @override
  String get semiPro => 'Semi-professionista';

  @override
  String get sportPreferences => 'Sport preferiti';

  @override
  String get unitSystem => 'Sistema di unità';

  @override
  String get metric => 'Metrico';

  @override
  String get imperial => 'Imperiale';

  @override
  String get uiTheme => 'Tema UI';

  @override
  String get system => 'Sistema';

  @override
  String get light => 'Chiaro';

  @override
  String get dark => 'Scuro';

  @override
  String get preferredLanguage => 'Lingua preferita';

  @override
  String get italian => 'Italiano';

  @override
  String get english => 'English';

  @override
  String get selectDate => 'Seleziona data';

  @override
  String get fieldRequired => 'Campo obbligatorio';

  @override
  String get invalidHeight => 'Altezza non valida';

  @override
  String get invalidWeight => 'Peso non valido';

  @override
  String get saveProfile => 'Salva Profilo';

  @override
  String get profileSavedSuccessfully => 'Profilo salvato con successo!';

  @override
  String profileSaveError(String error) {
    return 'Errore nel salvataggio: $error';
  }

  @override
  String get profileIncomplete => 'Completa il tuo profilo per continuare';

  @override
  String get completeProfile => 'Completa Profilo';

  @override
  String get cancel => 'Annulla';

  @override
  String get saveChanges => 'Salva Modifiche';

  @override
  String get running => 'Corsa';

  @override
  String get cycling => 'Ciclismo';

  @override
  String get swimming => 'Nuoto';

  @override
  String get weightlifting => 'Sollevamento pesi';

  @override
  String get football => 'Calcio';

  @override
  String get basketball => 'Basket';

  @override
  String get tennis => 'Tennis';

  @override
  String get volleyball => 'Pallavolo';

  @override
  String get yoga => 'Yoga';

  @override
  String get pilates => 'Pilates';

  @override
  String get boxing => 'Boxe';

  @override
  String get forgotPassword => 'Password dimenticata?';

  @override
  String get passwordResetEmailSent => 'Email di reset password inviata';

  @override
  String get passwordResetFailed => 'Invio email di reset fallito';

  @override
  String get emailNotConfirmed =>
      'Email non confermata. Controlla la tua casella email.';

  @override
  String get weakPassword => 'La password deve essere di almeno 6 caratteri';

  @override
  String get emailAlreadyInUse => 'Questa email è già associata a un account';

  @override
  String get tooManyRequests => 'Troppi tentativi. Riprova più tardi.';

  @override
  String get userNotFound => 'Utente non trovato';

  @override
  String get networkError => 'Errore di rete. Controlla la connessione.';

  @override
  String get serverError => 'Errore del server. Riprova più tardi.';

  @override
  String get timeoutError => 'Timeout della richiesta. Riprova.';

  @override
  String get signupDisabled => 'Registrazione temporaneamente disabilitata';

  @override
  String get emailRateLimit =>
      'Troppi tentativi di invio email. Riprova più tardi.';

  @override
  String get passwordTooShort =>
      'La password deve essere di almeno 6 caratteri';

  @override
  String get invalidEmailFormat => 'Formato email non valido';
}
