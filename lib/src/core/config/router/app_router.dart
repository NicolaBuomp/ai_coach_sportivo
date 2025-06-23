import 'dart:async';
import 'package:ai_coach_sportivo/src/core/config/router/route_name.dart';
import 'package:ai_coach_sportivo/src/features/auth/data/auth_repository.dart';
import 'package:ai_coach_sportivo/src/features/auth/presentation/views/login_screen.dart';
import 'package:ai_coach_sportivo/src/features/auth/presentation/views/signup_screen.dart';
import 'package:ai_coach_sportivo/src/features/home/presentation/views/home_screen.dart';
import 'package:ai_coach_sportivo/src/features/onboarding/data/onboarding_repository.dart';
import 'package:ai_coach_sportivo/src/features/onboarding/presentation/views/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  final onboardingRepository = ref.watch(onboardingRepositoryProvider);

  return GoRouter(
    initialLocation: onboardingRoute,
    debugLogDiagnostics: true,
    refreshListenable: GoRouterRefreshNotifier(authRepository.authStateChanges),
    redirect: (context, state) {
      final onboardingComplete = onboardingRepository.isOnboardingComplete();
      final onOnboardingPage = state.matchedLocation == onboardingRoute;

      // Se l'onboarding non è completo, reindirizza alla pagina di onboarding
      if (!onboardingComplete) {
        return onOnboardingPage ? null : onboardingRoute;
      }

      final isLoggedIn = authRepository.currentUser != null;
      final onLoginPage = state.matchedLocation == loginRoute;
      final onSignUpPage = state.matchedLocation == signUpRoute;

      // Se l'onboarding è completo e l'utente è sulla pagina di onboarding,
      // reindirizzalo al login.
      if (onOnboardingPage) {
        return loginRoute;
      }

      if (!isLoggedIn && !onLoginPage && !onSignUpPage) {
        return loginRoute;
      }

      if (isLoggedIn && (onLoginPage || onSignUpPage)) {
        return homeRoute;
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
        path: homeRoute,
        name: homeRoute,
        builder: (context, state) => const HomeScreen(),
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
