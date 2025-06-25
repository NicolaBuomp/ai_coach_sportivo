import 'package:ai_coach_sportivo/src/core/config/l10n/app_localizations.dart';
import 'package:ai_coach_sportivo/src/core/config/l10n/locale_provider.dart';
import 'package:ai_coach_sportivo/src/core/config/theme/theme_provider.dart';
import 'package:ai_coach_sportivo/src/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Widget riutilizzabile per i campi del form del profilo
class ProfileFormFields extends ConsumerWidget {
  const ProfileFormFields({
    super.key,
    required this.nameController,
    required this.surnameController,
    required this.heightController,
    required this.weightController,
    required this.dateOfBirth,
    required this.gender,
    required this.sportingLevel,
    required this.sportPreferences,
    required this.preferredUnitSystem,
    required this.onDateChanged,
    required this.onGenderChanged,
    required this.onSportingLevelChanged,
    required this.onSportPreferencesChanged,
    required this.onUnitSystemChanged,
    this.isCompleteProfileMode = false,
  });

  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController heightController;
  final TextEditingController weightController;
  final DateTime? dateOfBirth;
  final String? gender;
  final String? sportingLevel;
  final List<String> sportPreferences;
  final String preferredUnitSystem;
  final ValueChanged<DateTime?> onDateChanged;
  final ValueChanged<String?> onGenderChanged;
  final ValueChanged<String?> onSportingLevelChanged;
  final ValueChanged<List<String>> onSportPreferencesChanged;
  final ValueChanged<String> onUnitSystemChanged;
  final bool isCompleteProfileMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    // Watch the current theme and language from providers
    final currentTheme = ref.watch(themeNotifierProvider);
    final currentLocale = ref.watch(localeProvider);

    // Convert theme mode to string
    String currentThemeString;
    switch (currentTheme) {
      case ThemeMode.light:
        currentThemeString = 'light';
        break;
      case ThemeMode.dark:
        currentThemeString = 'dark';
        break;
      case ThemeMode.system:
        currentThemeString = 'system';
        break;
    }

    // Get current language
    final currentLanguage = currentLocale?.languageCode ?? 'en';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Informazioni personali
        _ProfileSectionTitle(title: l10n.personalInformation),
        const SizedBox(height: 16),

        _ProfileTextField(
          controller: nameController,
          label: l10n.name,
          isRequired: true,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return l10n.fieldRequired;
            }
            return null;
          },
        ),
        const SizedBox(height: 16),

        _ProfileTextField(
          controller: surnameController,
          label: l10n.surname,
          isRequired: true,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return l10n.fieldRequired;
            }
            return null;
          },
        ),
        const SizedBox(height: 16),

        _ProfileDateField(
          label: l10n.dateOfBirth,
          value: dateOfBirth,
          onChanged: onDateChanged,
          isRequired: isCompleteProfileMode,
        ),
        const SizedBox(height: 16),

        _ProfileDropdownField<String>(
          label: l10n.gender,
          value: gender,
          items: AppConstants.genderOptions.map((genderOption) {
            return DropdownMenuItem(
              value: genderOption,
              child: Text(_getGenderDisplayName(genderOption, l10n)),
            );
          }).toList(),
          onChanged: onGenderChanged,
          isRequired: isCompleteProfileMode,
        ),
        const SizedBox(height: 32),

        // Informazioni fisiche
        _ProfileSectionTitle(title: l10n.physicalInformation),
        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: _ProfileTextField(
                controller: heightController,
                label: l10n.heightCm,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                isRequired: isCompleteProfileMode,
                validator: (value) {
                  if (isCompleteProfileMode &&
                      (value == null || value.trim().isEmpty)) {
                    return l10n.fieldRequired;
                  }
                  if (value != null && value.isNotEmpty) {
                    final height = int.tryParse(value);
                    if (height == null ||
                        height < AppConstants.minHeight ||
                        height > AppConstants.maxHeight) {
                      return l10n.invalidHeight;
                    }
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _ProfileTextField(
                controller: weightController,
                label: l10n.weightKg,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                isRequired: isCompleteProfileMode,
                validator: (value) {
                  if (isCompleteProfileMode &&
                      (value == null || value.trim().isEmpty)) {
                    return l10n.fieldRequired;
                  }
                  if (value != null && value.isNotEmpty) {
                    final weight = double.tryParse(value);
                    if (weight == null ||
                        weight < AppConstants.minWeight ||
                        weight > AppConstants.maxWeight) {
                      return l10n.invalidWeight;
                    }
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),

        // Informazioni sportive
        _ProfileSectionTitle(title: l10n.sportingInformation),
        const SizedBox(height: 16),

        _ProfileDropdownField<String>(
          label: l10n.sportingLevel,
          value: sportingLevel,
          items: AppConstants.sportingLevels.map((level) {
            return DropdownMenuItem(
              value: level,
              child: Text(_getSportingLevelDisplayName(level, l10n)),
            );
          }).toList(),
          onChanged: onSportingLevelChanged,
          isRequired: isCompleteProfileMode,
        ),
        const SizedBox(height: 16),

        _ProfileSportPreferencesField(
          sportPreferences: sportPreferences,
          onChanged: onSportPreferencesChanged,
          isRequired: isCompleteProfileMode,
        ),
        const SizedBox(height: 32),

        // Preferenze
        _ProfileSectionTitle(title: l10n.preferences),
        const SizedBox(height: 16),

        _ProfileDropdownField<String>(
          label: l10n.unitSystem,
          value: preferredUnitSystem,
          items: AppConstants.unitSystems.map((system) {
            return DropdownMenuItem(
              value: system,
              child: Text(_getUnitSystemDisplayName(system, l10n)),
            );
          }).toList(),
          onChanged: (value) => onUnitSystemChanged(value!),
        ),
        const SizedBox(height: 16),

        _ProfileDropdownField<String>(
          label: l10n.uiTheme,
          value: currentThemeString,
          items: AppConstants.uiThemes.map((theme) {
            return DropdownMenuItem(
              value: theme,
              child: Text(_getThemeDisplayName(theme, l10n)),
            );
          }).toList(),
          onChanged: (value) async {
            if (value != null) {
              await ref
                  .read(themeNotifierProvider.notifier)
                  .setThemeFromString(value);
            }
          },
        ),
        const SizedBox(height: 16),

        _ProfileDropdownField<String>(
          label: l10n.preferredLanguage,
          value: currentLanguage,
          items: AppConstants.supportedLanguages.map((language) {
            return DropdownMenuItem(
              value: language,
              child: Text(_getLanguageDisplayName(language, l10n)),
            );
          }).toList(),
          onChanged: (value) async {
            if (value != null) {
              await ref.read(localeProvider.notifier).setLocale(Locale(value));
            }
          },
        ),
      ],
    );
  }

  String _getGenderDisplayName(String gender, AppLocalizations l10n) {
    switch (gender) {
      case 'male':
        return l10n.male;
      case 'female':
        return l10n.female;
      case 'other':
        return l10n.other;
      default:
        return gender;
    }
  }

  String _getSportingLevelDisplayName(String level, AppLocalizations l10n) {
    switch (level) {
      case 'beginner':
        return l10n.beginner;
      case 'intermediate':
        return l10n.intermediate;
      case 'advanced':
        return l10n.advanced;
      case 'semi_pro':
        return l10n.semiPro;
      default:
        return level;
    }
  }

  String _getUnitSystemDisplayName(String system, AppLocalizations l10n) {
    switch (system) {
      case 'metric':
        return l10n.metric;
      case 'imperial':
        return l10n.imperial;
      default:
        return system;
    }
  }

  String _getThemeDisplayName(String theme, AppLocalizations l10n) {
    switch (theme) {
      case 'system':
        return l10n.system;
      case 'light':
        return l10n.light;
      case 'dark':
        return l10n.dark;
      default:
        return theme;
    }
  }

  String _getLanguageDisplayName(String language, AppLocalizations l10n) {
    switch (language) {
      case 'it':
        return l10n.italian;
      case 'en':
        return l10n.english;
      default:
        return language;
    }
  }
}

/// Widget per il titolo delle sezioni
class _ProfileSectionTitle extends StatelessWidget {
  const _ProfileSectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(
        context,
      ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}

/// Widget per i campi di testo del profilo
class _ProfileTextField extends StatelessWidget {
  const _ProfileTextField({
    required this.controller,
    required this.label,
    this.isRequired = false,
    this.keyboardType,
    this.inputFormatters,
    this.validator,
  });

  final TextEditingController controller;
  final String label;
  final bool isRequired;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: isRequired ? '$label *' : label,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      validator: validator,
    );
  }
}

/// Widget per il campo data
class _ProfileDateField extends StatelessWidget {
  const _ProfileDateField({
    required this.label,
    required this.value,
    required this.onChanged,
    this.isRequired = false,
  });

  final String label;
  final DateTime? value;
  final ValueChanged<DateTime?> onChanged;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return InkWell(
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate:
              value ?? DateTime.now().subtract(const Duration(days: 365 * 25)),
          firstDate: DateTime.now().subtract(
            Duration(days: 365 * AppConstants.maxAge),
          ),
          lastDate: DateTime.now().subtract(
            Duration(days: 365 * AppConstants.minAge),
          ),
        );
        if (date != null) {
          onChanged(date);
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: isRequired ? '$label *' : label,
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          suffixIcon: const Icon(Icons.calendar_today),
          errorText: isRequired && value == null ? l10n.fieldRequired : null,
        ),
        child: Text(
          value != null
              ? '${value!.day}/${value!.month}/${value!.year}'
              : l10n.selectDate,
          style: TextStyle(
            color: value != null
                ? Theme.of(context).textTheme.bodyLarge?.color
                : Theme.of(context).hintColor,
          ),
        ),
      ),
    );
  }
}

/// Widget per le dropdown del profilo
class _ProfileDropdownField<T> extends StatelessWidget {
  const _ProfileDropdownField({
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    this.isRequired = false,
  });

  final String label;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return DropdownButtonFormField<T>(
      value: value,
      decoration: InputDecoration(
        labelText: isRequired ? '$label *' : label,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      items: items,
      onChanged: onChanged,
      validator: isRequired
          ? (value) {
              if (value == null) {
                return l10n.fieldRequired;
              }
              return null;
            }
          : null,
    );
  }
}

/// Widget per la selezione degli sport preferiti
class _ProfileSportPreferencesField extends StatefulWidget {
  const _ProfileSportPreferencesField({
    required this.sportPreferences,
    required this.onChanged,
    this.isRequired = false,
  });

  final List<String> sportPreferences;
  final ValueChanged<List<String>> onChanged;
  final bool isRequired;

  @override
  State<_ProfileSportPreferencesField> createState() =>
      _ProfileSportPreferencesFieldState();
}

class _ProfileSportPreferencesFieldState
    extends State<_ProfileSportPreferencesField> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.isRequired
              ? '${l10n.sportPreferences} *'
              : l10n.sportPreferences,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        if (widget.isRequired && widget.sportPreferences.isEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              l10n.fieldRequired,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontSize: 12,
              ),
            ),
          ),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: AppConstants.sportTypes.map((sport) {
            final isSelected = widget.sportPreferences.contains(sport);
            return FilterChip(
              label: Text(_getSportDisplayName(sport, l10n)),
              selected: isSelected,
              onSelected: (selected) {
                final newPreferences = List<String>.from(
                  widget.sportPreferences,
                );
                if (selected) {
                  newPreferences.add(sport);
                } else {
                  newPreferences.remove(sport);
                }
                widget.onChanged(newPreferences);
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  String _getSportDisplayName(String sport, AppLocalizations l10n) {
    switch (sport) {
      case 'running':
        return l10n.running;
      case 'cycling':
        return l10n.cycling;
      case 'swimming':
        return l10n.swimming;
      case 'weightlifting':
        return l10n.weightlifting;
      case 'football':
        return l10n.football;
      case 'basketball':
        return l10n.basketball;
      case 'tennis':
        return l10n.tennis;
      case 'volleyball':
        return l10n.volleyball;
      case 'yoga':
        return l10n.yoga;
      case 'pilates':
        return l10n.pilates;
      case 'boxing':
        return l10n.boxing;
      default:
        return sport;
    }
  }
}
