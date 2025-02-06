import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/domain/entities/order/all_driver_orders_entity.dart';
import 'package:tracking_app/src/domain/repositories/order/order_repository.dart';

@injectable
class AllDriverOrdersUsecase {
  OrderRepository _orderRepository;
  AllDriverOrdersUsecase(this._orderRepository);

  Future<ApiResult<AllDriverOrdersEntity>> call() async {
    return await _orderRepository.getAllDriverOrders();
  }
}
