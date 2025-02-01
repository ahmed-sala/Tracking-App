import '../../../../domain/entities/order/pending_order_entity.dart';

sealed class OrderDetailsState {
  const OrderDetailsState();
}

class GetOrderDetailsLoading extends OrderDetailsState {
  const GetOrderDetailsLoading();
}

class OrderDetailsInitial extends OrderDetailsState {
  const OrderDetailsInitial();
}

class GetOrderDetailsLoaded extends OrderDetailsState {
  final PendingOrderEntity order;

  const GetOrderDetailsLoaded(this.order);
}

class GetOrderDetailsError extends OrderDetailsState {
  final String message;

  const GetOrderDetailsError(this.message);
}

class UpdateStateLoaded extends OrderDetailsState {
  const UpdateStateLoaded();
}

class UpdateStateError extends OrderDetailsState {
  final Exception exception;

  const UpdateStateError(
    this.exception,
  );
}

class UpdateStateLoading extends OrderDetailsState {
  const UpdateStateLoading();
}
