import 'package:ai_coach_sportivo/src/core/config/l10n/app_localizations.dart';
import 'package:ai_coach_sportivo/src/core/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final currentThemeMode = ref.watch(themeModeProvider);

    // Funzione per cambiare tema
    void toggleTheme() {
      final newThemeMode = switch (currentThemeMode) {
        ThemeMode.system => ThemeMode.light,
        ThemeMode.light => ThemeMode.dark,
        ThemeMode.dark => ThemeMode.system,
      };
      ref.read(themeModeProvider.notifier).state = newThemeMode;
    }

    // Icona da mostrare in base al tema corrente
    final themeIcon = switch (currentThemeMode) {
      ThemeMode.system => Icons.brightness_auto_outlined,
      ThemeMode.light => Icons.light_mode_outlined,
      ThemeMode.dark => Icons.dark_mode_outlined,
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        actions: [
          IconButton(
            icon: Icon(themeIcon),
            onPressed: toggleTheme,
            tooltip: 'Change Theme',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(l10n.welcomeBack)],
        ),
      ),
    );
  }
}
