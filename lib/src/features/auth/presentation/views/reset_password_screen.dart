import 'package:ai_coach_sportivo/src/core/config/l10n/app_localizations.dart';
import 'package:ai_coach_sportivo/src/core/constants/app_route_name.dart';
import 'package:ai_coach_sportivo/src/features/auth/presentation/widgets/auth_buttons.dart';
import 'package:ai_coach_sportivo/src/features/auth/presentation/widgets/auth_widgets.dart';
import 'package:ai_coach_sportivo/src/features/auth/presentation/widgets/password_text_field.dart';
import 'package:ai_coach_sportivo/src/shared/widgets/common/message_widgets.dart';
import 'package:ai_coach_sportivo/src/shared/widgets/common/keyboard_dismiss_wrapper.dart';
import 'package:ai_coach_sportivo/src/shared/providers/loading_provider.dart';
import 'package:ai_coach_sportivo/src/shared/widgets/common/global_loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ResetPasswordScreen extends ConsumerStatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  ConsumerState<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  String? _errorMessage;
  String? _successMessage;
  bool _isLoading = false;

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
      _fadeController.forward();
    });

    // Handle deep links
    Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      final session = data.session;
      if (session != null && data.event == AuthChangeEvent.passwordRecovery) {
        // The user has successfully recovered their password.
        // You can now navigate them to a screen where they can set a new password.
      }
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  Future<void> _resetPassword() async {
    if (!_formKey.currentState!.validate()) return;

    final l10n = AppLocalizations.of(context)!;

    // Chiudi la tastiera
    FocusScope.of(context).unfocus();

    // Feedback aptico
    HapticFeedback.lightImpact();

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _successMessage = null;
    });

    try {
      await LoadingService.withLoading(ref, () async {
        await Supabase.instance.client.auth.updateUser(
          UserAttributes(password: _passwordController.text),
        );
      });

      setState(() {
        _successMessage = l10n.passwordUpdatedSuccessfully;
      });

      // Feedback aptico di successo
      HapticFeedback.mediumImpact();

      // Mostra messaggio di successo e naviga al login
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.passwordUpdatedSuccessfully),
            backgroundColor: Theme.of(context).colorScheme.primary,
            duration: const Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
          ),
        );

        // Attendi un momento per far vedere il messaggio
        await Future.delayed(const Duration(milliseconds: 1500));

        if (mounted) {
          context.go(loginRoute);
        }
      }
    } on AuthException catch (e) {
      setState(() {
        _errorMessage = e.message;
      });
      HapticFeedback.heavyImpact();
    } catch (e) {
      setState(() {
        _errorMessage = l10n.unexpectedErrorOccurred;
      });
      HapticFeedback.heavyImpact();
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isGlobalLoading = ref.watch(globalLoadingProvider);

    return GlobalLoadingOverlay(
      isLoading: isGlobalLoading,
      child: KeyboardDismissWrapper(
        child: Scaffold(
          appBar: AppBar(
            title: Text(l10n.resetPassword),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
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
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(height: 60),

                              // Header
                              AuthHeader(
                                title: l10n.setNewPassword,
                                subtitle: l10n.enterNewPasswordInstructions,
                              ),

                              const SizedBox(height: 48),

                              // Error message
                              if (_errorMessage != null) ...[
                                ErrorMessage(message: _errorMessage!),
                                const SizedBox(height: 16),
                              ],

                              // Success message
                              if (_successMessage != null) ...[
                                SuccessMessage(message: _successMessage!),
                                const SizedBox(height: 16),
                              ],

                              // Password field
                              PasswordTextField(
                                controller: _passwordController,
                                labelText: l10n.newPassword,
                                textInputAction: TextInputAction.next,
                                enabled: !isGlobalLoading && !_isLoading,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return l10n.pleaseEnterNewPassword;
                                  }
                                  if (value.length < 6) {
                                    return l10n.passwordMustBe6Characters;
                                  }
                                  return null;
                                },
                                onChanged: (_) {
                                  setState(() {
                                    _errorMessage = null;
                                  });
                                },
                                onFieldSubmitted: (_) =>
                                    _confirmPasswordFocusNode.requestFocus(),
                              ),

                              const SizedBox(height: 16),

                              // Confirm password field
                              PasswordTextField(
                                controller: _confirmPasswordController,
                                labelText: l10n.confirmPassword,
                                textInputAction: TextInputAction.done,
                                enabled: !isGlobalLoading && !_isLoading,
                                validator: (value) {
                                  if (value != _passwordController.text) {
                                    return l10n.passwordsDoNotMatch;
                                  }
                                  return null;
                                },
                                onChanged: (_) {
                                  setState(() {
                                    _errorMessage = null;
                                  });
                                },
                                onFieldSubmitted: (_) => _resetPassword(),
                              ),

                              const SizedBox(height: 32),

                              // Reset button
                              PrimaryAuthButton(
                                text: l10n.resetPassword,
                                onPressed: (isGlobalLoading || _isLoading)
                                    ? null
                                    : _resetPassword,
                                isLoading: _isLoading,
                              ),

                              const SizedBox(height: 24),

                              // Info card
                              Card(
                                elevation: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.security_outlined,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                        size: 24,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        l10n.passwordSecurityInfo,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.onSurfaceVariant,
                                            ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              const Spacer(),

                              // Back to login
                              Padding(
                                padding: const EdgeInsets.only(bottom: 32),
                                child: TextButton(
                                  onPressed: (isGlobalLoading || _isLoading)
                                      ? null
                                      : () => context.go(loginRoute),
                                  child: Text(l10n.backToLogin),
                                ),
                              ),
                            ],
                          ),
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
