import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_coach_sportivo/src/shared/providers/loading_provider.dart';
import 'package:ai_coach_sportivo/src/shared/widgets/common/app_loading_overlay.dart';

/// Test widget per verificare il funzionamento del loading overlay
class LoadingTestApp extends StatelessWidget {
  const LoadingTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Loading Test',
        home: const LoadingTestScreen(),
        builder: (context, child) {
          return AppLoadingOverlay(child: child ?? const SizedBox.shrink());
        },
      ),
    );
  }
}

class LoadingTestScreen extends ConsumerWidget {
  const LoadingTestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Loading Test')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                LoadingService.show(ref, 'Test loading globale...');
              },
              child: const Text('Mostra Loading Globale'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                LoadingService.hide(ref);
              },
              child: const Text('Nascondi Loading'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await LoadingService.withLoading(ref, () async {
                  await Future.delayed(const Duration(seconds: 3));
                }, 'Operazione di test...');
              },
              child: const Text('Test Loading con Operazione'),
            ),
          ],
        ),
      ),
    );
  }
}
