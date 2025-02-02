import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';

import '../../entities/order/pending_order_entity.dart';
import '../../repositories/order/order_repository.dart';

@injectable
class StoreOrderUseCase  {
  final OrderRepository _orderRepository;
  StoreOrderUseCase(this._orderRepository);
  Future<ApiResult<bool>>invoke({required PendingOrderEntity
  pendingOrderEntity}){

    return _orderRepository.storeOrder(pendingOrderEntity);
  }

}