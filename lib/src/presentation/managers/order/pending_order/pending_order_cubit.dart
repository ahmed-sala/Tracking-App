import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/src/presentation/managers/order/pending_order/pending_order_event.dart';

import '../../../../../core/common/apis/api_result.dart';
import '../../../../domain/entities/order/pending_order_entity.dart';
import '../../../../domain/use_cases/order/get_all_pending_order_use_case.dart';

part 'pending_order_state.dart';

@injectable
class PendingOrderCubit extends Cubit<PendingOrderState> {
  final GetAllPendingOrderUseCase _getAllPendingOrderUseCase;
  PendingOrderCubit(this._getAllPendingOrderUseCase)
      : super(PendingOrderInitial());
  List<PendingOrderEntity> _pendingOrder = [];
  List<PendingOrderEntity> get pendingOrder => _pendingOrder;

  Future<void> doAction(PendingOrderEvent pendingOrderEvent) async {
    switch (pendingOrderEvent) {
      case GetAllPendingOrderEvent():
        return await _getAllPendingOrder();
      case RejectOrderEvent():
        return _rejectOrder(pendingOrderEvent.orderId);
    }
  }

  Future<void> _getAllPendingOrder() async {
    emit(GetAllPendingOrderLoadingState());
    final result = await _getAllPendingOrderUseCase.invoke();
    switch (result) {
      case Success<List<PendingOrderEntity>>():
        _pendingOrder = result.data ?? [];
        emit(GetAllPendingOrderSuccessState());
      case Failures<List<PendingOrderEntity>>():
        emit(GetAllPendingOrderErrorState(exception: result.exception));
    }
  }

  void _rejectOrder(String orderId) {
    _pendingOrder.removeWhere((element) => element.id == orderId);
    emit(RejectOrderSuccessState());
  }
}
