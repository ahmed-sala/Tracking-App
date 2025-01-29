import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/domain/use_cases/order/start_order_use_case.dart';
import 'package:tracking_app/src/domain/use_cases/order/store_order_use_case.dart';
import 'package:tracking_app/src/presentation/managers/order/start_order/start_order_event.dart';

import '../../../../domain/entities/order/pending_order_entity.dart';

part 'start_order_state.dart';

@injectable
class StartOrderCubit extends Cubit<StartOrderState> {
  final StoreOrderUseCase _storeOrderUseCase;
  final StartOrderUseCase _startOrderUseCase;
  StartOrderCubit(this._startOrderUseCase, this._storeOrderUseCase)
      : super(StartOrderInitial());

  Future<void> doAction(StartOrderEvent startOrderEvent) async {
    switch (startOrderEvent) {
      case InitialStartOrderEvent():
        return await _storeOrder(
            pendingOrderEntity: startOrderEvent.pendingOrderEntity);
      case StartOrderButtonEvent():
        return await _startOrder(orderId: startOrderEvent.orderId);
    }
  }

  Future<void> _storeOrder(
      {required PendingOrderEntity pendingOrderEntity}) async {
    emit(StoreOrderLoadingState());
    var result =
        await _storeOrderUseCase.invoke(pendingOrderEntity: pendingOrderEntity);
    switch (result) {
      case Success<bool>():
        emit(StoreOrderSuccessState());
      case Failures<bool>():
        emit(StoreOrderErrorState(result.exception));
    }
  }

  Future<void> _startOrder({required String orderId}) async {
    emit(StartOrderLoadingState());
    var result = await _startOrderUseCase.invoke(orderId: orderId);
    switch (result) {
      case Success<bool>():
        emit(StartOrderSuccessState());
      case Failures<bool>():
        emit(StoreOrderErrorState(result.exception));
    }
  }
}
