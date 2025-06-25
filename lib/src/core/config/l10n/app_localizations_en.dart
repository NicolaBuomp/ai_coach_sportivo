// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'AI Sport Coach';

  @override
  String get welcomeBack => 'Welcome Back';

  @override
  String get signInToAccount => 'Sign in to your AI Coach account';

  @override
  String get createAccount => 'Create Account';

  @override
  String get joinAiCoach => 'Join AI Coach today';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get signIn => 'Sign In';

  @override
  String get signInWithGoogle => 'Continue with Google';

  @override
  String get signInWithApple => 'Continue with Apple';

  @override
  String get signUp => 'Sign Up';

  @override
  String get signUpWithGoogle => 'Sign Up with Google';

  @override
  String get signUpWithApple => 'Sign Up with Apple';

  @override
  String get signUpDescription => 'Join AI Coach today and start your journey!';

  @override
  String get alreadyHaveAccount => 'Already have an account? Sign In';

  @override
  String get dontHaveAccount => 'Don\'t have an account? Sign Up';

  @override
  String get verifyYourEmail => 'Verify Your Email';

  @override
  String emailSentTo(String email) {
    return 'We\'ve sent a verification email to $email';
  }

  @override
  String get checkEmailAndClick =>
      'Please check your email and click the verification link to continue';

  @override
  String get resendEmail => 'Resend Email';

  @override
  String get checkStatus => 'Check Status';

  @override
  String get emailVerifiedSuccessfully =>
      'Email verified successfully! Redirecting...';

  @override
  String get pleaseEnterEmail => 'Please enter your email';

  @override
  String get pleaseEnterValidEmail => 'Please enter a valid email';

  @override
  String get pleaseEnterPassword => 'Please enter your password';

  @override
  String get passwordMinLength => 'Password must be at least 6 characters';

  @override
  String get pleaseConfirmPassword => 'Please confirm your password';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String loginFailed(String error) {
    return 'Login failed: $error';
  }

  @override
  String signUpFailed(String error) {
    return 'Sign up failed: $error';
  }

  @override
  String get pleaseVerifyEmail => 'Please verify your email address first.';

  @override
  String get emailNotVerified =>
      'Email not verified yet. Please check your email.';

  @override
  String failedToResendEmail(String error) {
    return 'Failed to resend email: $error';
  }

  @override
  String get onboardingTitle1 => 'Welcome to AI Coach';

  @override
  String get onboardingDescription1 =>
      'Your personal AI-powered coach to achieve your goals.';

  @override
  String get onboardingTitle2 => 'Track Your Progress';

  @override
  String get onboardingDescription2 =>
      'Monitor your performance, analyze data, and improve constantly.';

  @override
  String get onboardingTitle3 => 'Personalized Plans';

  @override
  String get onboardingDescription3 =>
      'Receive workout plans tailored to your needs and level.';

  @override
  String get skip => 'Skip';

  @override
  String get next => 'Next';

  @override
  String get getStarted => 'Get Started';

  @override
  String get accountCreatedSuccessfully =>
      'Account created successfully! Please check your email to verify your account.';

  @override
  String get invalidEmailOrPassword => 'Invalid email or password';

  @override
  String get emailAlreadyExists => 'An account with this email already exists';

  @override
  String get unexpectedError =>
      'An unexpected error occurred. Please try again.';

  @override
  String get quickActions => 'Quick Actions';

  @override
  String get startWorkout => 'Start Workout';

  @override
  String get beginTraining => 'Begin your training';

  @override
  String get viewProgress => 'View Progress';

  @override
  String get trackStats => 'Track your stats';

  @override
  String get schedule => 'Schedule';

  @override
  String get planWeek => 'Plan your week';

  @override
  String get settings => 'Settings';

  @override
  String get customizeApp => 'Customize app';

  @override
  String get aiCoachReady =>
      'Your AI Coach is ready to help you achieve your goals!';

  @override
  String get home => 'Home';

  @override
  String get training => 'Training';

  @override
  String get calendar => 'Calendar';

  @override
  String get profile => 'Profile';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get logout => 'Logout';

  @override
  String get changeTheme => 'Change Theme';

  @override
  String get changeLanguage => 'Change Language';

  @override
  String get plans => 'Plans';

  @override
  String get activities => 'Activities';

  @override
  String get settingsPage => 'Settings page.';

  @override
  String get yourPlans => 'Here your training plans will be shown.';

  @override
  String get yourActivities => 'Here your activities will be shown.';

  @override
  String helloUser(Object user) {
    return 'Hello, $user';
  }

  @override
  String get personalInformation => 'Personal Information';

  @override
  String get physicalInformation => 'Physical Information';

  @override
  String get sportingInformation => 'Sporting Information';

  @override
  String get preferences => 'Preferences';

  @override
  String get name => 'Name';

  @override
  String get surname => 'Surname';

  @override
  String get dateOfBirth => 'Date of Birth';

  @override
  String get gender => 'Gender';

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get other => 'Other';

  @override
  String get height => 'Height';

  @override
  String get weight => 'Weight';

  @override
  String get heightCm => 'Height (cm)';

  @override
  String get weightKg => 'Weight (kg)';

  @override
  String get sportingLevel => 'Sporting Level';

  @override
  String get beginner => 'Beginner';

  @override
  String get intermediate => 'Intermediate';

  @override
  String get advanced => 'Advanced';

  @override
  String get semiPro => 'Semi-professional';

  @override
  String get sportPreferences => 'Sport Preferences';

  @override
  String get unitSystem => 'Unit System';

  @override
  String get metric => 'Metric';

  @override
  String get imperial => 'Imperial';

  @override
  String get uiTheme => 'UI Theme';

  @override
  String get system => 'System';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get preferredLanguage => 'Preferred Language';

  @override
  String get italian => 'Italiano';

  @override
  String get english => 'English';

  @override
  String get selectDate => 'Select date';

  @override
  String get fieldRequired => 'Required field';

  @override
  String get invalidHeight => 'Invalid height';

  @override
  String get invalidWeight => 'Invalid weight';

  @override
  String get saveProfile => 'Save Profile';

  @override
  String get profileSavedSuccessfully => 'Profile saved successfully!';

  @override
  String profileSaveError(String error) {
    return 'Save error: $error';
  }

  @override
  String get profileIncomplete => 'Complete your profile to continue';

  @override
  String get completeProfile => 'Complete Profile';

  @override
  String get cancel => 'Cancel';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get running => 'Running';

  @override
  String get cycling => 'Cycling';

  @override
  String get swimming => 'Swimming';

  @override
  String get weightlifting => 'Weightlifting';

  @override
  String get football => 'Football';

  @override
  String get basketball => 'Basketball';

  @override
  String get tennis => 'Tennis';

  @override
  String get volleyball => 'Volleyball';

  @override
  String get yoga => 'Yoga';

  @override
  String get pilates => 'Pilates';

  @override
  String get boxing => 'Boxing';
}
