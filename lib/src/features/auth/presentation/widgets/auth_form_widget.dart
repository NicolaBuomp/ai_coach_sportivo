import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_coach_sportivo/src/core/config/l10n/app_localizations.dart';
import 'package:ai_coach_sportivo/src/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:ai_coach_sportivo/src/shared/widgets/widgets.dart';
import 'package:ai_coach_sportivo/src/shared/utils/auth/auth_form_hook.dart';
import 'package:ai_coach_sportivo/src/shared/providers/loading_provider.dart';
import 'widgets.dart';

/// Widget base per i form di autenticazione
class AuthFormWidget extends ConsumerStatefulWidget {
  const AuthFormWidget({
    super.key,
    required this.formType,
    required this.onSubmit,
    this.showGoogleAuth = true,
    this.showAppleAuth = true,
    this.title,
    this.subtitle,
  });

  final AuthFormType formType;
  final VoidCallback onSubmit;
  final bool showGoogleAuth;
  final bool showAppleAuth;
  final String? title;
  final String? subtitle;

  @override
  ConsumerState<AuthFormWidget> createState() => _AuthFormWidgetState();
}

class _AuthFormWidgetState extends ConsumerState<AuthFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  late AuthFormHook _authHook;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _authHook = AuthFormHook(
        ref: ref,
        context: context,
        emailController: _emailController,
        passwordController: _passwordController,
        confirmPasswordController: widget.formType == AuthFormType.signUp
            ? _confirmPasswordController
            : null,
      );
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _authHook.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final authState = ref.watch(authProvider);
    final isGlobalLoading = ref.watch(globalLoadingProvider);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          if (widget.title != null)
            AuthHeader(title: widget.title!, subtitle: widget.subtitle),

          const SizedBox(height: 32),

          // Email field
          AuthTextField(
            controller: _emailController,
            labelText: l10n.email,
            prefixIcon: const Icon(Icons.email_outlined),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            enabled: !isGlobalLoading,
            errorText: !authState.isEmailValid
                ? l10n.pleaseEnterValidEmail
                : null,
            validator: _authHook.emailValidator,
            onChanged: (_) => _authHook.clearError(),
          ),

          const SizedBox(height: 16),

          // Password field
          PasswordTextField(
            controller: _passwordController,
            labelText: l10n.password,
            textInputAction: widget.formType == AuthFormType.signUp
                ? TextInputAction.next
                : TextInputAction.done,
            enabled: !isGlobalLoading,
            errorText: !authState.isPasswordValid
                ? l10n.passwordMinLength
                : null,
            validator: _authHook.passwordValidator,
            onChanged: (_) => _authHook.clearError(),
            onFieldSubmitted: widget.formType == AuthFormType.signIn
                ? (_) => _authHook.handleSignIn()
                : null,
            showStrengthIndicator: widget.formType == AuthFormType.signUp,
          ),

          // Confirm password field (only for sign up)
          if (widget.formType == AuthFormType.signUp) ...[
            const SizedBox(height: 16),
            PasswordTextField(
              controller: _confirmPasswordController,
              labelText: l10n.confirmPassword,
              textInputAction: TextInputAction.done,
              enabled: !isGlobalLoading,
              validator: _authHook.confirmPasswordValidator,
              onChanged: (_) => _authHook.clearError(),
              onFieldSubmitted: (_) => _authHook.handleSignUp(),
            ),
          ],

          const SizedBox(height: 24),

          // Error message
          if (authState.error != null)
            ErrorMessage(message: _authHook.l10n.unexpectedError),

          // Primary button - senza loading interno
          PrimaryAuthButton(
            text: widget.formType == AuthFormType.signIn
                ? l10n.signIn
                : l10n.signUp,
            onPressed: widget.formType == AuthFormType.signIn
                ? _authHook.handleSignIn
                : _authHook.handleSignUp,
            isLoading: false, // Usiamo solo il loading globale
          ),

          // Social auth buttons - senza loading interno
          if (widget.showGoogleAuth || widget.showAppleAuth) ...[
            const SizedBox(height: 24),

            if (widget.showGoogleAuth)
              SocialAuthButton(
                text: widget.formType == AuthFormType.signIn
                    ? l10n.signInWithGoogle
                    : l10n.signUpWithGoogle,
                onPressed: _authHook.handleGoogleSignIn,
                isLoading: false, // Usiamo solo il loading globale
              ),

            if (widget.showAppleAuth) ...[
              const SizedBox(height: 16),
              SocialAuthButton(
                text: widget.formType == AuthFormType.signIn
                    ? l10n.signInWithApple
                    : l10n.signUpWithApple,
                onPressed: _authHook.handleAppleSignIn,
                isLoading: false, // Usiamo solo il loading globale
              ),
            ],
          ],
        ],
      ),
    );
  }
}

/// Enum per il tipo di form di autenticazione
enum AuthFormType { signIn, signUp }
