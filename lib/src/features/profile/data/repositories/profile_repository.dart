import 'package:ai_coach_sportivo/src/features/profile/data/models/user_profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRepository {
  ProfileRepository(this._client);

  final SupabaseClient _client;

  /// Ottiene il profilo dell'utente corrente
  Future<UserProfile?> getCurrentUserProfile() async {
    final user = _client.auth.currentUser;
    if (user == null) return null;

    try {
      final response = await _client
          .from('users')
          .select()
          .eq('id', user.id)
          .maybeSingle();

      if (response == null) return null;

      return UserProfile.fromJson(response);
    } catch (e) {
      throw ProfileException('Failed to load profile: ${e.toString()}');
    }
  }

  /// Crea o aggiorna il profilo utente
  Future<UserProfile> upsertProfile(Map<String, dynamic> profileData) async {
    final user = _client.auth.currentUser;
    if (user == null) {
      throw ProfileException('User not authenticated');
    }

    try {
      // Aggiungiamo automaticamente id e email dell'utente autenticato
      final dataWithUser = {...profileData, 'id': user.id, 'email': user.email};

      final response = await _client
          .from('users')
          .upsert(dataWithUser)
          .select()
          .single();

      return UserProfile.fromJson(response);
    } catch (e) {
      throw ProfileException('Failed to save profile: ${e.toString()}');
    }
  }

  /// Verifica se l'utente ha completato il profilo
  Future<bool> isProfileComplete() async {
    try {
      final profile = await getCurrentUserProfile();
      return profile?.isComplete ?? false;
    } catch (e) {
      return false;
    }
  }

  /// Elimina il profilo utente (soft delete o completo)
  Future<void> deleteProfile() async {
    final user = _client.auth.currentUser;
    if (user == null) {
      throw ProfileException('User not authenticated');
    }

    try {
      await _client.from('users').delete().eq('id', user.id);
    } catch (e) {
      throw ProfileException('Failed to delete profile: ${e.toString()}');
    }
  }

  /// Aggiorna solo specifici campi del profilo
  Future<UserProfile> updateProfileFields(Map<String, dynamic> fields) async {
    final user = _client.auth.currentUser;
    if (user == null) {
      throw ProfileException('User not authenticated');
    }

    try {
      final response = await _client
          .from('users')
          .update(fields)
          .eq('id', user.id)
          .select()
          .single();

      return UserProfile.fromJson(response);
    } catch (e) {
      throw ProfileException('Failed to update profile: ${e.toString()}');
    }
  }
}

/// Eccezione personalizzata per errori del profilo
class ProfileException implements Exception {
  const ProfileException(this.message);

  final String message;

  @override
  String toString() => 'ProfileException: $message';
}

/// Provider per il repository del profilo
final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepository(Supabase.instance.client);
});
