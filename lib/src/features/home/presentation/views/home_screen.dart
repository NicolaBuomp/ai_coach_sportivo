import 'package:ai_coach_sportivo/src/core/config/l10n/app_localizations.dart';
import 'package:ai_coach_sportivo/src/core/config/l10n/locale_provider.dart';
import 'package:ai_coach_sportivo/src/core/config/theme/app_theme.dart';
import 'package:ai_coach_sportivo/src/features/auth/data/auth_repository.dart';
import 'package:ai_coach_sportivo/src/core/config/router/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final currentThemeMode = ref.watch(themeModeProvider);
    final currentLocale = ref.watch(localeProvider);
    final authRepository = ref.watch(authRepositoryProvider);

    // Funzione per cambiare tema
    void toggleTheme() {
      final newThemeMode = switch (currentThemeMode) {
        ThemeMode.system => ThemeMode.light,
        ThemeMode.light => ThemeMode.dark,
        ThemeMode.dark => ThemeMode.system,
      };
      ref.read(themeModeProvider.notifier).state = newThemeMode;
    }

    // Funzione per cambiare lingua
    void toggleLanguage() {
      ref.read(localeProvider.notifier).toggleLocale();
    }

    // Funzione per logout
    Future<void> handleLogout() async {
      await authRepository.signOut();
      if (context.mounted) {
        context.goNamed(loginRoute);
      }
    }

    // Icona da mostrare in base al tema corrente
    final themeIcon = switch (currentThemeMode) {
      ThemeMode.system => Icons.brightness_auto_outlined,
      ThemeMode.light => Icons.light_mode_outlined,
      ThemeMode.dark => Icons.dark_mode_outlined,
    };

    // Testo da mostrare per la lingua corrente
    final languageText =
        currentLocale?.languageCode.toUpperCase() ??
        Localizations.localeOf(context).languageCode.toUpperCase();

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        actions: [
          // Toggle Theme
          IconButton(
            icon: Icon(themeIcon),
            onPressed: toggleTheme,
            tooltip: 'Change Theme',
          ),
          // Toggle Language
          IconButton(
            onPressed: toggleLanguage,
            icon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.language_outlined),
                const SizedBox(width: 4),
                Text(
                  languageText,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            tooltip: 'Change Language',
          ),
          // Logout
          IconButton(
            onPressed: handleLogout,
            icon: const Icon(Icons.logout_outlined),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Section
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.smart_toy_outlined,
                          size: 32,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l10n.welcomeBack,
                                style: Theme.of(context).textTheme.headlineSmall
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                l10n.aiCoachReady,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Quick Actions
            Text(
              'Quick Actions',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            // Action Cards
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _ActionCard(
                    icon: Icons.fitness_center_outlined,
                    title: 'Start Workout',
                    subtitle: 'Begin your training',
                    onTap: () {
                      // TODO: Navigate to workout
                    },
                  ),
                  _ActionCard(
                    icon: Icons.analytics_outlined,
                    title: 'View Progress',
                    subtitle: 'Track your stats',
                    onTap: () {
                      // TODO: Navigate to analytics
                    },
                  ),
                  _ActionCard(
                    icon: Icons.calendar_today_outlined,
                    title: 'Schedule',
                    subtitle: 'Plan your week',
                    onTap: () {
                      // TODO: Navigate to schedule
                    },
                  ),
                  _ActionCard(
                    icon: Icons.settings_outlined,
                    title: 'Settings',
                    subtitle: 'Customize app',
                    onTap: () {
                      // TODO: Navigate to settings
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  const _ActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 32,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
