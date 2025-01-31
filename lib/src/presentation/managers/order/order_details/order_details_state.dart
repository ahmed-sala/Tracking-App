sealed class OrderDetailsState {
  const OrderDetailsState();
}

class OrderDetailsLoading extends OrderDetailsState {
  const OrderDetailsLoading();
}

class OrderDetailsInitial extends OrderDetailsState {
  const OrderDetailsInitial();
}

class OrderDetailsLoaded extends OrderDetailsState {
  // final PendingOrderEntity order;

  const OrderDetailsLoaded();
}

class OrderDetailsError extends OrderDetailsState {
  final String message;

  const OrderDetailsError(this.message);
}
