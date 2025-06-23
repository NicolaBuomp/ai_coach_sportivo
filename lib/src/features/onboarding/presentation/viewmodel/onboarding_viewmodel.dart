import 'package:ai_coach_sportivo/src/features/onboarding/data/onboarding_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingState {
  const OnboardingState({
    required this.currentPage,
    required this.pageController,
  });

  final int currentPage;
  final PageController pageController;

  OnboardingState copyWith({int? currentPage, PageController? pageController}) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      pageController: pageController ?? this.pageController,
    );
  }
}

class OnboardingNotifier extends StateNotifier<OnboardingState> {
  OnboardingNotifier(this._onboardingRepository)
    : super(OnboardingState(currentPage: 0, pageController: PageController()));

  final OnboardingRepository _onboardingRepository;

  void onPageChanged(int index) {
    state = state.copyWith(currentPage: index);
  }

  Future<void> goToNextPage() async {
    await state.pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  Future<void> completeOnboarding() async {
    await _onboardingRepository.setOnboardingComplete();
  }

  bool get isLastPage => state.currentPage == 2;

  @override
  void dispose() {
    state.pageController.dispose();
    super.dispose();
  }
}

final onboardingProvider =
    StateNotifierProvider<OnboardingNotifier, OnboardingState>((ref) {
      return OnboardingNotifier(ref.watch(onboardingRepositoryProvider));
    });
