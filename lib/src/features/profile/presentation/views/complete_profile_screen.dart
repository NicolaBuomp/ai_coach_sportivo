import 'package:ai_coach_sportivo/src/core/config/l10n/app_localizations.dart';
import 'package:ai_coach_sportivo/src/core/config/l10n/locale_provider.dart';
import 'package:ai_coach_sportivo/src/core/constants/app_route_name.dart';
import 'package:ai_coach_sportivo/src/core/config/theme/theme_provider.dart';
import 'package:ai_coach_sportivo/src/features/auth/data/auth_repository.dart';
import 'package:ai_coach_sportivo/src/features/profile/data/models/user_profile.dart';
import 'package:ai_coach_sportivo/src/features/profile/presentation/viewmodel/profile_viewmodel.dart';
import 'package:ai_coach_sportivo/src/features/profile/presentation/widgets/profile_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Screen per il completamento obbligatorio del profilo
class CompleteProfileScreen extends ConsumerStatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  ConsumerState<CompleteProfileScreen> createState() =>
      _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends ConsumerState<CompleteProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();

  // Controllers per i campi del form
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  // Variabili per i campi non testuali
  DateTime? _dateOfBirth;
  String? _gender;
  String? _sportingLevel;
  List<String> _sportPreferences = [];
  String _preferredUnitSystem = 'metric';

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadExistingProfile();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _loadExistingProfile() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileProvider.notifier).loadProfile();
    });
  }

  void _populateFields(UserProfile profile) {
    _nameController.text = profile.name;
    _surnameController.text = profile.surname ?? '';
    _heightController.text = profile.heightCm?.toString() ?? '';
    _weightController.text = profile.weightKg?.toString() ?? '';

    setState(() {
      _dateOfBirth = profile.dateOfBirth;
      _gender = profile.gender;
      _sportingLevel = profile.sportingLevel;
      _sportPreferences = List.from(profile.sportPreferences);
      _preferredUnitSystem = profile.preferredUnitSystem;
    });

    // Set theme and language in providers if they exist in the profile
    if (profile.uiTheme.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref
            .read(themeNotifierProvider.notifier)
            .setThemeFromString(profile.uiTheme);
      });
    }

    if (profile.preferredLanguage.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref
            .read(localeProvider.notifier)
            .setLocale(Locale(profile.preferredLanguage));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Ascolta lo stato del profilo
    ref.listen<ProfileState>(profileProvider, (previous, next) {
      if (previous?.profile != next.profile && next.profile != null) {
        _populateFields(next.profile!);
      }

      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.profileSaveError(next.error!)),
            backgroundColor: Colors.red,
          ),
        );
      }
    });

    final profileState = ref.watch(profileProvider);
    final isLoading = profileState.isLoading || _isLoading;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.completeProfile),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: null,
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () async {
              // Logout e torna al login
              await ref.read(authRepositoryProvider).signOut();
              if (context.mounted) {
                context.go(loginRoute);
              }
            },
            child: Text(
              l10n.logout,
              style: TextStyle(color: colorScheme.error),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Header informativo
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.person_add,
                  size: 48,
                  color: colorScheme.onPrimaryContainer,
                ),
                const SizedBox(height: 12),
                Text(
                  l10n.profileIncomplete,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Completa le informazioni necessarie per utilizzare l\'app.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onPrimaryContainer,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          // Form
          Expanded(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                controller: _scrollController,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Use the reusable ProfileFormFields widget
                    ProfileFormFields(
                      nameController: _nameController,
                      surnameController: _surnameController,
                      heightController: _heightController,
                      weightController: _weightController,
                      dateOfBirth: _dateOfBirth,
                      gender: _gender,
                      sportingLevel: _sportingLevel,
                      sportPreferences: _sportPreferences,
                      preferredUnitSystem: _preferredUnitSystem,
                      onDateChanged: (date) =>
                          setState(() => _dateOfBirth = date),
                      onGenderChanged: (value) =>
                          setState(() => _gender = value),
                      onSportingLevelChanged: (value) =>
                          setState(() => _sportingLevel = value),
                      onSportPreferencesChanged: (preferences) =>
                          setState(() => _sportPreferences = preferences),
                      onUnitSystemChanged: (value) =>
                          setState(() => _preferredUnitSystem = value),
                      isCompleteProfileMode: true,
                    ),
                    const SizedBox(height: 48),

                    // Pulsante di salvataggio
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: isLoading ? null : _saveProfile,
                        child: isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(l10n.completeProfile),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) {
      // Scroll al primo errore
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      return;
    }

    // Verifica che almeno uno sport sia selezionato
    if (_sportPreferences.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Seleziona almeno uno sport'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final l10n = AppLocalizations.of(context)!;

    setState(() => _isLoading = true);

    try {
      // Get current theme and language from providers
      final currentTheme = ref.read(themeNotifierProvider);
      final currentLocale = ref.read(localeProvider);

      String themeString;
      switch (currentTheme) {
        case ThemeMode.light:
          themeString = 'light';
          break;
        case ThemeMode.dark:
          themeString = 'dark';
          break;
        case ThemeMode.system:
          themeString = 'system';
          break;
      }

      final profileData = {
        'name': _nameController.text.trim(),
        'surname': _surnameController.text.trim().isEmpty
            ? null
            : _surnameController.text.trim(),
        'height_cm': int.parse(_heightController.text),
        'weight_kg': double.parse(_weightController.text),
        'date_of_birth': _dateOfBirth!.toIso8601String().split('T')[0],
        'gender': _gender!,
        'sporting_level': _sportingLevel!,
        'sport_preferences': _sportPreferences,
        'preferred_unit_system': _preferredUnitSystem,
        'ui_theme': themeString,
        'preferred_language': currentLocale?.languageCode ?? 'en',
      };

      final success = await ref
          .read(profileProvider.notifier)
          .saveProfile(profileData);

      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.profileSavedSuccessfully),
            backgroundColor: Colors.green,
          ),
        );
        // Reindirizza alla home
        context.go(homeRoute);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.profileSaveError(e.toString())),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }
}
