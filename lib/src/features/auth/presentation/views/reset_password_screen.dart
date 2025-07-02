import 'package:ai_coach_sportivo/src/core/config/l10n/app_localizations.dart';
import 'package:ai_coach_sportivo/src/core/constants/app_route_name.dart';
import 'package:ai_coach_sportivo/src/features/auth/presentation/widgets/auth_buttons.dart';
import 'package:ai_coach_sportivo/src/features/auth/presentation/widgets/auth_widgets.dart';
import 'package:ai_coach_sportivo/src/features/auth/presentation/widgets/password_text_field.dart';
import 'package:ai_coach_sportivo/src/shared/widgets/common/message_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ResetPasswordScreen extends ConsumerStatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  ConsumerState<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _errorMessage;
  String? _successMessage;

  @override
  void initState() {
    super.initState();
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
    super.dispose();
  }

  Future<void> _resetPassword() async {
    if (_formKey.currentState!.validate()) {
      final l10n = AppLocalizations.of(context)!;

      setState(() {
        _errorMessage = null;
        _successMessage = null;
      });

      try {
        await Supabase.instance.client.auth.updateUser(
          UserAttributes(password: _passwordController.text),
        );
        setState(() {
          _successMessage = l10n.passwordUpdatedSuccessfully;
        });
        // ignore: use_build_context_synchronously
        context.go(loginRoute);
      } on AuthException catch (e) {
        setState(() {
          _errorMessage = e.message;
        });
      } catch (e) {
        setState(() {
          _errorMessage = l10n.unexpectedErrorOccurred;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.resetPassword)),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AuthHeader(title: l10n.setNewPassword),
                const SizedBox(height: 24),
                if (_errorMessage != null)
                  ErrorMessage(message: _errorMessage!),
                if (_successMessage != null)
                  SuccessMessage(message: _successMessage!),
                const SizedBox(height: 16),
                PasswordTextField(
                  controller: _passwordController,
                  labelText: l10n.newPassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return l10n.pleaseEnterNewPassword;
                    }
                    if (value.length < 6) {
                      return l10n.passwordMustBe6Characters;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                PasswordTextField(
                  controller: _confirmPasswordController,
                  labelText: l10n.confirmPassword,
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return l10n.passwordsDoNotMatch;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                PrimaryAuthButton(
                  text: l10n.resetPassword,
                  onPressed: _resetPassword,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
