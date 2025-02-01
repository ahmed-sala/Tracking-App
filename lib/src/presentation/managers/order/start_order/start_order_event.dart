import 'package:tracking_app/src/domain/entities/order/pending_order_entity.dart';

sealed class StartOrderEvent {}
class InitialStartOrderEvent extends StartOrderEvent{
  final PendingOrderEntity pendingOrderEntity;
  InitialStartOrderEvent({required this.pendingOrderEntity});
}
class StartOrderButtonEvent extends StartOrderEvent{
  final String orderId;
  StartOrderButtonEvent({required this.orderId});
}