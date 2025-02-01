import '../../../../core/common/apis/api_result.dart';
import '../../entities/order/pending_order_entity.dart';

abstract class OrderRepository {
  Future<ApiResult<List<PendingOrderEntity>>> getAllPendingOrders();
  Future<ApiResult<bool>> storeOrder(PendingOrderEntity pendingOrderEntity);
  Future<ApiResult<bool>> startOrder({required String orderId});
  Future<PendingOrderEntity> getPendingOrderById();
  Future<void> storeOrder(PendingOrderEntity pendingOrderEntity);
  Future<ApiResult<PendingOrderEntity>> getPendingOrderById();
  Future<ApiResult<void>> updateState(String id, String state);
}
