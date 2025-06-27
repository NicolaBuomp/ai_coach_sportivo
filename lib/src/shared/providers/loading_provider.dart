import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Stato del loading con messaggio opzionale
class LoadingState {
  const LoadingState({this.isLoading = false, this.message});

  final bool isLoading;
  final String? message;

  LoadingState copyWith({
    bool? isLoading,
    String? message,
    bool clearMessage = false,
  }) {
    return LoadingState(
      isLoading: isLoading ?? this.isLoading,
      message: clearMessage ? null : (message ?? this.message),
    );
  }
}

/// Provider globale per la gestione del loading con messaggi
class LoadingNotifier extends StateNotifier<LoadingState> {
  LoadingNotifier() : super(const LoadingState());

  /// Getter per compatibilità e convenienza
  bool get isLoading => state.isLoading;
  String? get currentMessage => state.message;

  /// Mostra il loading con messaggio opzionale
  void show([String? message]) {
    state = LoadingState(isLoading: true, message: message);
  }

  /// Nasconde il loading
  void hide() {
    state = const LoadingState();
  }

  /// Toggle dello stato di loading
  void toggle([String? message]) {
    if (state.isLoading) {
      hide();
    } else {
      show(message);
    }
  }

  /// Esegue un'operazione asincrona con loading automatico
  Future<T> withLoading<T>(
    Future<T> Function() operation, [
    String? message,
  ]) async {
    show(message);
    try {
      final result = await operation();
      return result;
    } finally {
      hide();
    }
  }
}

/// Provider per lo stato completo del loading (con messaggio)
final globalLoadingStateProvider =
    StateNotifierProvider<LoadingNotifier, LoadingState>((ref) {
      return LoadingNotifier();
    });

/// Provider per compatibilità che espone solo il bool
final globalLoadingProvider = Provider<bool>((ref) {
  return ref.watch(globalLoadingStateProvider).isLoading;
});

/// Utility class per gestire il loading da qualsiasi widget
class LoadingService {
  static void show(WidgetRef ref, [String? message]) {
    ref.read(globalLoadingStateProvider.notifier).show(message);
  }

  static void hide(WidgetRef ref) {
    ref.read(globalLoadingStateProvider.notifier).hide();
  }

  static bool isLoading(WidgetRef ref) {
    return ref.watch(globalLoadingProvider);
  }

  static Future<T> withLoading<T>(
    WidgetRef ref,
    Future<T> Function() operation, [
    String? message,
  ]) async {
    return ref
        .read(globalLoadingStateProvider.notifier)
        .withLoading(operation, message);
  }
}
