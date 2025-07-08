import 'package:ai_coach_sportivo/src/core/config/l10n/app_localizations.dart';
import 'package:ai_coach_sportivo/src/shared/widgets/common/keyboard_dismiss_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_coach_sportivo/src/core/constants/app_route_name.dart';
import 'package:ai_coach_sportivo/src/core/constants/app_dimensions.dart';
import 'package:ai_coach_sportivo/src/core/constants/app_durations.dart';
import 'package:ai_coach_sportivo/src/features/auth/data/auth_repository.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/services.dart';

/// Schermata per la conferma dell'email
class EmailConfirmationScreen extends ConsumerStatefulWidget {
  const EmailConfirmationScreen({super.key, required this.email});

  final String email;

  @override
  ConsumerState<EmailConfirmationScreen> createState() =>
      _EmailConfirmationScreenState();
}

class _EmailConfirmationScreenState
    extends ConsumerState<EmailConfirmationScreen>
    with TickerProviderStateMixin {
  bool _isResending = false;
  bool _canResend = true;
  int _countdown = 0;
  late AnimationController _animationController;
  late AnimationController _pulseController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: AppDurations.ms500,
      vsync: this,
    );
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _animationController.forward();
    _pulseController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  Future<void> _resendConfirmation() async {
    if (!_canResend) return;

    setState(() {
      _isResending = true;
      _canResend = false;
    });

    try {
      await ref.read(authRepositoryProvider).resendConfirmation(widget.email);

      if (mounted) {
        HapticFeedback.lightImpact();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.emailSentTo(widget.email),
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
            duration: AppDurations.snackbar,
            behavior: SnackBarBehavior.floating,
          ),
        );

        _startCountdown();
      }
    } catch (e) {
      if (mounted) {
        HapticFeedback.lightImpact();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.failedToResendEmail(e.toString()),
            ),
            backgroundColor: Theme.of(context).colorScheme.error,
            duration: AppDurations.snackbar,
            behavior: SnackBarBehavior.floating,
          ),
        );
        setState(() => _canResend = true);
      }
    } finally {
      if (mounted) {
        setState(() => _isResending = false);
      }
    }
  }

  void _startCountdown() {
    setState(() => _countdown = 60);

    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        setState(() => _countdown--);
        if (_countdown <= 0) {
          setState(() => _canResend = true);
          return false;
        }
        return true;
      }
      return false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return KeyboardDismissWrapper(
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.verifyYourEmail),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: FadeTransition(
          opacity: _fadeAnimation,
          child: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(AppDimensions.spacingL),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Icona email con animazione
                                AnimatedBuilder(
                                  animation: _pulseAnimation,
                                  builder: (context, child) {
                                    return Transform.scale(
                                      scale: _pulseAnimation.value,
                                      child: Container(
                                        width: 120,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          color: colorScheme.primaryContainer,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: colorScheme.primary
                                                  .withValues(alpha: 0.2),
                                              blurRadius: 20,
                                              offset: const Offset(0, 10),
                                            ),
                                          ],
                                        ),
                                        child: Icon(
                                          Icons.mark_email_unread_outlined,
                                          size: 60,
                                          color: colorScheme.onPrimaryContainer,
                                        ),
                                      ),
                                    );
                                  },
                                ),

                                const SizedBox(height: AppDimensions.spacing48),

                                // Titolo
                                Text(
                                  l10n.verifyYourEmail,
                                  style: theme.textTheme.headlineSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: colorScheme.onSurface,
                                      ),
                                  textAlign: TextAlign.center,
                                ),

                                const SizedBox(height: AppDimensions.spacing16),

                                // Descrizione
                                Text(
                                  l10n.emailSentTo(widget.email),
                                  style: theme.textTheme.bodyLarge?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                  textAlign: TextAlign.center,
                                ),

                                const SizedBox(height: AppDimensions.spacing8),

                                Text(
                                  l10n.checkEmailAndClick,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                  textAlign: TextAlign.center,
                                ),

                                const SizedBox(height: AppDimensions.spacing48),

                                // Card con azioni
                                Card(
                                  elevation: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                      AppDimensions.spacingL,
                                    ),
                                    child: Column(
                                      children: [
                                        // Resend button
                                        SizedBox(
                                          width: double.infinity,
                                          child: OutlinedButton.icon(
                                            onPressed:
                                                _canResend && !_isResending
                                                ? _resendConfirmation
                                                : null,
                                            icon: _isResending
                                                ? LoadingAnimationWidget.inkDrop(
                                                    color: Theme.of(
                                                      context,
                                                    ).colorScheme.primary,
                                                    size: 16,
                                                  )
                                                : const Icon(
                                                    Icons.send_rounded,
                                                  ),
                                            label: Text(
                                              _canResend
                                                  ? l10n.resendEmail
                                                  : '${l10n.resendEmail} ($_countdown s)',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: AppDimensions.spacing16,
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton.icon(
                                            onPressed: () {
                                              HapticFeedback.lightImpact();
                                              context.go(loginRoute);
                                            },
                                            icon: const Icon(
                                              Icons.arrow_back_rounded,
                                            ),
                                            label: Text(l10n.backToLogin),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Bottom actions
                          Container(
                            padding: const EdgeInsets.only(top: 16),
                            child: Column(
                              children: [
                                const Divider(),
                                const SizedBox(height: 16),

                                InkWell(
                                  onTap: () {
                                    HapticFeedback.lightImpact();
                                    context.go(signUpRoute);
                                  },
                                  borderRadius: BorderRadius.circular(8),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.alternate_email,
                                          size: 20,
                                          color: colorScheme.primary,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          l10n.useAnotherEmail,
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                                color: colorScheme.primary,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
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
    );
  }
}
