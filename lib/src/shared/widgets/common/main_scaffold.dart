import 'package:ai_coach_sportivo/src/core/config/l10n/app_localizations.dart';
import 'package:ai_coach_sportivo/src/core/constants/app_route_name.dart';
import 'package:ai_coach_sportivo/src/core/constants/app_icons.dart';
import 'package:ai_coach_sportivo/src/core/constants/app_dimensions.dart';
import 'package:ai_coach_sportivo/src/features/auth/data/auth_repository.dart';
import 'package:ai_coach_sportivo/src/features/profile/presentation/viewmodel/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MainScaffold extends ConsumerWidget {
  const MainScaffold({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: _buildAppBarTitle(context, l10n, ref),
        actions: _buildAppBarActions(context, l10n, ref),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: child,
      extendBody: true,
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: AppDimensions.paddingS),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Theme.of(context).dividerColor.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: _calculateSelectedIndex(context),
            onTap: (index) => _onItemTapped(index, context),
            enableFeedback: false,
            items: [
              BottomNavigationBarItem(
                icon: Icon(AppIcons.home),
                activeIcon: Icon(AppIcons.homeFilled),
                label: l10n.home,
              ),
              BottomNavigationBarItem(
                icon: Icon(AppIcons.plans),
                activeIcon: Icon(AppIcons.plansFilled),
                label: l10n.plans,
              ),
              BottomNavigationBarItem(
                icon: Icon(AppIcons.activities),
                activeIcon: Icon(AppIcons.activitiesFilled),
                label: l10n.activities,
              ),
              BottomNavigationBarItem(
                icon: Icon(AppIcons.profile),
                activeIcon: Icon(AppIcons.profileFilled),
                label: l10n.profile,
              ),
            ],
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: Theme.of(context).colorScheme.onSurface,
            unselectedItemColor: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBarTitle(
    BuildContext context,
    AppLocalizations l10n,
    WidgetRef ref,
  ) {
    final location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith(homeRoute)) {
      // Watch the profile state to get the user's name
      final profileState = ref.watch(profileProvider);
      String userName = '';

      if (profileState.profile != null) {
        // If profile exists, use the user's name
        userName = profileState.profile!.name;
      } else {
        // Fallback to email if profile is not loaded yet
        userName = ref.watch(authRepositoryProvider).currentUser?.email ?? '';
      }

      return Text(
        l10n.helloUser(userName),
        style: Theme.of(context).textTheme.titleLarge,
      );
    }
    if (location.startsWith(plansRoute)) return Text(l10n.plans);
    if (location.startsWith(activitiesRoute)) return Text(l10n.activities);
    if (location.startsWith(profileRoute)) return Text(l10n.profile);
    return Text(l10n.appTitle);
  }

  List<Widget> _buildAppBarActions(
    BuildContext context,
    AppLocalizations l10n,
    WidgetRef ref,
  ) {
    final location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith(homeRoute)) {
      return [
        IconButton(
          icon: const Icon(AppIcons.settings),
          tooltip: l10n.settings,
          onPressed: () {
            context.pushNamed(settingsRoute);
          },
        ),
      ];
    }
    return [];
  }

  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith(homeRoute)) return 0;
    if (location.startsWith(plansRoute)) return 1;
    if (location.startsWith(activitiesRoute)) return 2;
    if (location.startsWith(profileRoute)) return 3;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.goNamed(homeRoute);
        break;
      case 1:
        context.goNamed(plansRoute);
        break;
      case 2:
        context.goNamed(activitiesRoute);
        break;
      case 3:
        context.goNamed(profileRoute);
        break;
    }
  }
}
