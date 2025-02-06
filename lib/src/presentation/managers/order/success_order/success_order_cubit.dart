import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/domain/use_cases/order/remove_order_id_use_case.dart';
import 'package:tracking_app/src/presentation/managers/order/success_order/success_order_action.dart';

part 'success_order_state.dart';

@injectable
class SuccessOrderCubit extends Cubit<SuccessOrderState> {
  final RemoveOrderIdUseCase removeOrderIdUseCase;
  SuccessOrderCubit(this.removeOrderIdUseCase) : super(SuccessOrderInitial());

  Future<void> doAction(
      {required SuccessOrderAction successOrderAction}) async {
    switch (successOrderAction) {
      case RemoveOrderIdAction():
        return await _removeOrderId(orderId: successOrderAction.orderId);
    }
  }

  Future<void> _removeOrderId({required String orderId}) async {
    emit(RemoveOrderLoadingState());
    var result=await removeOrderIdUseCase.invoke(orderId: orderId);
    switch (result) {
      case Success<bool>():
        emit(RemoveOrderSuccessState());
      case Failures<bool>():
       emit(RemoveOrderErrorState(exception: result.exception));
    }
  }
}
