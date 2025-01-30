import 'package:injectable/injectable.dart';
import 'package:tracking_app/src/domain/entities/order/pending_order_entity.dart';

import '../../repositories/order/order_repository.dart';

@injectable
class OrderDetailsUsecase {
  final OrderRepository _orderRepository;

  OrderDetailsUsecase(this._orderRepository);

  Future<PendingOrderEntity> getOrderDetails() async {
    var orderDetails = await _orderRepository.getPendingOrderById();
    return orderDetails;
  }

  Future<void> updateState(String? id, String state) async {
    await _orderRepository.updateState(id!, state);
  }
}
