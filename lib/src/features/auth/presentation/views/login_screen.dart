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
import 'package:ai_coach_sportivo/src/shared/widgets/common/keyboard_dismiss_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  AuthFormHook? _authHook;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Setup animazioni
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authProvider.notifier).clearError();
      _authHook = AuthFormHook(
        ref: ref,
        context: context,
        emailController: _emailController,
        passwordController: _passwordController,
      );
      _fadeController.forward();
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _fadeController.dispose();
    _authHook?.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    FocusScope.of(context).unfocus();
    _authHook?.handleSignIn();
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
            behavior: SnackBarBehavior.floating,
          ),
        );
        ref.read(authProvider.notifier).clearSuccess();
      }
    });

    return GlobalLoadingOverlay(
      isLoading: isGlobalLoading,
      child: KeyboardDismissWrapper(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          children: [
                            // Main content
                            Expanded(
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const SizedBox(height: 60),

                                    // Header
                                    AuthHeader(
                                      title: l10n.welcomeBack,
                                      subtitle: l10n.signInToAccount,
                                    ),

                                    const SizedBox(height: 48),

                                    // Email field
                                    AuthTextField(
                                      controller: _emailController,
                                      labelText: l10n.email,
                                      prefixIcon: const Icon(
                                        Icons.email_outlined,
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      enabled: !isGlobalLoading,
                                      errorText: !authState.isEmailValid
                                          ? l10n.pleaseEnterValidEmail
                                          : null,
                                      validator: _authHook?.emailValidator,
                                      onChanged: (_) => _authHook?.clearError(),
                                      onFieldSubmitted: (_) =>
                                          _passwordFocusNode.requestFocus(),
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
                                      onFieldSubmitted: (_) => _handleSubmit(),
                                    ),

                                    const SizedBox(height: 8),

                                    // Forgot password link
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                        onPressed: isGlobalLoading
                                            ? null
                                            : () => context.go(
                                                forgotPasswordRoute,
                                              ),
                                        child: Text(l10n.forgotPassword),
                                      ),
                                    ),

                                    const SizedBox(height: 16),

                                    // Error message
                                    if (authState.error != null) ...[
                                      ErrorMessage(message: authState.error!),
                                      const SizedBox(height: 16),
                                    ],

                                    // Primary login button
                                    PrimaryAuthButton(
                                      text: l10n.signIn,
                                      onPressed: isGlobalLoading
                                          ? null
                                          : _handleSubmit,
                                      isLoading: false,
                                    ),

                                    const SizedBox(height: 14),

                                    // Divider per separare login social
                                    Row(
                                      children: [
                                        const Expanded(child: Divider()),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                          ),
                                          child: Text(
                                            'or',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSurfaceVariant,
                                                ),
                                          ),
                                        ),
                                        const Expanded(child: Divider()),
                                      ],
                                    ),

                                    const SizedBox(height: 14),

                                    // Google login button
                                    SocialAuthButton(
                                      text: l10n.signInWithGoogle,
                                      onPressed: isGlobalLoading
                                          ? null
                                          : _authHook?.handleGoogleSignIn,
                                      isLoading: false,
                                      icon: const Icon(
                                        Icons.g_mobiledata,
                                        size: 24,
                                      ),
                                    ),

                                    const SizedBox(height: 16),

                                    // Apple login button (solo su dispositivi Apple)
                                    if (Platform.isIOS || Platform.isMacOS)
                                      SocialAuthButton(
                                        text: l10n.signInWithApple,
                                        onPressed: isGlobalLoading
                                            ? null
                                            : _authHook?.handleAppleSignIn,
                                        isLoading: false,
                                        icon: const Icon(Icons.apple, size: 24),
                                      ),

                                    const Spacer(),
                                  ],
                                ),
                              ),
                            ),

                            // Bottom section per signup
                            Container(
                              padding: const EdgeInsets.only(
                                top: 16,
                                bottom: 32,
                              ),
                              child: Column(
                                children: [
                                  const Divider(),
                                  const SizedBox(height: 16),
                                  InkWell(
                                    onTap: isGlobalLoading
                                        ? null
                                        : () => context.go(signUpRoute),
                                    borderRadius: BorderRadius.circular(8),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium,
                                          children: [
                                            TextSpan(
                                              text:
                                                  "${l10n.dontHaveAccount.split('?')[0]}? ",
                                              style: TextStyle(
                                                color: Theme.of(
                                                  context,
                                                ).colorScheme.onSurfaceVariant,
                                              ),
                                            ),
                                            TextSpan(
                                              text: l10n.signUp,
                                              style: TextStyle(
                                                color: Theme.of(
                                                  context,
                                                ).colorScheme.primary,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
