import 'dart:async';
import 'package:ai_coach_sportivo/src/app.dart';
import 'package:ai_coach_sportivo/src/core/config/router/route_name.dart';
import 'package:ai_coach_sportivo/src/features/auth/data/auth_repository.dart';
import 'package:ai_coach_sportivo/src/features/auth/presentation/views/login_screen.dart';
import 'package:ai_coach_sportivo/src/features/auth/presentation/views/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);

  return GoRouter(
    initialLocation: loginRoute,
    debugLogDiagnostics: true,
    // refreshListenable ascolta i cambiamenti e riesegue il redirect
    refreshListenable: GoRouterRefreshNotifier(authRepository.authStateChanges),
    redirect: (context, state) {
      final isLoggedIn = authRepository.currentUser != null;
      final onLoginPage = state.matchedLocation == loginRoute;
      final onSignUpPage = state.matchedLocation == signUpRoute;

      // Se l'utente non è loggato e non è sulle pagine di login/signup,
      // lo reindirizzo al login.
      if (!isLoggedIn && !onLoginPage && !onSignUpPage) {
        return loginRoute;
      }

      // Se l'utente è loggato e si trova sulle pagine di login/signup,
      // lo reindirizzo alla home.
      if (isLoggedIn && (onLoginPage || onSignUpPage)) {
        return homeRoute;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: homeRoute,
        name: homeRoute,
        builder: (context, state) => const HomePage(),
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
