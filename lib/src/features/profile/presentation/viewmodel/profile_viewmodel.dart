import 'package:ai_coach_sportivo/src/features/profile/data/models/user_profile.dart';
import 'package:ai_coach_sportivo/src/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Stato per la gestione del profilo utente
class ProfileState {
  const ProfileState({
    this.profile,
    this.isLoading = false,
    this.error,
    this.isComplete = false,
  });

  final UserProfile? profile;
  final bool isLoading;
  final String? error;
  final bool isComplete;

  ProfileState copyWith({
    UserProfile? profile,
    bool? isLoading,
    String? error,
    bool? isComplete,
    bool clearError = false,
  }) {
    return ProfileState(
      profile: profile ?? this.profile,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
      isComplete: isComplete ?? this.isComplete,
    );
  }
}

/// Notifier per la gestione del profilo utente
class ProfileNotifier extends StateNotifier<ProfileState> {
  ProfileNotifier(this._profileRepository) : super(const ProfileState());

  final ProfileRepository _profileRepository;

  /// Carica il profilo dell'utente corrente
  Future<void> loadProfile() async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final profile = await _profileRepository.getCurrentUserProfile();
      state = state.copyWith(
        profile: profile,
        isLoading: false,
        isComplete: profile?.isComplete ?? false,
      );
    } on ProfileException catch (e) {
      state = state.copyWith(isLoading: false, error: e.message);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: 'unexpectedError');
    }
  }

  /// Salva/aggiorna il profilo utente
  Future<bool> saveProfile(Map<String, dynamic> profileData) async {
    if (state.isLoading) return false;

    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final profile = await _profileRepository.upsertProfile(profileData);
      state = state.copyWith(
        profile: profile,
        isLoading: false,
        isComplete: profile.isComplete,
      );
      return true;
    } on ProfileException catch (e) {
      state = state.copyWith(isLoading: false, error: e.message);
      return false;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: 'unexpectedError');
      return false;
    }
  }

  /// Aggiorna solo specifici campi del profilo
  Future<bool> updateProfileFields(Map<String, dynamic> fields) async {
    if (state.isLoading) return false;

    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final profile = await _profileRepository.updateProfileFields(fields);
      state = state.copyWith(
        profile: profile,
        isLoading: false,
        isComplete: profile.isComplete,
      );
      return true;
    } on ProfileException catch (e) {
      state = state.copyWith(isLoading: false, error: e.message);
      return false;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: 'unexpectedError');
      return false;
    }
  }

  /// Verifica se il profilo è completo
  Future<bool> checkProfileCompletion() async {
    try {
      final isComplete = await _profileRepository.isProfileComplete();
      state = state.copyWith(isComplete: isComplete);
      return isComplete;
    } catch (e) {
      return false;
    }
  }

  /// Elimina il profilo
  Future<bool> deleteProfile() async {
    if (state.isLoading) return false;

    state = state.copyWith(isLoading: true, clearError: true);

    try {
      await _profileRepository.deleteProfile();
      state = const ProfileState();
      return true;
    } on ProfileException catch (e) {
      state = state.copyWith(isLoading: false, error: e.message);
      return false;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: 'unexpectedError');
      return false;
    }
  }

  /// Pulisce l'errore
  void clearError() {
    state = state.copyWith(clearError: true);
  }

  /// Reset dello stato
  void reset() {
    state = const ProfileState();
  }
}

/// Provider per il ProfileNotifier
final profileProvider = StateNotifierProvider<ProfileNotifier, ProfileState>((
  ref,
) {
  return ProfileNotifier(ref.watch(profileRepositoryProvider));
});

/// Provider per verificare se il profilo è completo
final isProfileCompleteProvider = FutureProvider<bool>((ref) async {
  final profileNotifier = ref.read(profileProvider.notifier);
  return await profileNotifier.checkProfileCompletion();
});
