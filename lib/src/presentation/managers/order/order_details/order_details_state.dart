import '../../../../domain/entities/order/pending_order_entity.dart';

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
  final PendingOrderEntity order;

  const OrderDetailsLoaded(this.order);
}

class OrderDetailsError extends OrderDetailsState {
  final String message;

  const OrderDetailsError(this.message);
}

class StateUpdated extends OrderDetailsState {
  final PendingOrderEntity order;

  const StateUpdated(this.order);
}
