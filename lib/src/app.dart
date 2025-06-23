import 'package:ai_coach_sportivo/src/core/config/router/app_router.dart';
import 'package:ai_coach_sportivo/src/core/config/l10n/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ai_coach_sportivo/src/core/config/theme/app_theme.dart';
import 'package:ai_coach_sportivo/src/core/config/l10n/app_localizations.dart';

final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final router = ref.watch(routerProvider);
    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // Configurazione del router
      routerConfig: router,

      // Generazione del titolo dell'applicazione
      // Utilizza AppLocalizations per supportare la localizzazione dinamica
      // in base alla lingua corrente dell'utente.
      title: 'AI Coach Sportivo',
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,

      // Configurazione della localizzazione
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale, // Usa il locale dal provider
      // Configurazione del tema
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
    );
  }
}
