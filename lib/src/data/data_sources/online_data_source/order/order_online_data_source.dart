import '../../../api/core/api_response_models/order/pending_orders_response_model.dart';

abstract interface class OrderOnlineDataSource {
  Future<PendingOrdersResponseModel> getAllPendingOrders();
  Future<void> storeOrder(Orders orders);

  Future<Orders> getPendingOrderById(String id);
  Future<void> updateState(String id, String state);
}
