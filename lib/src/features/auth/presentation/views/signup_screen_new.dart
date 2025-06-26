import 'dart:io';

import 'package:ai_coach_sportivo/src/core/config/l10n/app_localizations.dart';
import 'package:ai_coach_sportivo/src/core/config/router/route_name.dart';
import 'package:ai_coach_sportivo/src/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:ai_coach_sportivo/src/shared/widgets/auth/auth_text_field.dart';
import 'package:ai_coach_sportivo/src/shared/widgets/auth/password_text_field.dart';
import 'package:ai_coach_sportivo/src/shared/widgets/auth/auth_buttons.dart';
import 'package:ai_coach_sportivo/src/shared/widgets/auth/auth_widgets.dart';
import 'package:ai_coach_sportivo/src/shared/widgets/common/message_widgets.dart';
import 'package:ai_coach_sportivo/src/shared/utils/auth/auth_form_hook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  AuthFormHook? _authHook;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authProvider.notifier).clearError();
      _authHook = AuthFormHook(
        ref: ref,
        context: context,
        emailController: _emailController,
        passwordController: _passwordController,
        confirmPasswordController: _confirmPasswordController,
      );
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _authHook?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final authState = ref.watch(authProvider);

    return Scaffold(
      body: LoadingOverlay(
        isLoading: authState.isLoading,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 60),

                  // Header
                  AuthHeader(title: l10n.createAccount),

                  const SizedBox(height: 32),

                  // Email field
                  AuthTextField(
                    controller: _emailController,
                    labelText: l10n.email,
                    prefixIcon: const Icon(Icons.email_outlined),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    enabled: !authState.isLoading,
                    errorText: !authState.isEmailValid
                        ? l10n.pleaseEnterValidEmail
                        : null,
                    validator: _authHook?.emailValidator,
                    onChanged: (_) => _authHook?.clearError(),
                  ),

                  const SizedBox(height: 16),

                  // Password field
                  PasswordTextField(
                    controller: _passwordController,
                    labelText: l10n.password,
                    textInputAction: TextInputAction.next,
                    enabled: !authState.isLoading,
                    errorText: !authState.isPasswordValid
                        ? l10n.passwordMinLength
                        : null,
                    validator: _authHook?.passwordValidator,
                    onChanged: (_) => _authHook?.clearError(),
                    helperText: l10n.passwordMinLength,
                    showStrengthIndicator: true,
                  ),

                  const SizedBox(height: 16),

                  // Confirm Password field
                  PasswordTextField(
                    controller: _confirmPasswordController,
                    labelText: l10n.confirmPassword,
                    textInputAction: TextInputAction.done,
                    enabled: !authState.isLoading,
                    validator: _authHook?.confirmPasswordValidator,
                    onChanged: (_) => _authHook?.clearError(),
                    onFieldSubmitted: (_) => _authHook?.handleSignUp(),
                  ),

                  const SizedBox(height: 24),

                  // Error message
                  if (authState.error != null)
                    ErrorMessage(message: l10n.unexpectedError),

                  // Sign Up button
                  PrimaryAuthButton(
                    text: l10n.signUp,
                    onPressed: _authHook?.handleSignUp,
                    isLoading: authState.isLoading,
                  ),

                  const SizedBox(height: 24),

                  // Google Sign Up button
                  SocialAuthButton(
                    text: l10n.signUpWithGoogle,
                    onPressed: _authHook?.handleGoogleSignIn,
                    isLoading: authState.isLoading,
                  ),

                  const SizedBox(height: 16),

                  // Apple Sign Up button (solo su dispositivi Apple)
                  if (Platform.isIOS || Platform.isMacOS)
                    SocialAuthButton(
                      text: l10n.signUpWithApple,
                      onPressed: _authHook?.handleAppleSignIn,
                      isLoading: authState.isLoading,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: TextButton(
            onPressed: authState.isLoading
                ? null
                : () {
                    // Cancella l'errore prima di navigare
                    _authHook?.clearError();
                    context.goNamed(loginRoute);
                  },
            child: Text(l10n.alreadyHaveAccount),
          ),
        ),
      ),
    );
  }
}
