part of 'pending_order_cubit.dart';

@immutable
sealed class PendingOrderState {}

final class PendingOrderInitial extends PendingOrderState {}
class GetAllPendingOrderLoadingState extends PendingOrderState {}
class GetAllPendingOrderSuccessState extends PendingOrderState {}
class GetAllPendingOrderErrorState extends PendingOrderState {
  final Exception exception;
  GetAllPendingOrderErrorState({required this.exception});
}