sealed class PendingOrderEvent {}
<<<<<<< HEAD
class GetAllPendingOrderEvent extends PendingOrderEvent {}
class RejectOrderEvent extends PendingOrderEvent {
  final String orderId;
  RejectOrderEvent(this.orderId);
}