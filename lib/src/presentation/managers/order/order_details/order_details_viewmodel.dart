import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/src/domain/use_cases/order/order_details_usecase.dart';
import 'package:tracking_app/src/presentation/managers/order/order_details/order_details_state.dart';

@injectable
class OrderDetailsViewmodel extends Cubit<OrderDetailsState> {
  OrderDetailsUsecase _orderDetailsUsecase;
  OrderDetailsViewmodel(this._orderDetailsUsecase)
      : super(OrderDetailsInitial());

  void getOrderDetails() async {
    try {
      _orderDetailsUsecase.storeOrder();

      emit(OrderDetailsLoaded());
    } catch (e) {
      emit(OrderDetailsError(e.toString()));
    }
  }
}
