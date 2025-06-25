import 'package:flutter/material.dart';
import 'package:ai_coach_sportivo/src/core/config/l10n/app_localizations.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(body: Center(child: Text(l10n.yourActivities)));
  }
}
