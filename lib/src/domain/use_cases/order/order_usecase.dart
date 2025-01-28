import 'package:tracking_app/src/domain/repositories/order/order_repo.dart';

class OrderUsecase {
  final OrderRepo _orderRepo;
  OrderUsecase(this._orderRepo);

  Future<void> putData() async {
    return await _orderRepo.putData();
  }
}
