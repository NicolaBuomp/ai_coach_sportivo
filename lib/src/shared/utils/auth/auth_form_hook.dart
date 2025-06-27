import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_coach_sportivo/src/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:ai_coach_sportivo/src/shared/utils/auth/auth_error_utils.dart';
import 'package:ai_coach_sportivo/src/shared/utils/common/notification_utils.dart';
import 'package:ai_coach_sportivo/src/core/config/l10n/app_localizations.dart';

/// Hook riutilizzabile per la logica di autenticazione
class AuthFormHook {
  AuthFormHook({
    required this.ref,
    required this.context,
    required this.emailController,
    required this.passwordController,
    this.confirmPasswordController,
  });

  final WidgetRef ref;
  final BuildContext context;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController? confirmPasswordController;

  late final AppLocalizations l10n = AppLocalizations.of(context)!;

  AuthState get authState => ref.watch(authProvider);
  AuthNotifier get authNotifier => ref.read(authProvider.notifier);

  /// Gestisce il login
  Future<void> handleSignIn() async {
    if (!_validateForm()) return;

    await authNotifier.signIn(
      emailController.text.trim(),
      passwordController.text,
    );
  }

  /// Gestisce la registrazione
  Future<void> handleSignUp() async {
    if (!_validateForm(includeConfirmPassword: true)) return;

    final success = await authNotifier.signUp(
      emailController.text.trim(),
      passwordController.text,
    );

    // Se la registrazione è andata a buon fine, mostra messaggio e naviga
    if (success && context.mounted) {
      // Mostra messaggio di successo
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.accountCreatedSuccessfully),
          backgroundColor: Theme.of(context).colorScheme.primary,
          duration: const Duration(seconds: 3),
        ),
      );

      // Cancella il messaggio di successo dal state per evitare duplicati
      authNotifier.clearSuccess();

      // Naviga alla schermata di conferma email dopo un breve delay
      Future.delayed(const Duration(seconds: 1), () {
        if (context.mounted) {
          context.go(
            '/email-confirmation?email=${Uri.encodeComponent(emailController.text.trim())}',
          );
        }
      });
    }
  }

  /// Gestisce il login con Google
  Future<void> handleGoogleSignIn() async {
    await authNotifier.signInWithGoogle();
  }

  /// Gestisce il login con Apple
  Future<void> handleAppleSignIn() async {
    await authNotifier.signInWithApple();
  }

  /// Valida il form
  bool _validateForm({bool includeConfirmPassword = false}) {
    final emailError = AuthErrorUtils.getEmailValidationMessage(
      l10n,
      emailController.text,
    );

    final passwordError = AuthErrorUtils.getPasswordValidationMessage(
      l10n,
      passwordController.text,
    );

    String? confirmPasswordError;
    if (includeConfirmPassword && confirmPasswordController != null) {
      confirmPasswordError = AuthErrorUtils.getConfirmPasswordValidationMessage(
        l10n,
        confirmPasswordController!.text,
        passwordController.text,
      );
    }

    final isValid =
        emailError == null &&
        passwordError == null &&
        (confirmPasswordError == null || !includeConfirmPassword);

    if (!isValid) {
      final firstError = emailError ?? passwordError ?? confirmPasswordError;
      if (firstError != null) {
        NotificationUtils.showError(context, firstError);
      }
    }

    return isValid;
  }

  /// Cancella gli errori
  void clearError() {
    authNotifier.clearError();
  }

  /// Validatori per i campi
  String? emailValidator(String? value) =>
      AuthErrorUtils.getEmailValidationMessage(l10n, value);

  String? passwordValidator(String? value) =>
      AuthErrorUtils.getPasswordValidationMessage(l10n, value);

  String? confirmPasswordValidator(String? value) =>
      AuthErrorUtils.getConfirmPasswordValidationMessage(
        l10n,
        value,
        passwordController.text,
      );

  /// Pulisce le risorse
  void dispose() {
    // Hook per la pulizia delle risorse se necessario
  }
}
