import 'dart:io';

import 'package:ai_coach_sportivo/src/core/config/l10n/app_localizations.dart';
import 'package:ai_coach_sportivo/src/core/constants/app_route_name.dart';
import 'package:ai_coach_sportivo/src/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:ai_coach_sportivo/src/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:ai_coach_sportivo/src/features/auth/presentation/widgets/password_text_field.dart';
import 'package:ai_coach_sportivo/src/features/auth/presentation/widgets/auth_buttons.dart';
import 'package:ai_coach_sportivo/src/features/auth/presentation/widgets/auth_widgets.dart';
import 'package:ai_coach_sportivo/src/shared/widgets/common/message_widgets.dart';
import 'package:ai_coach_sportivo/src/shared/utils/auth/auth_form_hook.dart';
import 'package:ai_coach_sportivo/src/shared/providers/loading_provider.dart';
import 'package:ai_coach_sportivo/src/shared/widgets/common/global_loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
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
      );
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _authHook?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final authState = ref.watch(authProvider);
    final isGlobalLoading = ref.watch(globalLoadingProvider);

    // Listen to auth state changes
    ref.listen<AuthState>(authProvider, (previous, next) {
      if (!context.mounted) return;

      // Handle success messages
      if (next.successMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.successMessage!),
            backgroundColor: Theme.of(context).colorScheme.primary,
            duration: const Duration(seconds: 3),
          ),
        );
        ref.read(authProvider.notifier).clearSuccess();
      }
    });

    return GlobalLoadingOverlay(
      isLoading: isGlobalLoading,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 60),

                        // Header con animazione
                        AuthHeader(title: l10n.welcomeBack),

                        const SizedBox(height: 48),

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
                          validator: _authHook?.emailValidator,
                          onChanged: (_) => _authHook?.clearError(),
                        ),

                        const SizedBox(height: 16),

                        // Password field
                        PasswordTextField(
                          controller: _passwordController,
                          labelText: l10n.password,
                          textInputAction: TextInputAction.done,
                          enabled: !isGlobalLoading,
                          errorText: !authState.isPasswordValid
                              ? l10n.passwordMinLength
                              : null,
                          validator: _authHook?.passwordValidator,
                          onChanged: (_) => _authHook?.clearError(),
                          onFieldSubmitted: (_) => _authHook?.handleSignIn(),
                        ),

                        const SizedBox(height: 16),

                        // Forgot password link
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: isGlobalLoading
                                ? null
                                : () => context.go(forgotPasswordRoute),
                            child: Text(
                              'Password dimenticata?',
                            ), // TODO: Add to localization
                          ),
                        ),

                        const SizedBox(height: 8),

                        // Error message
                        if (authState.error != null)
                          ErrorMessage(message: authState.error!),

                        // Primary login button - senza loading interno
                        PrimaryAuthButton(
                          text: l10n.signIn,
                          onPressed: _authHook?.handleSignIn,
                          isLoading: false, // Usiamo solo il loading globale
                        ),

                        const SizedBox(height: 24),

                        // Google login button - senza loading interno
                        SocialAuthButton(
                          text: l10n.signInWithGoogle,
                          onPressed: _authHook?.handleGoogleSignIn,
                          isLoading: false, // Usiamo solo il loading globale
                        ),

                        const SizedBox(height: 16),

                        // Apple login button (solo su dispositivi Apple) - senza loading interno
                        if (Platform.isIOS || Platform.isMacOS)
                          SocialAuthButton(
                            text: l10n.signInWithApple,
                            onPressed: _authHook?.handleAppleSignIn,
                            isLoading: false, // Usiamo solo il loading globale
                          ),
                      ],
                    ),
                  ),
                ),
              ),

              // Bottom navigation area
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextButton(
                  onPressed: isGlobalLoading
                      ? null
                      : () => context.pushNamed(signUpRoute),
                  child: Text(l10n.dontHaveAccount),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
