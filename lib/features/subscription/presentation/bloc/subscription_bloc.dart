import 'package:bloc/bloc.dart';
import 'package:docflow/core/constants/strings.dart';
import 'package:docflow/core/services/revenue_cat_service.dart';
import 'package:docflow/features/subscription/domain/models/subscription_event.dart';
import 'package:docflow/features/subscription/domain/models/subscription_state.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  final RevenueCatService _revenueCatService;

  SubscriptionBloc(this._revenueCatService)
      : super(const SubscriptionInitial()) {
    on<CheckSubscriptionStatus>(_onCheckStatus);
    on<PurchaseSubscription>(_onPurchase);
    on<RestoreSubscription>(_onRestore);
  }

  Future<void> _onCheckStatus(
    CheckSubscriptionStatus event,
    Emitter<SubscriptionState> emit,
  ) async {
    emit(const SubscriptionLoading());
    try {
      final isPremium = await _revenueCatService.isPremium();
      emit(isPremium
          ? const SubscriptionActive()
          : const SubscriptionInactive());
    } catch (e) {
      emit(SubscriptionError(e.toString()));
    }
  }

  Future<void> _onPurchase(
    PurchaseSubscription event,
    Emitter<SubscriptionState> emit,
  ) async {
    emit(const SubscriptionLoading());
    try {
      final success = await _revenueCatService.purchase();
      emit(success ? const SubscriptionActive() : const SubscriptionInactive());
    } catch (e) {
      emit(SubscriptionError(e.toString()));
    }
  }

  Future<void> _onRestore(
    RestoreSubscription event,
    Emitter<SubscriptionState> emit,
  ) async {
    emit(const SubscriptionLoading());
    try {
      final restored = await _revenueCatService.restore();
      if (restored) {
        emit(const SubscriptionActive(isRestore: true));
      } else {
        // Если восстановление не удалось, показываем сообщение
        emit(const SubscriptionError(AppStrings.noActiveSubscription));
      }
    } catch (e) {
      emit(SubscriptionError(e.toString()));
    }
  }
}
