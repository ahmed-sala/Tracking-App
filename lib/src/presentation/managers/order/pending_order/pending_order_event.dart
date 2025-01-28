sealed class PendingOrderEvent {}
class GetAllPendingOrderEvent extends PendingOrderEvent {}
class RejectOrderEvent extends PendingOrderEvent {
  final String orderId;
  RejectOrderEvent(this.orderId);
}