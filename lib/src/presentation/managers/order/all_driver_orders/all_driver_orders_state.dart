part of 'all_driver_orders_viewmodel.dart';

@immutable
sealed class AllDriverOrdersState {}

final class AllDriverOrdersInitial extends AllDriverOrdersState {}

final class AllDriverOrdersLoading extends AllDriverOrdersState {}

final class AllDriverOrdersLoaded extends AllDriverOrdersState {
  final AllDriverOrdersEntity? orders;

  AllDriverOrdersLoaded(this.orders);
}

final class AllDriverOrdersError extends AllDriverOrdersState {
  final Exception exception;

  AllDriverOrdersError(this.exception);
}
