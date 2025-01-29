import '../../../api/core/api_response_models/order/pending_orders_response_model.dart' as pending_orders_response_model;
import '../../../api/core/api_response_models/order/start_order_response_model/start_order_response_model.dart'as start_order_response_model;

abstract interface class OrderOnlineDataSource {
  Future<pending_orders_response_model.PendingOrdersResponseModel> getAllPendingOrders();
  Future<void> storeOrder(pending_orders_response_model.Orders orders);

  Future<pending_orders_response_model.Orders> getPendingOrderById(String id);

  Future<start_order_response_model.StartOrderResponseModel> startOrder({required String orderId});

}
