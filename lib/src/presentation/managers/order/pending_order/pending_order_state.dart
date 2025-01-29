part of 'pending_order_cubit.dart';

<<<<<<< HEAD
=======
@immutable
>>>>>>> origin/feature_pending_order
sealed class PendingOrderState {}

final class PendingOrderInitial extends PendingOrderState {}
class GetAllPendingOrderLoadingState extends PendingOrderState {}
class GetAllPendingOrderSuccessState extends PendingOrderState {}
class GetAllPendingOrderErrorState extends PendingOrderState {
  final Exception exception;
  GetAllPendingOrderErrorState({required this.exception});
}

class RejectOrderSuccessState extends PendingOrderState {}