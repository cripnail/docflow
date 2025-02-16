import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:docflow/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:docflow/features/onboarding/domain/models/onboarding_state.dart';

sealed class OnboardingEvent {
  const OnboardingEvent();
}

final class CompleteOnboarding extends OnboardingEvent {
  const CompleteOnboarding();
}

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final OnboardingRepository _repository;

  OnboardingBloc(this._repository) : super(OnboardingState.initial) {
    on<CompleteOnboarding>(_onCompleteOnboarding);
  }

  Future<void> _onCompleteOnboarding(
    CompleteOnboarding event,
    Emitter<OnboardingState> emit,
  ) async {
    await _repository.completeOnboarding();
    emit(OnboardingState.completed);
  }
}
