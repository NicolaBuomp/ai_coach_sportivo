import 'package:ai_coach_sportivo/src/app.dart';
import 'package:ai_coach_sportivo/src/core/config/router/route_name.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: homeRoute,
    debugLogDiagnostics: true, // Utile per il debug delle rotte
    routes: [
      GoRoute(
        path: homeRoute,
        name: homeRoute,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
});
