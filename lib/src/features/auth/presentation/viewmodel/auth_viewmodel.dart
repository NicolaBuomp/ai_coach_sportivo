import 'package:ai_coach_sportivo/src/features/auth/data/auth_repository.dart';
import 'package:ai_coach_sportivo/src/core/constants/app_constants.dart';
import 'package:ai_coach_sportivo/src/shared/providers/loading_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthState {
  const AuthState({
    this.error,
    this.isEmailValid = true,
    this.isPasswordValid = true,
    this.successMessage,
  });

  final String? error;
  final bool isEmailValid;
  final bool isPasswordValid;
  final String? successMessage;

  AuthState copyWith({
    String? error,
    bool? isEmailValid,
    bool? isPasswordValid,
    String? successMessage,
    bool clearError = false,
    bool clearSuccess = false,
  }) {
    return AuthState(
      error: clearError ? null : (error ?? this.error),
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      successMessage: clearSuccess
          ? null
          : (successMessage ?? this.successMessage),
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this._authRepository, this._loadingNotifier)
    : super(const AuthState());

  final AuthRepository _authRepository;
  final LoadingNotifier _loadingNotifier;

  Future<bool> signIn(String email, String password) async {
    if (!_validateInputs(email, password)) {
      return false;
    }

    state = state.copyWith(clearError: true, clearSuccess: true);

    return _loadingNotifier.withLoading(() async {
      try {
        await _authRepository.signIn(email, password);
        return true;
      } on AuthException catch (e) {
        state = state.copyWith(error: _getErrorMessage(e));
        return false;
      } catch (e) {
        state = state.copyWith(error: 'unexpectedError');
        return false;
      }
    });
  }

  Future<bool> signUp(String email, String password) async {
    if (!_validateInputs(email, password)) {
      return false;
    }

    state = state.copyWith(clearError: true, clearSuccess: true);

    return _loadingNotifier.withLoading(() async {
      try {
        await _authRepository.signUp(email, password);
        state = state.copyWith(successMessage: 'accountCreatedSuccessfully');
        return true;
      } on AuthException catch (e) {
        state = state.copyWith(error: _getErrorMessage(e));
        return false;
      } catch (e) {
        state = state.copyWith(error: 'unexpectedError');
        return false;
      }
    });
  }

  Future<bool> signInWithGoogle() async {
    state = state.copyWith(clearError: true, clearSuccess: true);

    return _loadingNotifier.withLoading(() async {
      try {
        final success = await _authRepository.signInWithGoogle();
        return success;
      } on AuthException catch (e) {
        state = state.copyWith(error: _getGoogleErrorMessage(e));
        return false;
      } catch (e) {
        state = state.copyWith(error: 'googleSignInFailed');
        return false;
      }
    });
  }

  Future<bool> signInWithApple() async {
    state = state.copyWith(clearError: true, clearSuccess: true);

    return _loadingNotifier.withLoading(() async {
      try {
        final success = await _authRepository.signInWithApple();
        return success;
      } on AuthException catch (e) {
        state = state.copyWith(error: _getAppleErrorMessage(e));
        return false;
      } catch (e) {
        state = state.copyWith(error: 'appleSignInFailed');
        return false;
      }
    });
  }

  bool _validateInputs(String email, String password) {
    final emailValid = _validateEmail(email);
    final passwordValid = _validatePassword(password);

    state = state.copyWith(
      isEmailValid: emailValid,
      isPasswordValid: passwordValid,
    );

    return emailValid && passwordValid;
  }

  bool _validateEmail(String email) {
    return email.isNotEmpty &&
        RegExp(AppConstants.emailRegexPattern).hasMatch(email);
  }

  bool _validatePassword(String password) {
    return password.length >= AppConstants.passwordMinLength;
  }

  String _getErrorMessage(AuthException e) {
    switch (e.message) {
      case 'Invalid login credentials':
      case 'Email not confirmed':
        return 'invalidEmailOrPassword';
      case 'User already registered':
        return 'emailAlreadyExists';
      case 'Signup disabled':
        return 'signupDisabled';
      case 'Email rate limit exceeded':
        return 'emailRateLimit';
      case 'Password should be at least 6 characters':
        return 'passwordTooShort';
      case 'Unable to validate email address: invalid format':
        return 'invalidEmailFormat';
      case 'User not found':
        return 'userNotFound';
      default:
        return 'unexpectedError';
    }
  }

  String _getGoogleErrorMessage(AuthException e) {
    switch (e.message) {
      case 'User cancelled the operation':
      case 'The user canceled the sign-in flow':
        return 'authenticationCancelled';
      case 'Network error':
        return 'networkError';
      default:
        return 'googleSignInFailed';
    }
  }

  String _getAppleErrorMessage(AuthException e) {
    switch (e.message) {
      case 'User cancelled the operation':
      case 'The user canceled the sign-in flow':
        return 'authenticationCancelled';
      case 'Network error':
        return 'networkError';
      default:
        return 'appleSignInFailed';
    }
  }

  void clearError() {
    state = state.copyWith(clearError: true);
  }

  void clearSuccess() {
    state = state.copyWith(clearSuccess: true);
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(
    ref.watch(authRepositoryProvider),
    ref.read(globalLoadingStateProvider.notifier),
  );
});
