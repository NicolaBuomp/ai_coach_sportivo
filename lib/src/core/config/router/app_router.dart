import 'dart:async';
import 'package:ai_coach_sportivo/src/core/constants/app_route_name.dart';
import 'package:ai_coach_sportivo/src/features/activities/presentation/views/activities_screen.dart';
import 'package:ai_coach_sportivo/src/features/auth/data/auth_repository.dart';
import 'package:ai_coach_sportivo/src/features/auth/presentation/views/login_screen.dart';
import 'package:ai_coach_sportivo/src/features/auth/presentation/views/signup_screen.dart';
import 'package:ai_coach_sportivo/src/features/auth/presentation/views/forgot_password_screen.dart';
import 'package:ai_coach_sportivo/src/features/auth/presentation/views/email_confirmation_screen.dart';
import 'package:ai_coach_sportivo/src/features/auth/presentation/views/reset_password_screen.dart';
import 'package:ai_coach_sportivo/src/features/calendar/presentation/views/calendar_screen.dart';
import 'package:ai_coach_sportivo/src/features/home/presentation/views/home_screen.dart';
import 'package:ai_coach_sportivo/src/features/onboarding/data/onboarding_repository.dart';
import 'package:ai_coach_sportivo/src/features/onboarding/presentation/views/onboarding_screen.dart';
import 'package:ai_coach_sportivo/src/features/plans/presentation/views/plans_screen.dart';
import 'package:ai_coach_sportivo/src/features/settings/presentation/views/settings_screen.dart';
import 'package:ai_coach_sportivo/src/features/training/presentation/views/training_screen.dart';
import 'package:ai_coach_sportivo/src/shared/widgets/common/main_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  final onboardingRepository = ref.watch(onboardingRepositoryProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    debugLogDiagnostics: true,
    refreshListenable: GoRouterRefreshNotifier(authRepository.authStateChanges),
    redirect: (context, state) async {
      final onboardingComplete = onboardingRepository.isOnboardingComplete();
      final onOnboardingPage = state.matchedLocation == onboardingRoute;

      // Se l'onboarding non è completo, reindirizza alla pagina di onboarding
      if (!onboardingComplete) {
        return onOnboardingPage ? null : onboardingRoute;
      }

      final user = authRepository.currentUser;
      final isLoggedIn = user != null && user.emailConfirmedAt != null;

      final onAuthPages = [
        loginRoute,
        signUpRoute,
        forgotPasswordRoute,
        emailConfirmationRoute,
      ].contains(state.matchedLocation);

      // Se l'onboarding è completo e l'utente è sulla pagina di onboarding,
      // reindirizzalo al login.
      if (onboardingComplete && onOnboardingPage) {
        return loginRoute;
      }

      // Se l'utente è loggato e cerca di accedere a pagine di autenticazione,
      // reindirizzalo alla home.
      if (isLoggedIn && onAuthPages) {
        return homeRoute;
      }

      // Se non è autenticato e non è su pagine di auth, vai al login
      if (!isLoggedIn && !onAuthPages) {
        return loginRoute;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: onboardingRoute,
        name: onboardingRoute,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: loginRoute,
        name: loginRoute,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: signUpRoute,
        name: signUpRoute,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: forgotPasswordRoute,
        name: forgotPasswordRoute,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: resetPasswordRoute,
        name: resetPasswordRoute,
        builder: (context, state) => const ResetPasswordScreen(),
      ),
      GoRoute(
        path: emailConfirmationRoute,
        name: emailConfirmationRoute,
        builder: (context, state) {
          final email = state.uri.queryParameters['email'] ?? '';
          return EmailConfirmationScreen(email: email);
        },
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return MainScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: homeRoute,
            name: homeRoute,
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: plansRoute,
            name: plansRoute,
            builder: (context, state) => const PlansScreen(),
          ),
          GoRoute(
            path: activitiesRoute,
            name: activitiesRoute,
            builder: (context, state) => const ActivitiesScreen(),
          ),
          GoRoute(
            path: trainingRoute,
            name: trainingRoute,
            builder: (context, state) => const TrainingScreen(),
          ),
          GoRoute(
            path: calendarRoute,
            name: calendarRoute,
            builder: (context, state) => const CalendarScreen(),
          ),
        ],
      ),
      // fuori dal MainScaffold
      GoRoute(
        path: settingsRoute,
        name: settingsRoute,
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
});

// Classe helper per convertire uno Stream in un Listenable per GoRouter
class GoRouterRefreshNotifier extends ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;

  GoRouterRefreshNotifier(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
