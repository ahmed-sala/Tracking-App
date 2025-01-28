sealed class OrderState {
  const OrderState();
}

class OrderLoading extends OrderState {
  const OrderLoading();
}

class OrderLoaded extends OrderState {
  const OrderLoaded();
}

class OrderError extends OrderState {
  final String message;

  const OrderError(this.message);
}

class OrderInitial extends OrderState {
  const OrderInitial();
}
