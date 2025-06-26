/// Costanti per stringhe non localizzate dell'app
class AppConstants {
  // === INFO APP ===
  static const String appName = 'AI Coach Sportivo';
  static const String appVersion = '1.0.0';
  static const String appDescription =
      'Il tuo personal trainer virtuale con intelligenza artificiale';

  // === CHIAVI STORAGE ===
  static const String isFirstLaunch = 'is_first_launch';
  static const String userToken = 'user_token';
  static const String userPreferences = 'user_preferences';
  static const String themeMode = 'theme_mode';
  static const String language = 'language';
  static const String workoutHistory = 'workout_history';
  static const String achievements = 'achievements';

  // === URL E API ===
  static const String privacyPolicyUrl = 'https://example.com/privacy';
  static const String termsOfServiceUrl = 'https://example.com/terms';
  static const String supportUrl = 'https://example.com/support';
  static const String apiBaseUrl = 'https://api.example.com';

  // === SOCIAL MEDIA ===
  static const String facebookUrl = 'https://facebook.com/aicoachsportivo';
  static const String instagramUrl = 'https://instagram.com/aicoachsportivo';
  static const String twitterUrl = 'https://twitter.com/aicoachsportivo';

  // === SPORT TYPES ===
  static const List<String> sportTypes = [
    'running',
    'cycling',
    'swimming',
    'weightlifting',
    'yoga',
    'pilates',
    'boxing',
    'tennis',
    'football',
    'basketball',
  ];

  // === WORKOUT DIFFICULTY ===
  static const List<String> difficultyLevels = [
    'beginner',
    'intermediate',
    'advanced',
    'expert',
  ];

  // === UNITS ===
  static const String weightUnit = 'kg';
  static const String distanceUnit = 'km';
  static const String timeUnit = 'min';
  static const String calorieUnit = 'cal';

  // === LIMITI ===
  static const int maxWorkoutDuration = 300; // minuti
  static const int minWorkoutDuration = 5; // minuti
  static const int maxUsernameLength = 30;
  static const int minPasswordLength = 8;
  static const int maxBioLength = 500;

  // === FORMATI ===
  static const String dateFormat = 'dd/MM/yyyy';
  static const String timeFormat = 'HH:mm';
  static const String dateTimeFormat = 'dd/MM/yyyy HH:mm';

  // === REGEX PATTERNS ===
  static const String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  static const String phonePattern = r'^\+?[\d\s\-\(\)]{10,}$';
  static const String usernamePattern = r'^[a-zA-Z0-9_]{3,30}$';

  // === ERROR CODES ===
  static const String networkError = 'NETWORK_ERROR';
  static const String authError = 'AUTH_ERROR';
  static const String validationError = 'VALIDATION_ERROR';
  static const String unknownError = 'UNKNOWN_ERROR';

  // === ACHIEVEMENT TYPES ===
  static const List<String> achievementTypes = [
    'first_workout',
    'week_streak',
    'month_streak',
    'distance_milestone',
    'time_milestone',
    'weight_milestone',
  ];

  // === GLASSMORPHISM ===
  static const double defaultBlur = 20.0;
  static const double defaultOpacity = 0.1;

  // === SPORTING LEVELS ===
  static const List<String> sportingLevels = [
    'beginner',
    'intermediate',
    'advanced',
    'semi_pro',
  ];

  // === GENDER OPTIONS ===
  static const List<String> genderOptions = ['male', 'female', 'other'];

  // === UNIT SYSTEMS ===
  static const List<String> unitSystems = ['metric', 'imperial'];

  // === UI THEMES ===
  static const List<String> uiThemes = ['system', 'light', 'dark'];

  // === SUPPORTED LANGUAGES ===
  static const List<String> supportedLanguages = ['it', 'en'];

  // === PROFILE VALIDATION ===
  static const int minHeight = 50; // cm
  static const int maxHeight = 250; // cm
  static const double minWeight = 20.0; // kg
  static const double maxWeight = 300.0; // kg
  static const int minAge = 13; // anni
  static const int maxAge = 100; // anni

  // === AUTHENTICATION ===
  static const int maxPasswordLength = 128;
  static const String emailRegexPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  static const String passwordStrongRegex =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]';
  static const String passwordStrengthLabel = 'Forza password';

  // === AUTH ERROR KEYS ===
  static const String errorInvalidEmailOrPassword = 'invalidEmailOrPassword';
  static const String errorPleaseVerifyEmail = 'pleaseVerifyEmail';
  static const String errorEmailAlreadyExists = 'emailAlreadyExists';
  static const String errorGoogleSignInFailed = 'googleSignInFailed';
  static const String errorAppleSignInFailed = 'appleSignInFailed';
  static const String errorAuthenticationCancelled = 'authenticationCancelled';
  static const String errorUnexpectedError = 'unexpectedError';

  // === AUTH SUCCESS KEYS ===
  static const String successAccountCreated = 'accountCreatedSuccessfully';
  static const String successLoginComplete = 'loginSuccessful';
}
