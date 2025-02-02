part of 'start_order_cubit.dart';

@immutable
sealed class StartOrderState {}

final class StartOrderInitial extends StartOrderState {}
class StoreOrderLoadingState extends StartOrderState {}
class StoreOrderSuccessState extends StartOrderState {}
class StoreOrderErrorState extends StartOrderState {
  final Exception exception;
  StoreOrderErrorState(this.exception);
}

class StartOrderLoadingState extends StartOrderState {}
class StartOrderSuccessState extends StartOrderState {}
class StartOrderErrorState extends StartOrderState {
  final Exception exception;
  StartOrderErrorState(this.exception);
}
