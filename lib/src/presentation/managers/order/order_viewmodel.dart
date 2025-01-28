import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/src/presentation/managers/order/order_state.dart';

import '../../../domain/repositories/order/order_repo.dart';

@injectable
class OrderViewModel extends Cubit<OrderState> {
  final OrderRepo _orderRepo;

  OrderViewModel(this._orderRepo) : super(OrderInitial());

  Future<void> putData() async {
    await _orderRepo.putData();
  }
}
