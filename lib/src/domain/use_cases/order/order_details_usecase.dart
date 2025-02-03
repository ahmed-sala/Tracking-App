import 'package:injectable/injectable.dart';
import 'package:tracking_app/src/domain/entities/order/pending_order_entity.dart';

import '../../../../core/common/apis/api_result.dart';
import '../../repositories/order/order_repository.dart';

@injectable
class OrderDetailsUsecase {
  final OrderRepository _orderRepository;

  OrderDetailsUsecase(this._orderRepository);

  Future<ApiResult<PendingOrderEntity>> getOrderDetails() async {
    var orderDetails = await _orderRepository.getPendingOrderById();
    return orderDetails;
  }

  Future<ApiResult<void>> updateState(String? id, String state) async {
    return await _orderRepository.updateState(id!, state);
  }
}
