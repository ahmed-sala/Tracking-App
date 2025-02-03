import 'package:injectable/injectable.dart';

import '../../../../core/common/apis/api_result.dart';
import '../../repositories/order/order_repository.dart';
@injectable
class StartOrderUseCase {
  final OrderRepository _orderRepository;
  StartOrderUseCase(this._orderRepository);
  Future<ApiResult<bool>>invoke({required String orderId}){

    return _orderRepository.startOrder(orderId: orderId);
  }
}