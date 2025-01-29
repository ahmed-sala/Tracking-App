import 'package:injectable/injectable.dart';
import '../../../../../core/helpers/firestore/firestore_services.dart';
import '../../../api/api_services.dart';
import '../../../api/core/api_response_models/order/pending_orders_response_model.dart'
    as pending_orders_response_model;
import '../../../api/core/api_response_models/order/start_order_response_model/start_order_response_model.dart'
    as start_order_response_model;
import '../../../api/core/api_response_models/order/pending_orders_response_model.dart';
import 'order_online_data_source.dart';

@Injectable(as: OrderOnlineDataSource)
class OrderOnlineDataSourceImpl implements OrderOnlineDataSource {
  final FirestoreService _firestoreServices;
  final ApiServices _apiServices;
  OrderOnlineDataSourceImpl(this._apiServices, this._firestoreServices);
  @override
  Future<pending_orders_response_model.PendingOrdersResponseModel>
      getAllPendingOrders() async {
    return await _apiServices.getAllPendingOrders();
  }

  @override
  Future<void> storeOrder(Orders orders) async {
    print(orders.toJsonFire());
    return await _firestoreServices.addDocument(
        'accepted_order', orders.toJsonFire());
  }

  @override
  Future<pending_orders_response_model.Orders> getPendingOrderById(
      String id) async {
    var data =
        await _firestoreServices.getDocumentByField('accepted_order', 'id', id);

    return Orders.fromJson(data!);
  }

  @override
  Future<start_order_response_model.StartOrderResponseModel> startOrder(
      {required String orderId}) async {
    return await _apiServices.startOrder(orderId: orderId);
  }
}
