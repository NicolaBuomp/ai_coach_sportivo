import 'package:ai_coach_sportivo/src/features/auth/data/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthState {
  const AuthState({
    this.isLoading = false,
    this.error,
    this.isEmailValid = true,
    this.isPasswordValid = true,
    this.successMessage,
  });

  final bool isLoading;
  final String? error;
  final bool isEmailValid;
  final bool isPasswordValid;
  final String? successMessage;

  AuthState copyWith({
    bool? isLoading,
    String? error,
    bool? isEmailValid,
    bool? isPasswordValid,
    String? successMessage,
    bool clearError = false,
    bool clearSuccess = false,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
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
  AuthNotifier(this._authRepository) : super(const AuthState());

  final AuthRepository _authRepository;

  Future<bool> signIn(String email, String password) async {
    if (!_validateInputs(email, password)) {
      return false;
    }

    state = state.copyWith(
      isLoading: true,
      clearError: true,
      clearSuccess: true,
    );

    try {
      await _authRepository.signIn(email, password);
      state = state.copyWith(isLoading: false);
      return true;
    } on AuthException catch (e) {
      state = state.copyWith(isLoading: false, error: _getErrorMessage(e));
      return false;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: 'unexpectedError');
      return false;
    }
  }

  Future<bool> signUp(String email, String password) async {
    if (!_validateInputs(email, password)) {
      return false;
    }

    state = state.copyWith(
      isLoading: true,
      clearError: true,
      clearSuccess: true,
    );

    try {
      await _authRepository.signUp(email, password);
      state = state.copyWith(
        isLoading: false,
        successMessage: 'accountCreatedSuccessfully',
      );
      return true;
    } on AuthException catch (e) {
      state = state.copyWith(isLoading: false, error: _getErrorMessage(e));
      return false;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: 'unexpectedError');
      return false;
    }
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
        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool _validatePassword(String password) {
    return password.length >= 6;
  }

  String _getErrorMessage(AuthException e) {
    switch (e.message) {
      case 'Invalid login credentials':
        return 'invalidEmailOrPassword';
      case 'Email not confirmed':
        return 'pleaseVerifyEmail';
      case 'User already registered':
        return 'emailAlreadyExists';
      default:
        return 'unexpectedError';
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
  return AuthNotifier(ref.watch(authRepositoryProvider));
});
