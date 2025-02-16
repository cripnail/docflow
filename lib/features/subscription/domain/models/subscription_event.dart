abstract class SubscriptionEvent {
  const SubscriptionEvent();
}

class CheckSubscriptionStatus extends SubscriptionEvent {
  const CheckSubscriptionStatus();
}

class PurchaseSubscription extends SubscriptionEvent {
  const PurchaseSubscription();
}

class RestoreSubscription extends SubscriptionEvent {
  const RestoreSubscription();
}
