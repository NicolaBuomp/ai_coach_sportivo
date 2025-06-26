/// Utility per la validazione dei campi di input
class ValidationUtils {
  ValidationUtils._();

  /// Valida un indirizzo email
  static bool isValidEmail(String email) {
    return email.isNotEmpty &&
        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  /// Valida una password
  static bool isValidPassword(String password) {
    return password.length >= 6;
  }

  /// Valida che le password corrispondano
  static bool doPasswordsMatch(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  /// Valida un campo non vuoto
  static bool isNotEmpty(String value) {
    return value.trim().isNotEmpty;
  }

  /// Valida la forza della password
  static PasswordStrength getPasswordStrength(String password) {
    if (password.isEmpty) return PasswordStrength.empty;
    if (password.length < 6) return PasswordStrength.weak;
    if (password.length < 8) return PasswordStrength.fair;

    bool hasLower = password.contains(RegExp(r'[a-z]'));
    bool hasUpper = password.contains(RegExp(r'[A-Z]'));
    bool hasDigit = password.contains(RegExp(r'[0-9]'));
    bool hasSpecial = password.contains(RegExp(r'[!@#$%^&*()]'));

    int score = 0;
    if (hasLower) score++;
    if (hasUpper) score++;
    if (hasDigit) score++;
    if (hasSpecial) score++;

    if (password.length >= 12 && score >= 3) return PasswordStrength.strong;
    if (password.length >= 8 && score >= 2) return PasswordStrength.good;
    return PasswordStrength.fair;
  }
}

/// Enum per la forza della password
enum PasswordStrength { empty, weak, fair, good, strong }

/// Estensione per ottenere informazioni sulla forza della password
extension PasswordStrengthExtension on PasswordStrength {
  String get label {
    switch (this) {
      case PasswordStrength.empty:
        return '';
      case PasswordStrength.weak:
        return 'Debole';
      case PasswordStrength.fair:
        return 'Discreta';
      case PasswordStrength.good:
        return 'Buona';
      case PasswordStrength.strong:
        return 'Forte';
    }
  }

  double get progress {
    switch (this) {
      case PasswordStrength.empty:
        return 0.0;
      case PasswordStrength.weak:
        return 0.2;
      case PasswordStrength.fair:
        return 0.4;
      case PasswordStrength.good:
        return 0.8;
      case PasswordStrength.strong:
        return 1.0;
    }
  }
}
