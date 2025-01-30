import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/helpers/firestore/firestore_services.dart';
import 'package:tracking_app/src/data/api/api_services.dart';

import '../../../api/core/api_response_models/order/pending_orders_response_model.dart';
import 'order_online_data_source.dart';

@Injectable(as: OrderOnlineDataSource)
class OrderOnlineDataSourceImpl implements OrderOnlineDataSource {
  final FirestoreService _firestoreServices;
  final ApiServices _apiServices;
  OrderOnlineDataSourceImpl(this._apiServices, this._firestoreServices);
  @override
  Future<PendingOrdersResponseModel> getAllPendingOrders() async {
    return await _apiServices.getAllPendingOrders();
  }

  @override
  Future<void> storeOrder(Orders orders) async {
    print(orders.toJsonFire());
    return await _firestoreServices.addDocument(
        'accepted_order', orders.toJsonFire());
  }

  @override
  Future<Orders> getPendingOrderById(String id) async {
    var data =
        await _firestoreServices.getDocumentByField('accepted_order', 'id', id);
    print('from fire object ${Orders.fromFire(data!).user?.lastName}');
    print('from fire object ${Orders.fromFire(data!).user?.firstName}');
    print('from fire object ${Orders.fromFire(data!).user?.photo}');
    print('from fire object ${Orders.fromFire(data!).user?.phone}');
    return Orders.fromFire(data!);
  }
}
