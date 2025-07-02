import 'package:ai_coach_sportivo/src/core/config/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_coach_sportivo/src/core/constants/app_route_name.dart';
import 'package:ai_coach_sportivo/src/core/constants/app_dimensions.dart';
import 'package:ai_coach_sportivo/src/core/constants/app_durations.dart';
import 'package:ai_coach_sportivo/src/features/auth/data/auth_repository.dart';
import 'package:ai_coach_sportivo/src/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:ai_coach_sportivo/src/features/auth/presentation/widgets/auth_buttons.dart';
import 'package:ai_coach_sportivo/src/features/auth/presentation/widgets/auth_widgets.dart';
import 'package:ai_coach_sportivo/src/shared/utils/auth/validation_utils.dart';
import 'package:ai_coach_sportivo/src/shared/providers/loading_provider.dart';
import 'package:ai_coach_sportivo/src/shared/widgets/common/global_loading_overlay.dart';
import 'package:ai_coach_sportivo/src/shared/widgets/common/keyboard_dismiss_wrapper.dart';

/// Schermata per il recupero password
class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _emailSent = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: AppDurations.slow,
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _sendResetEmail() async {
    if (!_formKey.currentState!.validate()) return;

    final l10n = AppLocalizations.of(context)!;

    try {
      await LoadingService.withLoading(ref, () async {
        await ref
            .read(authRepositoryProvider)
            .resetPassword(_emailController.text.trim());
      }, 'Invio email di recupero...');

      setState(() {
        _emailSent = true;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.passwordResetEmailSent),
            backgroundColor: Theme.of(context).colorScheme.primary,
            duration: AppDurations.snackbar,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.errorSendingRecoveryEmail),
            backgroundColor: Theme.of(context).colorScheme.error,
            duration: AppDurations.snackbar,
          ),
        );
      }
    }
  }

  void _tryAgain() {
    setState(() {
      _emailSent = false;
      _emailController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isGlobalLoading = ref.watch(globalLoadingProvider);
    final l10n = AppLocalizations.of(context)!;

    return GlobalLoadingOverlay(
      isLoading: isGlobalLoading,
      child: KeyboardDismissWrapper(
        child: Scaffold(
          appBar: AppBar(
            title: Text(l10n.forgotPasswordTitle),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: FadeTransition(
            opacity: _fadeAnimation,
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppDimensions.paddingL),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: AppDimensions.spacing32),

                      if (!_emailSent) ...[
                        // Header
                        AuthHeader(
                          title: l10n.recoverPassword,
                          subtitle: l10n.enterEmailForInstructions,
                        ),

                        const SizedBox(height: AppDimensions.spacing48),

                        // Email field
                        AuthTextField(
                          controller: _emailController,
                          labelText: l10n.email,
                          prefixIcon: const Icon(Icons.email_outlined),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          enabled: !isGlobalLoading,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return l10n.pleaseEnterEmail;
                            }
                            if (!ValidationUtils.isValidEmail(value)) {
                              return l10n.pleaseEnterValidEmail;
                            }
                            return null;
                          },
                          onFieldSubmitted: (_) => _sendResetEmail(),
                        ),

                        const SizedBox(height: AppDimensions.spacing32),

                        // Send button
                        PrimaryAuthButton(
                          text: l10n.sendRecoveryEmail,
                          onPressed: _sendResetEmail,
                          isLoading: false, // Usiamo solo il loading globale
                        ),

                        const SizedBox(height: AppDimensions.spacing24),

                        // Info card
                        Card(
                          elevation: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(
                              AppDimensions.paddingM,
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  color: colorScheme.primary,
                                  size: 24,
                                ),
                                const SizedBox(height: AppDimensions.spacing8),
                                Text(
                                  l10n.recoveryEmailInfo,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ] else ...[
                        // Success state
                        Column(
                          children: [
                            const SizedBox(height: AppDimensions.spacing48),

                            // Success icon
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: colorScheme.primaryContainer,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.mark_email_read_outlined,
                                size: 60,
                                color: colorScheme.onPrimaryContainer,
                              ),
                            ),

                            const SizedBox(height: AppDimensions.spacing32),

                            Text(
                              l10n.emailSent,
                              style: theme.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onSurface,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: AppDimensions.spacing16),

                            Text(
                              l10n.recoveryInstructionsSent,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: AppDimensions.spacing8),

                            Text(
                              _emailController.text,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme.primary,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: AppDimensions.spacing32),

                            // Actions
                            PrimaryAuthButton(
                              text: l10n.checkEmail,
                              onPressed: () => context.goNamed(loginRoute),
                              isLoading: false,
                            ),

                            const SizedBox(height: AppDimensions.spacing16),

                            OutlinedButton(
                              onPressed: _tryAgain,
                              child: Text(l10n.useAnotherEmail),
                            ),
                          ],
                        ),
                      ],

                      const SizedBox(height: AppDimensions.spacing48),

                      // Back to login
                      TextButton(
                        onPressed: () => context.goNamed(loginRoute),
                        child: Text(l10n.backToLogin),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
