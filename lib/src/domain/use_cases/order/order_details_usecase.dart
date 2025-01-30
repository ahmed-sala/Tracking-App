import 'package:injectable/injectable.dart';
import 'package:tracking_app/src/domain/entities/order/pending_order_entity.dart';

import '../../repositories/order/order_repository.dart';

@injectable
class OrderDetailsUsecase {
  final OrderRepository _orderRepository;

  OrderDetailsUsecase(this._orderRepository);

  Future<PendingOrderEntity> getOrderDetails() async {
    var orderDetails = await _orderRepository.getPendingOrderById();
    print('repo object ${orderDetails.userOrderEntity?.lastName}');
    print('repo object ${orderDetails.userOrderEntity?.firstName}');
    print('repo object ${orderDetails.userOrderEntity?.photo}');
    print('repo object ${orderDetails.userOrderEntity?.phone}');
    return orderDetails;
  }
}
