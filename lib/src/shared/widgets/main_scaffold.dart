import 'package:ai_coach_sportivo/src/core/config/l10n/app_localizations.dart';
import 'package:ai_coach_sportivo/src/core/config/l10n/locale_provider.dart';
import 'package:ai_coach_sportivo/src/core/config/router/route_name.dart';
import 'package:ai_coach_sportivo/src/core/config/theme/app_theme.dart';
import 'package:ai_coach_sportivo/src/features/auth/data/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MainScaffold extends ConsumerWidget {
  const MainScaffold({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final currentThemeMode = ref.watch(themeModeProvider);
    final currentLocale = ref.watch(localeProvider);
    final authRepository = ref.watch(authRepositoryProvider);

    void toggleTheme() {
      final newThemeMode = switch (currentThemeMode) {
        ThemeMode.system => ThemeMode.light,
        ThemeMode.light => ThemeMode.dark,
        ThemeMode.dark => ThemeMode.system,
      };
      ref.read(themeModeProvider.notifier).state = newThemeMode;
    }

    void toggleLanguage() {
      ref.read(localeProvider.notifier).toggleLocale();
    }

    Future<void> handleLogout() async {
      await authRepository.signOut();
    }

    final themeIcon = switch (currentThemeMode) {
      ThemeMode.system => Icons.brightness_auto_outlined,
      ThemeMode.light => Icons.light_mode_outlined,
      ThemeMode.dark => Icons.dark_mode_outlined,
    };

    final languageText =
        currentLocale?.languageCode.toUpperCase() ??
        Localizations.localeOf(context).languageCode.toUpperCase();

    return Scaffold(
      appBar: AppBar(
        title: Text(_getAppBarTitle(context, l10n)),
        actions: [
          IconButton(
            icon: Icon(themeIcon),
            onPressed: toggleTheme,
            tooltip: l10n.changeTheme,
          ),
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
            tooltip: l10n.changeLanguage,
          ),
          IconButton(
            onPressed: handleLogout,
            icon: const Icon(Icons.logout_outlined),
            tooltip: l10n.logout,
          ),
        ],
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context),
        onTap: (index) => _onItemTapped(index, context),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            activeIcon: const Icon(Icons.home),
            label: l10n.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.fitness_center_outlined),
            activeIcon: const Icon(Icons.fitness_center),
            label: l10n.training,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.calendar_today_outlined),
            activeIcon: const Icon(Icons.calendar_today),
            label: l10n.calendar,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            activeIcon: const Icon(Icons.person),
            label: l10n.profile,
          ),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith(homeRoute)) return 0;
    if (location.startsWith(trainingRoute)) return 1;
    if (location.startsWith(calendarRoute)) return 2;
    if (location.startsWith(profileRoute)) return 3;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.goNamed(homeRoute);
        break;
      case 1:
        context.goNamed(trainingRoute);
        break;
      case 2:
        context.goNamed(calendarRoute);
        break;
      case 3:
        context.goNamed(profileRoute);
        break;
    }
  }

  String _getAppBarTitle(BuildContext context, AppLocalizations l10n) {
    final location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith(homeRoute)) return l10n.appTitle;
    if (location.startsWith(trainingRoute)) return l10n.training;
    if (location.startsWith(calendarRoute)) return l10n.calendar;
    if (location.startsWith(profileRoute)) return l10n.profile;
    return l10n.appTitle;
  }
}
