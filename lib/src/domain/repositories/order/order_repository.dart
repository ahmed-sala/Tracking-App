import '../../../../core/common/apis/api_result.dart';
import '../../entities/order/pending_order_entity.dart';

abstract class OrderRepository {
  Future<ApiResult<List<PendingOrderEntity>>> getAllPendingOrders();
  Future<void> storeOrder(PendingOrderEntity pendingOrderEntity);
  Future<PendingOrderEntity> getPendingOrderById();
}
