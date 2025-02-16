abstract class SubscriptionState {
  const SubscriptionState();
}

class SubscriptionInitial extends SubscriptionState {
  const SubscriptionInitial();
}

class SubscriptionLoading extends SubscriptionState {
  const SubscriptionLoading();
}

class SubscriptionActive extends SubscriptionState {
  final bool isRestore;
  const SubscriptionActive({this.isRestore = false});
}
class SubscriptionInactive extends SubscriptionState {
  const SubscriptionInactive();
}

class SubscriptionError extends SubscriptionState {
  final String message;

  const SubscriptionError(this.message);
}
