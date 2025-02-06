part of 'success_order_cubit.dart';

@immutable
sealed class SuccessOrderState {}

final class SuccessOrderInitial extends SuccessOrderState {}
class RemoveOrderLoadingState extends SuccessOrderState{}
class RemoveOrderSuccessState extends SuccessOrderState{}
class RemoveOrderErrorState extends SuccessOrderState{
  final Exception exception;
  RemoveOrderErrorState({required this.exception});
}