import 'package:tracking_app/src/domain/entities/order/all_driver_orders_entity.dart';

import '../../../../core/common/apis/api_result.dart';
import '../../entities/order/pending_order_entity.dart';

abstract class OrderRepository {
  Future<ApiResult<List<PendingOrderEntity>>> getAllPendingOrders();
  Future<ApiResult<bool>> storeOrder(PendingOrderEntity pendingOrderEntity);
  Future<ApiResult<bool>> startOrder({required String orderId});
  Future<ApiResult<PendingOrderEntity>> getPendingOrderById();
  Future<ApiResult<void>> updateState(String id, String state);
  Future<ApiResult<bool>> removeOrderId({required String orderId});
  Future<ApiResult<AllDriverOrdersEntity>> getAllDriverOrders();
}
