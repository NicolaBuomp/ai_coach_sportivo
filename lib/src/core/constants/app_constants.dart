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
}
